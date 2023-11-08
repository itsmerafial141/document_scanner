extension StringExtension on String {
  String get removeAllSymbolic {
    return replaceAll(RegExp(r'[^\w\s]+'), "");
  }

  String get replaceNumberToLetter => replaceAll('0', 'O')
      .replaceAll('1', 'I')
      .replaceAll('2', 'Z')
      .replaceAll('4', 'A')
      .replaceAll('5', 'S')
      .replaceAll('6', 'G')
      .replaceAll('7', 'T')
      .replaceAll('8', 'B');

  String get replaceLetterToNumber => replaceAll('O', '0')
      .replaceAll('Q', '0')
      .replaceAll('U', '0')
      .replaceAll('D', '0')
      .replaceAll('I', '1')
      .replaceAll('l', '1')
      .replaceAll('L', '1')
      .replaceAll('Z', '2')
      .replaceAll('e', '2')
      .replaceAll('A', '4')
      .replaceAll('S', '5')
      .replaceAll('T', '7')
      .replaceAll('B', '8')
      .replaceAll('G', '9');
}
