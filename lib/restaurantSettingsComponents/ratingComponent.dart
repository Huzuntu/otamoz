import 'package:flutter/material.dart';
Widget buildStarReview(double width, double height,int reviewCount,double rating) {
    return Positioned(
            left: width-75.33,
            top: 10,
            child: Container(
      width: 65.33,
      height: 70.52,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 65.33,
              height: 70.52,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Color(0xFFD0D2D4)),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 65.33,
              height: 28.85,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 65.33,
                      height: 28.85,
                      decoration: ShapeDecoration(
                        color: Color(0xFF267D3E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 9.15,
                    top: 6.41,
                    child: SizedBox(
                      width: 40.51,
                      height: 19.23,
                      child: Text(
                        '${rating}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 43.12,
                    top: 10.69,
                    child: Container(
                      width: 13.07,
                      height: 10.69,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 13.07,
                              height: 10.69,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://via.placeholder.com/13x11"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: -0.13,
                            top: -0.02,
                            child: Container(
                              width: 13.09,
                              height: 10.82,
                              decoration: BoxDecoration(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 13.07,
            top: 48.08,
            child: SizedBox(
              width: 43.56,
              height: 14.96,
              child: Text(
                'Reviews',
                style: TextStyle(
                  color: Color(0xFF7E8186),
                  fontSize: 10,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 22.87,
            top: 32.06,
            child: SizedBox(
              width: 40.69,
              height: 17.10,
              child: Text(
                '${reviewCount}',
                style: TextStyle(
                  color: Color(0xFF525355),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ),
          ),
        ],
      ),
    ),);
  }