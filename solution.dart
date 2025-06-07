class Solution {
  static const _digits = '123456789';

  bool _isBigger(String leftChar, String rightChar) {
    return _digits.indexOf(leftChar) > _digits.indexOf(rightChar);
  }

  String removeDigit(String number, String digit) {
    if (digit == '1') {
      return number.replaceFirst('1', '');
    }

    int? indexOfLastDigit;
    int? indexToRemove;
    bool gotOnlyDefault = true;

    for (int i = 0; i < number.length; i++) {
      if (number[i] == digit)
      {
        indexOfLastDigit = i;
        indexToRemove ??= i;
        if (i == number.length - 1 && gotOnlyDefault) {
          indexToRemove = i;
        }
        continue;
      }
      if (indexOfLastDigit == i-1 && _isBigger(number[i], digit)) {
        indexToRemove = indexOfLastDigit;
        gotOnlyDefault = false;
        break;
      }
    }

    if (gotOnlyDefault && indexToRemove! < indexOfLastDigit!) indexToRemove = indexOfLastDigit;

    return number.substring(0, indexToRemove) + number.substring(indexToRemove! + 1, number.length);
  }
}
