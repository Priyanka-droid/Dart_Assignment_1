import 'dart:io';
import 'item.dart';
import 'utility.dart';

class ItemsApp {
  static void startApp() {
    List<Item> itemList = [];
    do {
      Item newItem = Utility.inputItems();
      newItem.calculateTax();
      itemList.add(newItem);
      // checking if want another item
      print("Do you want to enter details of any other item? Enter 'y' for" +
          "YES and 'n' for NO (y/n):");
    } while (stdin.readLineSync() == "y");
    Utility.outputItems(itemList);
  }
}
