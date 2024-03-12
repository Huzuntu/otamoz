import 'package:flutter/material.dart';
Widget buildRestaurantInfo(double width,double height,Map<String, dynamic> data) {
    return Positioned(
            left: width/15,
            top: 20,
            child: Container(
      width: width,
      height: height,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 34,
            child: SizedBox(
              width: 63,
              height: 13,
              child: Text(
                data['cuisine'],
                style: TextStyle(
                  color: Color(0xFF525355),
                  fontSize: 13,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 58,
            child: SizedBox(
              width: 192,
              height: 13,
              child: Text(
                '${data['address']} * ${data['distance']} kms',
                style: TextStyle(
                  color: Color(0xFF7E8186),
                  fontSize: 13,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 83,
            child: SizedBox(
              width: 100,
              height: 14,
              child: Text(
                '${data['costForTwo']} TL for two ',
                style: TextStyle(
                  color: Color(0xFF525355),
                  fontSize: 13,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 114,
            child: SizedBox(
              width: 78,
              height: 14,
              child: Text(
                'Open Now ',
                style: TextStyle(
                  color: Color(0xFF267D3E),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 73,
            top: 114,
            child: SizedBox(
              width: 233,
              height: 14,
              child: Text(
                '| 12 noon - 3:30pm, 6:45pm-11:15 pm',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: SizedBox(
              width: 155,
              height: 28,
              child: Text(
                '${data['name']}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: height-61,
            child: Container(
              width: width,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 0.50,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Color(0xFFD0D2D4),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: width/2-30,
            top: height-31,
            child: Transform(
              transform: Matrix4.identity()
                ..translate(0.0, 0.0)
                ..rotateZ(-1.57),
              child: Container(
                width: 30,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 0.50,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Color(0xFFD0D2D4),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 66.38,
            top: height-50,
            child: Container(
              width: 18.51,
              height: 18.41,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 18.51,
                      height: 18.41,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              NetworkImage("https://via.placeholder.com/19x18"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 18.51,
                      height: 18.41,
                      decoration: BoxDecoration(color: Color(0xFFDB1F75)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 6*width/9,
            top: height-50,
            child: Container(
              width: 18.51,
              height: 18.41,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 18.51,
              height: 18.41,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              NetworkImage("https://via.placeholder.com/23x23"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: -0.46,
                    top: -1.38,
                    child: Container(
                      width: 18.51,
              height: 18.41,
                      decoration: BoxDecoration(color: Color(0xFFDB1F75)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),);
  }