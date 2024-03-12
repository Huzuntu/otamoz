import 'package:flutter/material.dart';
import '../restaurantCustomerSettingsScreen.dart';


Widget buildButton(String label, double left, BuildContext context, Map<String, dynamic> user) {
  return Container(
    width: 102,
    height: 35,
    margin: EdgeInsets.only(left: left),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      
      child: Material(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFFD0D2D4)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RestaurantCustomerSettingsScreen( user: user)
          ),);
          },
          child: Center(
            child: Text(label),
          ),
      ),
    ),),
  );
}

Widget buildButtonGroupComponent(double width, double height, double heightTopGroup, Map<String, dynamic> user, BuildContext context) {
  return Positioned(
    left: width / 12,
    top: heightTopGroup,
    child: Container(
      height: 50,
      padding: EdgeInsets.only(top: 15), // Add top padding
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButton('Add Review', 0, context, user),
          buildButton('Add Photo', 10, context, user), // Adjusted left margin
          buildButton('Settings', 10, context, user),  // Adjusted left margin
        ],
      ),
    ),
  );
}
