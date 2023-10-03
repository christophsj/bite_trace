extension NumExtension on num {
  String toStringWithoutTrailingZeros() {
    final RegExp trailingZerosRegex = RegExp(r'([.]*0)(?!.*\d)');
    return toString().replaceAll(trailingZerosRegex, '');
  }
}
