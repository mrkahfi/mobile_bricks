import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../domain/formz/formz.dart';

part 'sign_in_state.freezed.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState({
    @Default(EmailFormz.pure()) EmailFormz email,
    @Default(PasswordFormz.pure()) PasswordFormz password,
    @Default(FormzStatus.pure) FormzStatus status,
  }) = _SignInState;
}
