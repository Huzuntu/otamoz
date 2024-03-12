import 'package:flutter/material.dart';

class RestaurantPageFacilities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title 'About the restaurant'
          Text(
            'Facilities',
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
          SizedBox(height: 10),
          Container(
            child: Column(
              children: [
                buildFacilityRow('Takeaway Available'),
                buildFacilityRow('Full Bar Available'),
                buildFacilityRow('Indoor Seating'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFacilityRow(String facility) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        children: [
          // Location logo (You can replace this with an actual logo)
          Icon(Icons.check_circle, color: Colors.green, size: 24.0),
          const SizedBox(width: 8.0),
          Text(facility),
        ],
      ),
    );
  }
}
