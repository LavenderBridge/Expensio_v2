import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class FirestoreController extends GetxController {
  final String primaryCollection = 'users';
  var Uid = "".obs;

  // var db;

  Future<void> initInstance() async {
    // db = FirebaseFirestore.instance.collection(Uid.value);
    print("calling init");
  }

  Future<void> addData(Map<String, dynamic> data) async {
    try {
      var db = FirebaseFirestore.instance.collection(primaryCollection).doc(Uid.value);
      print(db);
      var userRef = db.collection("user_data");
      await userRef.add(data).then((value) => print("Add complete"));
    } catch (e) {
      print(e);
    }
  }
}
