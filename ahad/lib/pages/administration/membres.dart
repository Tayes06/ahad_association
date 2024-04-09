import 'package:ahad/pages/administration/add_member.dart';
import 'package:flutter/material.dart';

class Membres extends StatefulWidget {
  const Membres({super.key});

  @override
  State<Membres> createState() => _MembresState();
}

class _MembresState extends State<Membres> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddMemberForm()));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.indigo,
        iconTheme: IconThemeData(
          color: Colors.white, // Couleur des icones de l'AppBar
        ),
        title: Row(
          children: const [
            Text(
              "Gestion des membres",
              style: TextStyle(color: Colors.white),
            ), // Titre de l'AppBar
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.message_rounded,
              //color: Colors.white,
            ), // Icône à droite de l'AppBar
            onPressed: () {
              // Action lorsque l'icône est cliquée
            },
          ),
        ],
      ),
      body: Column(
        children: const [],
      ),
    );
  }
}
