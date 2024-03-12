import 'package:flutter/material.dart';
import 'locationComponent.dart';

Widget buildTopBoxComponent(double width, double height, double heightTopGroup,
    double heightTopGroupA, double heightTopGroupB) {
  return Container(
      width: double.infinity,
      height: heightTopGroup,
      decoration: const ShapeDecoration(
        color: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
      ),
      child: Container(
        width: width,
        height: heightTopGroupA,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: width,
                height: 200,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image:
                        AssetImage("assets/images/restaurants/restaurant1.jpg"),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: heightTopGroup - 100,
              child: Container(
                width: width,
                height: heightTopGroupB,
                decoration: ShapeDecoration(
                  color: Color.fromARGB(255, 0, 0, 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
                left: width / 2 - width / 8,
                top: heightTopGroupB + 3 * heightTopGroupA / 5,
                child: buildLocationComponent(width, heightTopGroupB)),
            Positioned(
              left: width / 2 - 28,
              top: heightTopGroup - 128,
              child: Container(
                width: 56,
                height: 56,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 56,
                        height: 56,
                        decoration: ShapeDecoration(
                          color: Color(0xFFD9D9D9),
                          shape: OvalBorder(),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 8.07,
                        height: 18.34,
                        child: Text(
                          'H',
                          style: TextStyle(
                            color: Color(0xFF598AEF),
                            fontSize: 15,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ));
}
