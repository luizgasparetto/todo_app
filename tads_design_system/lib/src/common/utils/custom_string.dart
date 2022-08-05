class CustomString {
  static String ajustString(String name) {
    final nameList = name.split(' ');

    return nameList[0].capitalize();
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
