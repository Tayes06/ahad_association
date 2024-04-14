import 'package:ahad/pages/authentification/screens/connextion_num.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: kBackgroungColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/home_image.png',
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitHeight,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 8,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topCenter, // Centrer l'image
                      child: Image.asset(
                        "assets/logo_ahad.png",
                        height: 150,
                        width: 150,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    const Text(
                      "Bienvenue dans ton\nEspace personnel",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          color: Colors.indigo),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Explore ton association dans les\nMoindres détails partout où tu iras",
                      style: TextStyle(
                          fontSize: 18, color: Colors.deepOrangeAccent),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FormScreen()));
                      },
                      color: Colors.indigo,
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Continuer',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
