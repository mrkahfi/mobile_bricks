import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zot_starter/src/features/auth/domain/models/user.dart';
import 'package:zot_starter/src/utils/delay.dart';
import 'package:zot_starter/src/utils/in_memory_store.dart';

class AuthRepository {
  AuthRepository({this.addDelay = true});
  final bool addDelay;
  final _authState = InMemoryStore<User?>(null);

  Stream<User?> authStateChanges() => _authState.stream;
  User? get currentUser => _authState.value;

  final List<User> _users = [];

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    await delay(addDelay);
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    await delay(addDelay);

    _createNewUser(email, password);
  }

  Future<void> signOut() async {
    _authState.value = null;
  }

  void dispose() => _authState.close();

  void _createNewUser(String email, String password) {
    final user = User(
      uid: email.split('').reversed.join(),
      email: email,
    );
    _users.add(user);
    _authState.value = user;
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final auth = AuthRepository();
  ref.onDispose(() => auth.dispose());
  return auth;
});

final authStateChangesProvider = StreamProvider<User?>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges();
});
