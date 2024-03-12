import 'package:flutter/material.dart';

class CustomerHomepageSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Flexible(
                child: TextField(
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: "Restaurant name or dish name",
                    prefixIcon: Icon(Icons.search, color: Colors.pink),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
