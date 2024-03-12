// tab_button.dart

import 'package:flutter/material.dart';

Widget buildTabButton(String text, VoidCallback onTapCallback) {
  return InkWell(
    onTap: onTapCallback,
    child: Container(
      padding: const EdgeInsets.all(16.0),
      child: Text(text),
    ),
  );
}