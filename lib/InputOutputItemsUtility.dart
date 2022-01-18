import 'dart:io';
import 'Item.dart';

enum ItemTypes { raw, manufactured, imported }

class InputOutputItemsUtility {
  // list containing details of all items wanted
  static List<Item> itemDetails = [];
  static void inputItems() {
    do {
      // taking inputs of item name, item price, item type, item quantity
      print("Enter item name");
      String itemName = stdin.readLineSync()!;
      print("Enter price of item");
      double itemPrice = double.parse(stdin.readLineSync()!);
      print(
          "Enter 0 for raw type\nEnter 1 for manufactured type\nEnter 2 for " +
              "imported type");
      int itemTypeIndex = int.parse(stdin.readLineSync()!);
      ItemTypes itemType = ItemTypes.values[itemTypeIndex];
      print("Enter quantity of item");
      double itemQuantity = double.parse(stdin.readLineSync()!);

      // creating instance of type Item
      Item newItem = new Item(itemName, itemType,
          itemPrice: itemPrice, itemQuantity: itemQuantity);

      // calculating tax for item
      newItem.calculateTax();

      // adding the item details to the list
      itemDetails.add(newItem);

      // checking if want another item
      print("Do you want to enter details of any other item? Enter 'y' for" +
          "YES and 'n' for NO (y/n):");
    } while (stdin.readLineSync() == "y");

    outputItems();
  }

  // print all items in list
  static void outputItems() {
    for (Item item in itemDetails) {
      print("itemName : ${item.itemName} \nitemPrice : ${item.itemPrice} \n" +
          "taxAmount : ${item.taxAmount} \ntotalPrice : ${item.totalPrice}");
    }
  }
}
