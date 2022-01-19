import 'exception_utils.dart';
import 'package:validators/validators.dart';

// validating inputs
class ValidationUtils {
  /* for item name this method checks if given name consist only alphabets*/
  static bool _isAlphabet(String name) {
    if (isAlpha(name)) return true;
    return false;
  }

  /* for item name this method checks if given name starts with capital letter*/
  static bool _isNotCapital(String name) {
    if (name[0].toUpperCase() == name[0]) return false;
    return true;
  }

  /*for given price/quantity this function checks if it is numeric */
  static bool _isNumeric(String data) {
    bool exceptionFlag = true;
    try {
      double value = double.parse(data);
    } catch (e) {
      exceptionFlag = false;
    }
    return exceptionFlag;
  }

  /*for given price this function checks if it is less than or equal to 0 */
  static bool _negativeValue(String data) {
    if (double.parse(data) <= 0) return true;
    return false;
  }

  /*for given item type this function checks if it is a valid type */
  static bool _isValidType(String data) {
    bool exceptionFlag = true;
    switch (data) {
      case "0":
        break;
      case "1":
        break;
      case "2":
        break;
      default:
        exceptionFlag = false;
    }
    return exceptionFlag;
  }

  /*for given quantity this function checks if the quantity is natural number */
  static bool _nonNaturalValue(String data) {
    bool exceptionFlag = false;
    try {
      int value = int.parse(data);
      if (value <= 0) throw NonNaturalQuantityException();
    } on NonNaturalQuantityException {
      exceptionFlag = true;
    } catch (e) {
      exceptionFlag = true;
    }
    return exceptionFlag;
  }

  /*this function validates the name:
    Name should not be an empty string
    Name should contain all alphabets
    Name should start with capital letter
   */
  static bool nameValidation(String name, bool exceptionFlag) {
    try {
      if (name.isEmpty) {
        throw new EmptyNameException();
      }
      if (!_isAlphabet(name)) {
        throw new AlphabetException();
      }
      if (_isNotCapital(name)) {
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

  /* this function validates the price of item:
    Price should not be empty
    Price should be numeric
    Price should be always greater than 0
   */
  static bool priceValidation(String itemPrice, bool exceptionFlag) {
    try {
      if (itemPrice.isEmpty) throw new ItemPriceNullException();
      if (!_isNumeric(itemPrice)) throw new ItemPriceNonNumericException();
      if (_negativeValue(itemPrice)) throw new NonPositivePriceException();
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
      if (!_isNumeric(itemType)) throw new ItemTypeNonNumericException();
      if (!_isValidType(itemType)) throw new InvalidItemTypeException();
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
      if (!_isNumeric(itemQuantity))
        throw new ItemQuantityNonNumericException();
      if (_nonNaturalValue(itemQuantity))
        throw new NonNaturalQuantityException();
    } on ItemQuantityNullException {
      exceptionFlag = true;
      print(ItemQuantityNullException.errMsg());
    } on ItemQuantityNonNumericException {
      exceptionFlag = true;
      print(ItemQuantityNonNumericException.errMsg());
    } on NonNaturalQuantityException {
      exceptionFlag = true;
      print(NonNaturalQuantityException.errMsg());
    }
    return exceptionFlag;
  }
}
