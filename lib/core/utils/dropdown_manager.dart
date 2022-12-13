import 'package:flutter/material.dart';

class DropDownManager {
  List<DropdownMenuItem<int>> dropdownItems(items) {
    List<DropdownMenuItem<int>> menuItems = [];
    for (var item in items) {
      menuItems
          .add(DropdownMenuItem(value: item, child: Text('Season - $item')));
    }
    // List<DropdownMenuItem<String>> menuItems = [
    //   DropdownMenuItem(child: Text("USA"), value: "USA"),
    //   DropdownMenuItem(child: Text("Canada"), value: "Canada"),
    //   DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
    //   DropdownMenuItem(child: Text("England"), value: "England"),
    // ];
    return menuItems;
  }
}
