import 'package:dart_application_1/constants.dart';

enum ItemTypes { raw, manufactured, imported }

class Item {
  final String itemName;
  final ItemTypes itemType;
  final double itemPrice;
  final double itemQuantity;
  late double taxAmount, totalPrice;

  Item(
      {required this.itemName,
      required this.itemType,
      this.itemPrice = 0,
      this.itemQuantity = 0});

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

  // calculating surcharge for imported items
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
}
