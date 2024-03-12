import 'package:flutter/material.dart';

class RestaurantPageAbout extends StatelessWidget {
  final GlobalKey _aboutKey;

  RestaurantPageAbout(this._aboutKey);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _aboutKey,
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title 'About the restaurant'
            Text(
              'About the restaurant',
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
            const SizedBox(height: 16.0), // Adjust the spacing as needed

            // Rectangle container with three columns
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: const Color.fromARGB(255, 193, 193, 193)),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(8), bottom: Radius.circular(8)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // First column
                  Row(
                    children: [
                      // Dolar logo (You can replace this with an actual logo)
                      Icon(Icons.attach_money, color: Colors.green),
                      const SizedBox(width: 8.0),
                      Text('500 TL for two'),
                    ],
                  ),
                  const SizedBox(height: 8.0), // Adjust the spacing as needed

                  // Second column
                  Row(
                    children: [
                      // Dining logo (You can replace this with an actual logo)
                      Icon(Icons.restaurant, color: Colors.green),
                      const SizedBox(width: 8.0),
                      Text('Serves European'),
                    ],
                  ),
                  const SizedBox(height: 8.0), // Adjust the spacing as needed

                  // Third column
                  Row(
                    children: [
                      // Location logo (You can replace this with an actual logo)
                      Icon(Icons.location_on, color: Colors.green),
                      const SizedBox(width: 8.0),
                      Text('324/1 TTK Road, Alwarpet, Chennai'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
