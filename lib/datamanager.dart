import 'dart:convert';

import 'package:coffee_masters/datamodal.dart';
import 'package:http/http.dart' as http;

class DataManager {
  List<Category>? _menu;
  List<ItemInCart> cart = [];

  // fetchMenu() async {
  //   const url = "https://firtman.github.io/coffeemasters/api/menu.json";
  //   var response = await http.get(Uri.parse(url));
  //   if (response.statusCode == 200) {
  //     var body = response.body;
  //     _menu = [];
  //     var decodeData = jsonDecode(body) as List<dynamic>;
  //     for (var json in decodeData) {
  //       _menu!.add(Category(name: json['name'], products: json['products']));
  //     }
  //   }
  // }
  fetchMenu() async {
    try {
      const url = 'https://firtman.github.io/coffeemasters/api/menu.json';
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        _menu = [];
        var decodedData = jsonDecode(response.body) as List<dynamic>;
        for (var json in decodedData) {
          _menu?.add(Category.fromJson(json));
        }
      } else {
        throw Exception("Error loading data");
      }
    } catch (e) {
      throw Exception("Error loading data");
    }
  }

  Future<List<Category>> getMenu() async {
    if (_menu == null) {
      await fetchMenu();
    }
    return _menu!;
  }

  cartAdd(Product p) {
    bool found = false;
    for (var item in cart) {
      if (item.product.id == p.id) {
        item.quantity++;
        found = true;
      }
    }
    if (!found) {
      cart.add(ItemInCart(product: p, quantity: 1));
    }
  }

  cartRemove(Product p) {
    cart.removeWhere((item) => item.product.id == p.id);
  }

  cartClear(Product p) {
    cart.clear();
  }

  double cartTotal(Product p) {
    double total = 0.0;
    for (var item in cart) {
      total += item.quantity * item.product.price;
    }
    return total;
  }
}
