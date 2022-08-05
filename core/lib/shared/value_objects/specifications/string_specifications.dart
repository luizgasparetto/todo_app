class StringSpecifications {
  static bool isSatisfiedBy(String? value) =>
      value != null && value.isNotEmpty && !value.startsWith(' ') && !value.endsWith(' ');
}
