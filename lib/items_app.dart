import 'dart:io';
import 'item.dart';
import 'utility.dart';

class ItemsApp {
  static void startApp() {
    // intial list of items
    List<Item> itemList = [];

    // take input of items till user enters "Yes"
    do {
      Item newItem = Utility.inputItems();
      newItem.calculateTax();
      itemList.add(newItem);
      // checking if want another item
      print("Do you want to enter details of any other item? Enter 'y' for" +
          "YES and 'n' for NO (y/n):");
    } while (stdin.readLineSync() == "y");

    // print the list of items details when no more input is taken
    Utility.outputItems(itemList);
  }
}
