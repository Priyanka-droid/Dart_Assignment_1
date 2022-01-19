import 'exception_utils.dart';
import 'package:validators/validators.dart';

class ValidationUtils {
  static bool isAlphabet(String name) {
    if (isAlpha(name)) return true;
    return false;
  }

  static bool isNotCapital(String name) {
    if (name[0].toUpperCase() == name[0]) return false;
    return true;
  }

  static bool isNumeric(String str) {
    bool exceptionFlag = true;
    try {
      double value = double.parse(str);
    } catch (e) {
      exceptionFlag = false;
    }
    return exceptionFlag;
  }

  static bool negativeValue(String str) {
    if (double.parse(str) <= 0) return true;
    return false;
  }

  static bool isValidType(String str) {
    if (str == '0' || str == '1' || str == '2') return true;
    return false;
  }

  static bool nameValidation(String name, bool exceptionFlag) {
    try {
      if (name.isEmpty) {
        throw new EmptyNameException();
      }
      if (!isAlphabet(name)) {
        throw new AlphabetException();
      }
      if (isNotCapital(name)) {
        throw new CaseException();
      }
    } on EmptyNameException {
      exceptionFlag = true;
      print(EmptyNameException.errMsg());
    } on AlphabetException {
      exceptionFlag = true;
      print(AlphabetException.errMsg());
    } on CaseException {
      exceptionFlag = true;
      print(CaseException.errMsg());
    }
    return exceptionFlag;
  }

  static bool priceValidation(String itemPrice, bool exceptionFlag) {
    try {
      if (itemPrice.isEmpty) throw new ItemPriceNullException();
      if (!isNumeric(itemPrice)) throw new ItemPriceNonNumericException();
      if (negativeValue(itemPrice)) throw new NonPositivePriceException();
    } on ItemPriceNullException {
      exceptionFlag = true;
      print(ItemPriceNullException.errMsg());
    } on ItemPriceNonNumericException {
      exceptionFlag = true;
      print(ItemPriceNonNumericException.errMsg());
    } on NonPositivePriceException {
      exceptionFlag = true;
      print(NonPositivePriceException.errMsg());
    }
    return exceptionFlag;
  }

  static typeValidation(String itemType, bool exceptionFlag) {
    try {
      if (itemType.isEmpty) throw new ItemTypeNullException();
      if (!isNumeric(itemType)) throw new ItemTypeNonNumericException();
      if (!isValidType(itemType)) throw new InvalidItemTypeException();
    } on ItemTypeNullException {
      exceptionFlag = true;
      print(ItemQuantityNullException.errMsg());
    } on ItemTypeNonNumericException {
      exceptionFlag = true;
      print(ItemTypeNonNumericException.errMsg());
    } on InvalidItemTypeException {
      exceptionFlag = true;
      print(InvalidItemTypeException.errMsg());
    }
    return exceptionFlag;
  }

  static quantityValidation(String itemQuantity, bool exceptionFlag) {
    try {
      if (itemQuantity.isEmpty) throw new ItemQuantityNullException();
      if (!isNumeric(itemQuantity)) throw new ItemQuantityNonNumericException();
      if (negativeValue(itemQuantity)) throw new NonPositiveQuantityException();
    } on ItemQuantityNullException {
      exceptionFlag = true;
      print(ItemQuantityNullException.errMsg());
    } on ItemQuantityNonNumericException {
      exceptionFlag = true;
      print(ItemQuantityNonNumericException.errMsg());
    } on NonPositiveQuantityException {
      exceptionFlag = true;
      print(NonPositiveQuantityException.errMsg());
    }
    return exceptionFlag;
  }
}
