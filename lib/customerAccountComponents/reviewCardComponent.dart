import 'package:flutter/material.dart';

Widget buildReviewCard(
    final double width, final double height,final double upperElementEdge) {
  return Positioned(
    left:0,
    top: upperElementEdge+15,
    child:Container(
    width: width,
    height: 245,
    decoration: ShapeDecoration(
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 1, color: Color(0xFFD0D2D4)),
      ),
    ),
    child: Stack(
      children: [
        Positioned(
          left: 0,
          top: 0,
          child: Container(
            width: width,
            height: 245,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Color(0xFF7E8186)),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        Positioned(
          left: 79.16,
          top: 29.14,
          child: SizedBox(
            width: 45,
            height: 22,
            child: Text(
              'Hayri',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
        ),
        Positioned(
          left: 12.18,
          top: 12.95,
          child: Container(
            width: 50.74,
            height: 53.96,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: 50.74,
                    height: 53.96,
                    decoration: ShapeDecoration(
                      color: Color(0xFFD9D9D9),
                      shape: OvalBorder(),
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 13.84,
                  child: SizedBox(
                    width: 10,
                    height: 17.68,
                    child: Text(
                      'H',
                      style: TextStyle(
                        color: Color(0xFF598AEF),
                        fontSize: 16,
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
        Positioned(
          left: 352.15,
          top: 23.74,
          child: Container(
            width: 37.55,
            height: 25.90,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: 37.55,
                    height: 25.90,
                    decoration: ShapeDecoration(
                      color: Color(0xFF267D3E),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                ),
                Positioned(
                  left: 18.27,
                  top: 7.56,
                  child: Container(
                    width: 13.19,
                    height: 14.03,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: StarBorder(
                        points: 5,
                        innerRadiusRatio: 0.38,
                        pointRounding: 0,
                        valleyRounding: 0,
                        rotation: 0,
                        squash: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 6.09,
                  top: 4.32,
                  child: SizedBox(
                    width: 11.16,
                    height: 16.19,
                    child: Text(
                      '4',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
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
        Positioned(
          left: 20.30,
          top: 80.95,
          child: SizedBox(
            width: 362.30,
            height: 36.70,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text:
                        'Specifically downloaded this app to review\n my favourite restaurant, it’s a heaven on Earth ..',
                    style: TextStyle(
                      color: Color(0xFF525355),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  TextSpan(
                    text: 'more',
                    style: TextStyle(
                      color: Color(0xFF525355),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 20.30,
          top: 131.67,
          child: Container(
            width: 124.83,
            height: 102.53,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: NetworkImage("https://via.placeholder.com/125x103"),
                fit: BoxFit.fill,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        Positioned(
          left: 165.42,
          top: 131.67,
          child: Container(
            width: 124.83,
            height: 102.53,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: NetworkImage("https://via.placeholder.com/125x103"),
                fit: BoxFit.fill,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    ),
  ),);
}
