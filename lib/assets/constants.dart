import 'package:flutter/material.dart';

const Gradient mainGradient = LinearGradient(
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
    stops: [0.0, 0.5, 1.0],
    colors: [
      Color(0xFFFF057C),
      Color(0xFF8D0B93),
      Color(0xFF321575),
      
    ]);

const Gradient shimmerGradient = LinearGradient(
  stops: [0.1, 0.3, 0.4, 0.6, 0.7, 1],
  colors: [
    Color(0xFF3a3a3a),
    Color(0xFF3f3f3f),
    Color(0xFF4a4a4a),
    Color(0xFF3f3f3f),
    Color(0xFF3a3a3a),
    Color(0xFF3a3a3a),
  ],
);

const Color mainColor = Color(0xFF4C3F91);