import 'item.dart';
import 'dart:io';

import 'validation_utils.dart';

// use this class to take input and print output
class Utility {
  // taking input of item and returning the item
  static Item inputItems() {
    String itemName;
    String itemPriceString;
    String itemQuantityString;
    String itemTypeIndexString;

    // ask for name while exception thrown
    bool exceptionFlag;
    do {
      exceptionFlag = false;
      print("Enter item name");
      itemName = (stdin.readLineSync()!);
      exceptionFlag = ValidationUtils.nameValidation(itemName, exceptionFlag);
    } while (exceptionFlag);

    // ask for price while exception thrown
    do {
      exceptionFlag = false;
      print("Enter price of item");
      itemPriceString = stdin.readLineSync()!;
      exceptionFlag =
          ValidationUtils.priceValidation(itemPriceString, exceptionFlag);
    } while (exceptionFlag);
    double itemPrice = double.parse(itemPriceString);

    // ask for type while excpetion thrown
    do {
      exceptionFlag = false;
      print(
          "Enter 0 for raw type\nEnter 1 for manufactured type\nEnter 2 for " +
              "imported type");
      itemTypeIndexString = stdin.readLineSync()!;
      exceptionFlag =
          ValidationUtils.typeValidation(itemTypeIndexString, exceptionFlag);
    } while (exceptionFlag);
    int itemTypeIndex = int.parse(itemTypeIndexString);
    ItemTypes itemType = ItemTypes.values[itemTypeIndex];

    // ask for quantity while exception thrown
    do {
      exceptionFlag = false;
      print("Enter quantity of item");
      itemQuantityString = stdin.readLineSync()!;
      exceptionFlag =
          ValidationUtils.priceValidation(itemQuantityString, exceptionFlag);
    } while (exceptionFlag);
    double itemQuantity = double.parse(itemQuantityString);

    // create an instance of Item with input details
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
