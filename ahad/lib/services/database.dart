import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:random_string/random_string.dart';

class DatabaseMethods {
  Future inscrireMembre(Map<String, dynamic> infoMembreMap, String id) async {
    String password = randomAlphaNumeric(8);
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: infoMembreMap["Email"], password: password);
    final docUser = FirebaseFirestore.instance.collection("utilisateurs").doc();
    infoMembreMap["Id"] = docUser.id;
    return await docUser.set(infoMembreMap);
  }
}
