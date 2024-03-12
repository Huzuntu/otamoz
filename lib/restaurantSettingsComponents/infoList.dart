import 'package:flutter/material.dart';
Widget buildPositioned(final double top,final double screenWidth, final double height, final String hint,
      {bool gradient = false}) {
    return Positioned(
    top: top,
    left: (screenWidth - 356) / 2,
    child: SizedBox(
      width: 356,
      height: height,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 356,
            height: height,
            decoration: ShapeDecoration(
              color: gradient ? null : Colors.white,
              gradient: gradient
                  ? const LinearGradient(
                      colors: [Color(0xffB81736), Color(0xff281537)],
                    )
                  : null,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xFFE7E7E7)),
                borderRadius: BorderRadius.circular(14),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 217,
                    height: 24,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: hint,
                        hintStyle: TextStyle(
                          color: Color(0xFF777676),
                          fontSize: 15,
                          fontFamily: 'Barlow',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
  }