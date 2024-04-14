import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String nom;
  final String prenom;
  final String email;
  final String numCNI;
  final String telephone;
  final String adresse;
  final String password;
  final String avatar; // Chemin de l'image de l'avatar
  final String titre;

  User({
    required this.nom,
    required this.prenom,
    required this.email,
    required this.numCNI,
    required this.telephone,
    required this.adresse,
    required this.password,
    required this.avatar,
    required this.titre,
  });

  // Méthode pour convertir les données de Firestore en un objet User
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      nom: map['nom'] ?? '',
      prenom: map['prenom'] ?? '',
      email: map['email'] ?? '',
      numCNI: map['numCNI'] ?? '',
      telephone: map['telephone'] ?? '',
      adresse: map['adresse'] ?? '',
      password: map['password'] ?? '',
      avatar: map['avatar'] ?? '',
      titre: map['titre'] ?? '',
    );
  }
}

// Récupération des utilisateurs depuis Firestore
Future<List<User>> getUsersFromFirestore() async {
  List<User> users = [];

  // Récupération de la collection 'utilisateurs' depuis Firestore
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('utilisateurs').get();

  // Parcours des documents récupérés et création des objets User
  querySnapshot.docs.forEach((doc) {
    if (doc.exists) {
      users.add(User.fromMap(doc.data() as Map<String, dynamic>));
    }
  });

  return users;
}
