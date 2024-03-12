import 'package:flutter/material.dart';

Widget buildLocationComponent(double width, double height) {
  return Container(
    width: width / 3,
    height: height / 2,
    child: Stack(
      children: [
        Positioned(
          left: 27.84,
          top: 9.34,
          child: SizedBox(
            width: 129.91,
            height: 18.69,
            child: Text(
              'Istanbul',
              style: TextStyle(
                color: Color(0xFFD9D9D9),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
        ),
        Positioned(
          left: 27.84,
          top: 28.03,
          child: SizedBox(
            width: 50.11,
            height: 14.95,
            child: Text(
              'Beykent',
              style: TextStyle(
                color: Color(0xFFD9D9D9),
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 11.21,
          child: Container(
            width: 18.56,
            height: 28.03,
            decoration: BoxDecoration(
              color: Colors
                  .blue, // Optional background color for the icon container
              borderRadius: BorderRadius.circular(5), // Optional border radius
            ),
            child: Center(
              child: Icon(
                Icons.arrow_downward,
                color: Colors.white, // Optional color for the icon
                size: 16, // Optional size for the icon
              ),
            ),
          ),
        ),
        Positioned(
          left: 100,
          top: 9.34,
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Colors
                  .blue, // Optional background color for the icon container
              borderRadius: BorderRadius.circular(15), // Optional border radius
            ),
            child: Center(
              child: Icon(
                Icons.location_on,
                color: Colors.white, // Optional color for the icon
                size: 20, // Optional size for the icon
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
