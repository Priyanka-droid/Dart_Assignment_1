import 'item.dart';
import 'dart:io';

// use this class to take input and print output
class Utility {
  // taking input of item and returning the item
  static Item inputItems() {
    print("Enter item name");
    String itemName = stdin.readLineSync()!;
    print("Enter price of item");
    double itemPrice = double.parse(stdin.readLineSync()!);
    print("Enter 0 for raw type\nEnter 1 for manufactured type\nEnter 2 for " +
        "imported type");
    int itemTypeIndex = int.parse(stdin.readLineSync()!);
    ItemTypes itemType = ItemTypes.values[itemTypeIndex];
    print("Enter quantity of item");
    double itemQuantity = double.parse(stdin.readLineSync()!);
    Item newItem = new Item(
        itemName: itemName,
        itemType: itemType,
        itemPrice: itemPrice,
        itemQuantity: itemQuantity);
    return newItem;
  }

  // print the items details in the item list
  static void outputItems(List<Item> itemList) {
    itemList.asMap().forEach((itemNumber, item) {
      print("The details of item $itemNumber \n" +
          "itemName : ${item.itemName} \nitemPrice : ${item.itemPrice} \n" +
          "taxAmount : ${item.taxAmount} \ntotalPrice : ${item.totalPrice}\n");
    });
  }
}
