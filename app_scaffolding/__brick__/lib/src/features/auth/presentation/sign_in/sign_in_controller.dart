import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:{{ packageName }}/src/data/repositories/auth_repository.dart';
import 'package:{{ packageName }}/src/domain/formz/formz.dart';
import 'package:{{ packageName }}/src/features/auth/presentation/sign_in/sign_in_state.dart';

class SignInController extends StateNotifier<SignInState> {
  SignInController(this.ref) : super(const SignInState());

  final Ref ref;

  FormzStatus validate({EmailFormz? email, PasswordFormz? password}) {
    return Formz.validate([email ?? state.email, password ?? state.password]);
  }

  void updateEmail(String value) {
    final email = EmailFormz.dirty(value);
    state = state.copyWith(email: email, status: validate(email: email));
  }

  void updatePassword(String value) {
    final password = PasswordFormz.dirty(value);
    state = state.copyWith(
      password: password,
      status: validate(password: password),
    );
  }

  Future<bool> submit(String email, String password) async {
    state = state.copyWith(value: const AsyncValue.loading());
    final value = await AsyncValue.guard(() => _authenticate(email, password));
    state = state.copyWith(value: value);
    return value.hasError == false;
  }

  Future<void> _authenticate(String email, String password) async {
    await ref
        .read(authRepositoryProvider)
        .signInWithEmailAndPassword(email, password);
  }
}

final signInNotifierProvider =
    StateNotifierProvider<SignInController, SignInState>(
  SignInController.new,
);
