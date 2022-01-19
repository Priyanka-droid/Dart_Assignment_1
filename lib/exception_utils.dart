class EmptyNameException implements Exception {
  static String errMsg() => "Item name is not valid";
}

class AlphabetException implements Exception {
  static String errMsg() => "Name should only contain alphabets";
}

class CaseException implements Exception {
  static String errMsg() => "First letter of name should be capital";
}

class ItemPriceNullException implements Exception {
  static String errMsg() => "Item price can't be null";
}

class ItemPriceNonNumericException implements Exception {
  static String errMsg() => "Item price can only be numeric";
}

class NonPositivePriceException implements Exception {
  static String errMsg() => "Item price should be more than 0";
}

class ItemQuantityNullException implements Exception {
  static String errMsg() => "Item Quantity can't be null";
}

class ItemQuantityNonNumericException implements Exception {
  static String errMsg() => "Item Quantity can only be numeric";
}

class NonPositiveQuantityException implements Exception {
  static String errMsg() => "Item Quantity should be more than 0";
}

class ItemTypeNullException implements Exception {
  static String errMsg() => "Item type can't be null";
}

class ItemTypeNonNumericException implements Exception {
  static String errMsg() => "Item type can only be numeric";
}

class InvalidItemTypeException implements Exception {
  static String errMsg() => "Item type should be 0 or 1 or 2";
}
