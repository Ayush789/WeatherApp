import 'package:flutter/material.dart';

int TimeOfDay() {
  int hr = DateTime.now().hour;
  //return hr ~/ 6;
  return 5;
}

String Wallpaper() {
  switch (TimeOfDay()) {
    case 0:
      return 'assets/w1.png';
    case 1:
      return 'assets/w2.png';
    case 2:
      return 'assets/w3.png';
    case 3:
      return 'assets/w4.png';
    case 4:
      return 'assets/w5.png';
    case 5:
      return 'assets/w6.png';
  }
}

Color baseColor() {
  switch (TimeOfDay()) {
    case 0:
      return Color(0xfff0ffd6);
    case 1:
      return Color(0xfffec86f);
    case 2:
      return Color(0xffebebef);
    case 3:
      return Color(0xffebebef);
    case 4:
      return Color(0xffffffbc);
    case 5:
      return Color(0xffffffbc);
  }
}


Color mainColor() {
  switch (TimeOfDay()) {
    case 0:
      return Color(0xffffd800);
    case 1:
      return Color(0xfffdd38b);
    case 2:
      return Color(0xffa8a3c5);
    case 3:
      return Color(0xffa8a3c5);
    case 4:
      return Color(0xffa8a3c5);
    case 5:
      return Color(0xffffd800);
  }
}


Color secondaryColor() {
  switch (TimeOfDay()) {
    case 0:
      return Colors.black;
    case 1:
      return Colors.black;
    case 2:
      return Colors.white;
    case 3:
      return Colors.white;
    case 4:
      return Colors.white;
    case 5:
      return Colors.black;
  }
}

Color textColor() {
  switch (TimeOfDay()) {
    case 0:
      return Colors.black;
    case 1:
      return Colors.white;
    case 2:
      return Colors.white;
    case 3:
      return Colors.white;
    case 4:
      return Colors.white;
    case 5:
      return Colors.black;
  }
}

