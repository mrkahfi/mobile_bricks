import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:{{ packageName }}/src/features/auth/domain/formz/formz.dart';
import 'package:{{ packageName }}/src/features/auth/presentation/sign_in/sign_in_state.dart';
import 'package:{{ packageName }}/src/repositories/auth_repository.dart';

class SignInController extends StateNotifier<SignInState> {
  SignInController({
    required this.authRepository,
  }) : super(const SignInState());

  final AuthRepository authRepository;

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

  Future<void> _authenticate(String email, String password) {
    return authRepository.createUserWithEmailAndPassword(email, password);
  }
}

final signInNotifierProvider =
    StateNotifierProvider<SignInController, SignInState>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return SignInController(authRepository: authRepository);
});
