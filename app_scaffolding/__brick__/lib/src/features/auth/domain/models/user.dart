/// Simple class representing the user UID and email.
class User {
  const User({
    required this.uid,
    required this.email,
  });
  final String uid;
  final String email;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User && other.uid == uid && other.email == email;
  }

  @override
  int get hashCode => uid.hashCode ^ email.hashCode;

  @override
  String toString() => 'AppUser(uid: $uid, email: $email)';
}
