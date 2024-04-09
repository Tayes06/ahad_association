import 'package:ahad/model/dashbord.dart';
import 'package:flutter/material.dart';
import 'package:ahad/pages/constants.dart';

class Acceuil extends StatefulWidget {
  const Acceuil({super.key});

  @override
  State<Acceuil> createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.indigo,
          iconTheme: IconThemeData(
            color: Colors.white, // Couleur des icones de l'AppBar
          ),
          title: Row(
            children: const [
              Text(
                "Tableau de bord",
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
        body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
              padding: EdgeInsets.all(defaultPadding),
              child: Column(
                children: [
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Tableau de bord",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                SizedBox(
                                  height: defaultPadding,
                                ),
                              ],
                            ),
                            GridView.builder(
                              shrinkWrap: true,
                              itemCount: mesChamps1.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: defaultPadding,
                                childAspectRatio: 1,
                              ),
                              itemBuilder: (context, index) =>
                                  InfoCard(info: mesChamps1[index]),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            GridView.builder(
                              shrinkWrap: true,
                              itemCount: mesChamps2.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: defaultPadding,
                                childAspectRatio: 1,
                              ),
                              itemBuilder: (context, index) =>
                                  InfoCard(info: mesChamps2[index]),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recents",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(
                        height: defaultPadding + 5,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        height: defaultPadding,
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(defaultPadding),
                          decoration: const BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Tontine",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "Sortie en caiss..",
                                style: TextStyle(color: Colors.white70),
                              ),
                              Text(
                                "20/04/24",
                                style: TextStyle(color: Colors.white54),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )),
        ));
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.info,
  });
  final DashboardInfo info;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(defaultPadding * 0.75),
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    color: info.color,
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Image.asset(
                  info.SvgSrc,
                  //color: info.color,
                ),
              ),
              Icon(
                Icons.more_vert,
                color: Colors.white54,
              )
            ],
          ),
          Text(
            info.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          ProgressLine(
            color: info.color,
            percentage: info.percentage,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${info.person}",
                style: TextStyle(color: Colors.white),
              ),
              Text(
                info.totalPerson,
                style: TextStyle(color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    super.key,
    required this.color,
    required this.percentage,
  });

  final Color color;
  final int percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
              color: color.withOpacity(0.5),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * (percentage / 100),
            height: 5,
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
        )
      ],
    );
  }
}
