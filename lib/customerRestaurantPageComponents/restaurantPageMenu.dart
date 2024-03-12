import 'package:flutter/material.dart';


class RestaurantPageMenu extends StatelessWidget {
  final GlobalKey _menuKey;

  RestaurantPageMenu(this._menuKey);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _menuKey,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 250,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Menu',
                        style: TextStyle(fontSize: 24, color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Last updated 2 months ago',
                        style: TextStyle(color: Color(0xFFDB1F75)),
                      ),
                    ),
                  ],
                ),
              ),

              Row(
                children: [
                  _buildMenuSection(
                    title: 'Main Course',
                    items: ['Hamburger 220 TL', 'Pizza 350 TL', 'Pasta 160 TL'],
                  ),
                  const SizedBox(width: 100),
                  _buildMenuSection(
                    title: 'Desserts',
                    items: ['Tiramisu 160 TL', 'Strawberry Milkshake 90 TL', 'Ice Cream 80 TL'],
                  ),
                  const SizedBox(width: 100),
                  _buildMenuSection(
                    title: 'Drinks',
                    items: ['Cola 40 TL', 'Ice Tea 40 TL', 'Water 15 TL'],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuSection({required String title, required List<String> items}) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          for (var item in items) ...[
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(item),
            ),
          ],
        ],
      ),
    );
  }
}
