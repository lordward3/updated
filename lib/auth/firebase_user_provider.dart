import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class UpdatedFirebaseUser {
  UpdatedFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

UpdatedFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<UpdatedFirebaseUser> updatedFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<UpdatedFirebaseUser>(
        (user) => currentUser = UpdatedFirebaseUser(user));
