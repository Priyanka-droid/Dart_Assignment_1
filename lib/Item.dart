import 'package:dart_application_1/InputItemsUtility.dart';
import 'package:dart_application_1/constants.dart';
import 'InputItemsUtility.dart';

class Item {
  String? itemName;
  ItemTypes? itemType;
  double? itemPrice;
  double? itemQuantity;
  double? taxAmount, totalPrice;

  Item(this.itemName, this.itemType, {this.itemPrice, this.itemQuantity});

  // calculating tax for item based on it's type
  double? calculateTax() {
    switch (itemType) {
      case ItemTypes.raw:
        taxAmount = Constants.BASE_TAX * (itemPrice ?? 0);
        break;
      case ItemTypes.manufactured:
        taxAmount = Constants.BASE_TAX * (itemPrice ?? 0) +
            Constants.ADDITIONAL_TAX *
                ((itemPrice ?? 0) + Constants.BASE_TAX * (itemPrice ?? 0));
        break;
      case ItemTypes.imported:
        taxAmount = Constants.IMPORT_DUTY * (itemPrice ?? 0);
        taxAmount = (taxAmount ?? 0) + (_calculateSurcharge() ?? 0);
        break;
      default:
        print("enter a valid type");
    }
    totalPrice = (itemPrice ?? 0) + (taxAmount ?? 0);
  }

  double? _calculateSurcharge() {
    double surCharge;
    if ((itemPrice ?? 0) + (taxAmount ?? 0) <= 100) {
      return Constants.SURCHARGE_UPTO_100;
    } else if ((itemPrice ?? 0) + (taxAmount ?? 0) > 100 &&
        (itemPrice ?? 0) + (taxAmount ?? 0) <= 200) {
      return Constants.SURCHARGE_UPTO_200;
    } else {
      return Constants.SURCHARGE_AFTER_200 *
          ((itemPrice ?? 0) + (taxAmount ?? 0));
    }
  }

  // printing details of item
  void printCalculatedItemDetails() {
    print("itemName : $itemName :: itemPrice : $itemPrice :: " +
        "taxAmount : $taxAmount :: totalPrice : $totalPrice");
  }
}
