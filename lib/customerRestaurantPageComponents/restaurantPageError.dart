import 'package:flutter/material.dart';

class RestaurantPageError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 166, 172, 139), // Use the specified color
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Found an error reporting ? Help us rectify it.',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              // Handle "Report error" button press
              print('Report error button clicked');
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
              foregroundColor: MaterialStateProperty.all<Color>(const Color(0xFFDB1F75)),
            ),
            child: Text('Report error'),
          ),
        ],
      ),
    );
  }
}
