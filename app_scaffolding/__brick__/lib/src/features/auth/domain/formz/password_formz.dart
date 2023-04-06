import 'package:formz/formz.dart';
import 'package:{{ packageName }}/src/utils/validators/string_validators.dart';

enum PasswordValidationError {
  empty,
  tooShort,
  invalid,
  ;

  String getMessage() {
    switch (this) {
      case empty:
        return 'Password can\'t be empty';
      case tooShort:
        return 'Password is too short';
      case invalid:
        return 'Must contain at least 1 characters and 1 symbol';
    }
  }
}

class PasswordFormz extends FormzInput<String, PasswordValidationError> {
  const PasswordFormz.pure() : super.pure('');

  const PasswordFormz.dirty(String value) : super.dirty(value);

  @override
  PasswordValidationError? validator(String value) {
    if (!NonEmptyStringValidator().isValid(value)) {
      return PasswordValidationError.empty;
    }

    if (!MinLengthStringValidator(4).isValid(value)) {
      return PasswordValidationError.tooShort;
    }

    if (!PasswordSubmitRegexValidator().isValid(value)) {
      return PasswordValidationError.invalid;
    }

    return null;
  }
}
