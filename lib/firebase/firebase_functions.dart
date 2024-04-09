import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/list_notifier.dart';

class FirebaseFunctions {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? get currentUser => _auth.currentUser;

  // Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<void> email_signin(String emailAddress, String password) async {
    await _auth
        .signInWithEmailAndPassword(email: emailAddress, password: password)
        .then((value) {
      Get.offAllNamed('/all');
    });
  }

  Future<void> new_user(String emailAddress, String password) async {
    await _auth
        .createUserWithEmailAndPassword(email: emailAddress, password: password);
        // .then((value) {email_signin(emailAddress, password);});
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
