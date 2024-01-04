import 'package:flutter/material.dart';

extension MediaQueryValues on BuildContext {
  double get scrHeight => MediaQuery.sizeOf(this).height;
  double get scrWidth => MediaQuery.sizeOf(this).width ;
}

extension ParseInteger on String {

  int parseInt() {
    return int.parse(this);
  }

}