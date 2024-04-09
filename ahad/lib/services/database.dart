import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future inscrireMembre(Map<String, dynamic> infoMembreMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Membre")
        .doc(id)
        .set(infoMembreMap);
  }
}
