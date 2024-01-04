import 'package:flutter/material.dart';

class MainScreenVM with ChangeNotifier {

  int _selectedIndex = 1;
  int get selectedIndex => _selectedIndex;
  setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }



}