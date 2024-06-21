import 'dart:math';

import 'package:flutter/material.dart';

Color getRandomColor() {
  Random random = Random();
  return Color.fromARGB(
    255, // Alpha value (255 is fully opaque)
    random.nextInt(256), // Red value
    random.nextInt(256), // Green value
    random.nextInt(256), // Blue value
  );
}
