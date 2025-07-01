extension StringExt on String {
  bool parseBool() {
    return toLowerCase() == 'true';
  }

  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
