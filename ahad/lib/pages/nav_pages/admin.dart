import 'package:ahad/pages/administration/membres.dart';
import 'package:ahad/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.indigo,
        iconTheme: const IconThemeData(
          color: Colors.white, // Couleur des icones de l'AppBar
        ),
        title: const Row(
          children: [
            Text(
              "Administration",
              style: TextStyle(color: Colors.white),
            ), // Titre de l'AppBar
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.message_rounded,
              //color: Colors.white,
            ), // Icône à droite de l'AppBar
            onPressed: () {
              // Action lorsque l'icône est cliquée
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        //physics: NeverScrollableScrollPhysics(), // Désactive le défilement
        child: Stack(
          children: <Widget>[
            Container(
              //une taille de 15% de la hauteur totale pour ce container
              height: size.height * .45,
              decoration: const BoxDecoration(
                color: Colors.indigoAccent,
                // image: DecorationImage(
                //   alignment: Alignment.centerLeft,
                //   image:
                //       AssetImage("assets/images/background_header_admin.jpg"),
                // ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topRight,
                      child: SizedBox(
                        height: 52,
                        width: 52,
                      ),
                    ),
                    Text(
                      "Consulte et apporte des configurations necessaires à cette association",
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                color: Color.fromARGB(255, 241, 240, 240),
                                fontWeight: FontWeight.w400,
                              ),
                    ),

                    /***** Barre de recherche *****/
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 2),
                      /*decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(29.5),
                      ),
                      /****** Barre de recherche ******/

                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Rechercher",
                          prefixIcon: Icon(Icons.search),
                          border: InputBorder.none,
                        ),
                      ),*/
                    ),
                    GridView.count(
                      shrinkWrap: true, // Ajout de cette propriété
                      crossAxisCount: 2,
                      childAspectRatio: .95,
                      crossAxisSpacing: 35,
                      mainAxisSpacing: 15,
                      children: const <Widget>[
                        CategoriCard(
                          svgSrc: "",
                          title: 'Membres',
                          direction: Membres(),
                        ),
                        CategoriCard(
                          svgSrc: "",
                          title: 'Grande Tontine',
                          direction: Home(),
                        ),
                        CategoriCard(
                          svgSrc: "",
                          title: 'Présence',
                          direction: Home(),
                        ),
                        CategoriCard(
                          svgSrc: "",
                          title: 'Epargne',
                          direction: Home(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoriCard extends StatelessWidget {
  final String svgSrc;
  final String title;
  //final Function press;
  final Widget direction;
  const CategoriCard({
    super.key,
    required this.svgSrc,
    required this.title,
    required this.direction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            //color: secondaryColor.withOpacity(0.5),
            color: Colors.black.withOpacity(0.5), // Couleur de l'ombre
            spreadRadius: 2, // Étendue de l'ombre
            blurRadius: 5, // Flou de l'ombre
            offset: Offset(1, 3), // Décalage de l'ombre
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => direction));
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Spacer(),
                SvgPicture.asset(svgSrc),
                Icon(
                  Icons.people_alt,
                  size: 50,
                ),
                Spacer(),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
