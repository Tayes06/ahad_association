import 'dart:ui';

import 'package:ahad/pages/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:random_string/random_string.dart';

class FormAjoutMembre extends StatefulWidget {
  const FormAjoutMembre({super.key});

  @override
  State<FormAjoutMembre> createState() => _FormAjoutMembreState();
}

class _FormAjoutMembreState extends State<FormAjoutMembre> {
  final users = FirebaseFirestore.instance.collection('utilisateurs').doc();
  //final _formKey = GlobalKey<FormState>();
  String nom = "";
  String prenom = "";
  String email = "";
  String telephone = "";
  String adresse = "";
  String password = "";
  String numCNI = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: const [
                Text(
                  "Inscrire un nouveau membre",
                  style: TextStyle(color: Colors.white),
                ), // Titre de l'AppBar
              ],
            ),
            backgroundColor: primaryColor,
          ),
          body: SingleChildScrollView(
            child: Column(
              //key: _formKey,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (value) {
                      nom = value;
                    },
                    decoration: InputDecoration(
                        labelText: "Nom", border: OutlineInputBorder()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (value) {
                      prenom = value;
                    },
                    decoration: InputDecoration(
                        labelText: "Prénom", border: OutlineInputBorder()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: InputDecoration(
                        labelText: "Email", border: OutlineInputBorder()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (value) {
                      numCNI = value;
                    },
                    decoration: InputDecoration(
                        labelText: "Numéro CNI", border: OutlineInputBorder()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (value) {
                      telephone = value;
                    },
                    decoration: InputDecoration(
                        labelText: "Téléphone", border: OutlineInputBorder()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (value) {
                      adresse = value;
                    },
                    decoration: InputDecoration(
                        labelText: "Adresse", border: OutlineInputBorder()),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final json = {
                      'id': users.id,
                      'nom': nom,
                      'prenom': prenom,
                      'email': email,
                      'telephone': telephone,
                      'numCNI': numCNI,
                      'adresse': adresse,
                      'password': randomAlphaNumeric(8),
                      'avatar': ' ',
                      'titre': ' ',
                    };
                    await users.set(json).then((value) => print('User added'));
                    FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: json['email']!, password: json['password']!);

                    //_formKey.currentState?.reset();
                    /*final Email send_email = Email(
                      body:
                          "Un responsable de l'association vient de vous inscrire sur la plateforme numerique. \nCeci est votre mot de passe pour vous connecter sur l'application: $json['password']. \n Ne le partagez avec personne. Vous pouvez le modifier une fois connecté sur la plateforme",
                      subject: 'AHAD - Votre Pass de connexion',
                      recipients: [json['email']!],
                      //cc: ['example_cc@ex.com'],
                      //bcc: ['example_bcc@ex.com'],
                      //attachmentPaths: ['/path/to/email_attachment.zip'],
                      isHTML: false,
                    );

                    await FlutterEmailSender.send(send_email); // Reset the form*/
                  },
                  child: Text("Inscrire"),
                ),
              ],
            ),
          )),
    );
  }
}

class FormHeaderWidget {}
