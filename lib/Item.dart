import 'package:dart_application_1/constants.dart';
import 'InputOutputItemsUtility.dart';

class Item {
  String itemName;
  ItemTypes itemType;
  double itemPrice;
  double itemQuantity;
  double taxAmount = 0, totalPrice = 0;

  Item(this.itemName, this.itemType,
      {this.itemPrice = 0, this.itemQuantity = 0});

  // calculating tax for item based on it's type
  void calculateTax() {
    switch (itemType) {
      case ItemTypes.raw:
        taxAmount = Constants.BASE_TAX * itemPrice;
        break;
      case ItemTypes.manufactured:
        taxAmount = Constants.BASE_TAX * itemPrice +
            Constants.ADDITIONAL_TAX * itemPrice +
            Constants.BASE_TAX * itemPrice;
        break;
      case ItemTypes.imported:
        taxAmount = Constants.IMPORT_DUTY * itemPrice;
        taxAmount = taxAmount + _calculateSurcharge();
        break;
      default:
        print("enter a valid type");
    }
    totalPrice = itemPrice + taxAmount;
  }

  double _calculateSurcharge() {
    double surCharge;
    if (itemPrice + taxAmount <= 100) {
      return Constants.SURCHARGE_UPTO_100;
    } else if (itemPrice + taxAmount > 100 && itemPrice + taxAmount <= 200) {
      return Constants.SURCHARGE_UPTO_200;
    } else {
      return Constants.SURCHARGE_AFTER_200 * (itemPrice + taxAmount);
    }
  }

  // printing details of item
  void printCalculatedItemDetails() {
    print("itemName : $itemName :: itemPrice : $itemPrice :: " +
        "taxAmount : $taxAmount :: totalPrice : $totalPrice");
  }
}
