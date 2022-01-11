import 'dart:io';
import 'dart:convert';

class Item {
  var itemName, itemPrice, itemType, itemQuantity;
  var taxAmount, totalPrice;

  Item(itemName, itemType, {itemPrice, itemQuantity}) {
    this.itemName = itemName;
    this.itemType = itemType;
    this.itemPrice = int.parse(itemPrice);
    this.itemQuantity = itemQuantity;
  }

  // calculating tax for item based on it's type
  void calculateTax() {
    if (itemType == "raw") {
      taxAmount = 0.125 * itemPrice;
    }
    if (itemType == "manufactured") {
      taxAmount = 0.125 * itemPrice + 0.02 * (itemPrice + 0.125 * itemPrice);
    }
    if (itemType == "imported") {
      taxAmount = 0.10 * itemPrice;
      var surCharge;
      if (itemPrice + taxAmount <= 100) {
        surCharge = 5;
      } else if (itemPrice + taxAmount > 100 && itemPrice + taxAmount <= 200) {
        surCharge = 10;
      } else {
        surCharge = 0.05 * (itemPrice + taxAmount);
      }
      taxAmount += surCharge;
    }

    totalPrice = itemPrice + taxAmount;
  }

  // printing details of item
  void PrintCalculatedItemDetails() {
    print(
        "itemName : $itemName :: itemPrice : $itemPrice :: taxAmount : $taxAmount :: totalPrice : $totalPrice");
  }
}

void main() {
  do {
    // taking inputs of item name, item price, item type, item quantity
    print("name");
    var itemName = stdin.readLineSync();
    print("price");
    var itemPrice = stdin.readLineSync();
    print("type");
    var itemType = stdin.readLineSync();
    print("quantity");
    var itemQuantity = stdin.readLineSync();
    print("$itemName , $itemType, $itemPrice, $itemQuantity ");

    // creating instance of type Item
    Item newItem = new Item(itemName, itemType,
        itemPrice: itemPrice, itemQuantity: itemQuantity);

    // calculating tax for item
    newItem.calculateTax();

    // printing details of item
    newItem.PrintCalculatedItemDetails();

    // checking if want another item
    print("Do you want to enter details of any other item (y/n):");
  } while (stdin.readLineSync() == "y");
}
