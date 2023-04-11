/// Simple class representing the user UID and email.
class User {
  const User({
    required this.uid,
    required this.email,
  });
  final String uid;
  final String email;

  @override
  String toString() => 'AppUser(uid: $uid, email: $email)';
}
