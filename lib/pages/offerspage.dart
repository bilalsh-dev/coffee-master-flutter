import 'package:flutter/material.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Wrap(
        children: [
          Offer(
            title: "My great Offer",
            description: "Buy 1 get 10 for free",
          ),
          Offer(
            title: "My great Offer",
            description: "Buy 1 get 10 for free",
          ),
          Offer(
            title: "My great Offer",
            description: "Buy 1 get 10 for free",
          ),
          Offer(
            title: "My great Offer",
            description: "Buy 1 get 10 for free",
          ),
          Offer(
            title: "My great Offer",
            description: "Buy 1 get 10 for free",
          ),
          Offer(
            title: "My great Offer",
            description: "Buy 1 get 10 for free",
          ),
          Offer(
            title: "My great Offer",
            description: "Buy 1 get 10 for free",
          ),
        ],
      ),
    );
  }
}

class Offer extends StatelessWidget {
  final String title;
  final String description;
  const Offer({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 300,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.amber.shade50,
          elevation: 7,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("images/background.png"),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Container(
                    color: Colors.amber.shade100,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Container(
                    color: Colors.amber.shade100,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        description,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
