import 'package:email_validator/email_validator.dart';
import 'package:ilurama_theme/ilurama_theme.dart';
import 'package:logging/logging.dart';

import '../../ui/widgets/section_header.dart';

final _log = Logger('StringExtension');

extension ExtendedString on String {
  Widget get asSectionHeader => SectionHeader(this);

  ///@ Logs the string and returns it
  String toLog() {
    _log.info(this);
    return this;
  }

  ///@ Finds a hex color string and returns it or returns #FFFFFF if no valid hex color string found
  String get colorHexString => RegExp(r'#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})').firstMatch(this)?.group(0) ?? '#FFFFFF';

  //- EMAIL VALIDATION

  bool get isValidEmail => EmailValidator.validate(this);

  //- PASSWORD VALIDATION

  /// Checks if password has minLength
  bool hasMinLength(int minLength) => length >= minLength;

  /// Checks if password has at least normal char letter matches
  bool hasMinNormalChar(int normalCount) {
    String pattern = '^(.*?[A-Z]){$normalCount,}';
    return toUpperCase().contains(RegExp(pattern));
  }

  /// Checks if password has at least uppercaseCount uppercase letter matches
  bool hasMinUppercase(int uppercaseCount) {
    String pattern = '^(.*?[A-Z]){$uppercaseCount,}';
    return contains(RegExp(pattern));
  }

  /// Checks if password has at least numericCount numeric character matches
  bool hasMinNumericChar(int numericCount) {
    String pattern = '^(.*?[0-9]){$numericCount,}';
    return contains(RegExp(pattern));
  }

  //Checks if password has at least specialCount special character matches
  bool hasMinSpecialChar(int specialCount) {
    String pattern =
        // ignore: prefer_interpolation_to_compose_strings
        r"^(.*?[$&+,\:;/=?@#|'<>.^*()_%!-]){" + specialCount.toString() + ',}';
    return contains(RegExp(pattern));
  }
}
