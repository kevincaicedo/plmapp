import 'package:plmapp/utils/regex.dart';

extension Validation on String {
  bool isEmailValid() {
    return Regex.emailRegExp.hasMatch(this);
  }

  bool get isBlankOrNull => this == null || this.trim().length == 0;
  bool get isNumber => int.tryParse(this) != null;
  int get toIntOrNull => int.tryParse(this);
}
