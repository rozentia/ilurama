class PasswordValidator {
  /// Checks if password has minLength
  bool hasMinLength(String password, int minLength) {
    return password.length >= minLength ? true : false;
  }

  /// Checks if password has at least normal char letter matches
  bool hasMinNormalChar(String password, int normalCount) {
    String pattern = '^(.*?[A-Z]){$normalCount,}';
    return password.toUpperCase().contains(RegExp(pattern));
  }

  /// Checks if password has at least uppercaseCount uppercase letter matches
  bool hasMinUppercase(String password, int uppercaseCount) {
    String pattern = '^(.*?[A-Z]){$uppercaseCount,}';
    return password.contains(RegExp(pattern));
  }

  /// Checks if password has at least numericCount numeric character matches
  bool hasMinNumericChar(String password, int numericCount) {
    String pattern = '^(.*?[0-9]){$numericCount,}';
    return password.contains(RegExp(pattern));
  }

  //Checks if password has at least specialCount special character matches
  bool hasMinSpecialChar(String password, int specialCount) {
    String pattern =
        // ignore: prefer_interpolation_to_compose_strings
        r"^(.*?[$&+,\:;/=?@#|'<>.^*()_%!-]){" + specialCount.toString() + ',}';
    return password.contains(RegExp(pattern));
  }
}
