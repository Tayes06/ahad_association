/*import 'package:ahad/pages/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async {
    await _db
        .collection("Utilisateurs")
        .add(user.toJson())
        .whenComplete(
          () => Get.snackbar("Bingo!", "Nouveau membre inscrit avec succès.",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: primaryColor.withOpacity(0.1),
              colorText: Colors.green),
        )
        .catchError((error, StackTrace) {
      Get.snackbar("Erreur!", "Une erreur s'est produite. Veuillez reessayer",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          borderColor: Colors.red);
      print(error.toString());
    });
  }
}*/
