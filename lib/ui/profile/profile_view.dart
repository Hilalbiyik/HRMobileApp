import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hr_mobile_app/constants/constants.dart';

class ProfilView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double navBarWidth = MediaQuery.of(context).size.width * 1.0;
    final double navBarHeight = MediaQuery.of(context).size.width * 1.2;
  
    return Scaffold(
    appBar: buildAppBar(context),
        backgroundColor: ConstantsColor.bodyColor,
        body: SafeArea(
          child: Column(
            children: [
              buildProfileItems(ConstantsAdress.avatarImage, context),
              Container(
                  width: navBarWidth,
                  height: navBarHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white,
                  ),
                  child: Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        buildStatsCards(context),
                        buildUpdatesCards(context),
                      ],
                    ),
                  )),
            ],
          ),
        ));
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
  leading: Padding(
    padding: const EdgeInsets.all(6.0),
    child: Container(
      decoration: customBoxDecoration(),
      child: IconButton(
        onPressed: () {
         Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back),
        color: Colors.black,
      ),
    ),
  ),
  actions: [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: customBoxDecoration(),
        child: IconButton(
          icon: Icon(Icons.add),
          color: Colors.black,
          onPressed: () {},
        ),
      ),
    ),
  ],
  title: Center(
      child: Text(
    "Developer",
    style: GoogleFonts.outfit(
        textStyle: textTheme.subtitle2, color: Colors.black),
  )),
  backgroundColor: Colors.transparent,
  elevation: 0,
);
  }

  Expanded buildUpdatesCards(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Last updates',
              style: GoogleFonts.outfit(
                  textStyle: textTheme.headline6, color: Colors.black),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            padding: EdgeInsets.all(6),
            child: Column(
              children: [
                CustomCard(
                  title: "General",
                  description:
                      "Sam did a great job when meeting newcomers in the office yesterday.I'm proud of him 🤖 ",
                ),
                CustomCard(
                  title: "Attidude",
                  description:
                      "Sam took the extra effort to help me with my project last week. He's a five - star teamled!",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Expanded buildStatsCards(BuildContext context) {
    return Expanded(
        flex: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Padding(
                padding: const EdgeInsets.only(left: 6, top: 10),
                child: Text(
                  'Stats',
                  style: GoogleFonts.outfit(
                      textStyle: textTheme.headline6, color: Colors.black),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  const Expanded(
                    child: buildCardItem(
                      text: 'likes',
                      iconData: Icons.favorite,
                      text2: '5',
                      iconColor: ConstantsColor.redColor,
                    ),
                  ),
                  Expanded(
                    child: buildCardItem(
                      text: 'thanks',
                      text2: '8',
                      iconColor: ConstantsColor.purpleColor,
                      iconData: Icons.thumb_up,
                    ),
                  ),
                  Expanded(
                    child: buildCardItem(
                      text: 'credits',
                      text2: '20',
                      iconColor: ConstantsColor.blueColor,
                      iconData: Icons.workspace_premium,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Expanded buildProfileItems(String avatarImage, BuildContext context) {
    return Expanded(
        flex: 4,
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(avatarImage),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Sam Smith',
                style: GoogleFonts.outfit(
                    textStyle: textTheme.headline6, color: Colors.black),
              ),
              Text(
                'Frontend Developer',
                style: GoogleFonts.outfit(
                    textStyle: textTheme.subtitle1, color: Colors.grey),
              ),
            ],
          ),
        ));
  }
}

class buildCardItem extends StatelessWidget {
  final String text;
  final String text2;
  final IconData iconData;
  final Color iconColor;

  const buildCardItem({
    Key? key,
    required this.text,
    required this.text2,
    required this.iconData,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double navBarHeight2 = MediaQuery.of(context).size.width * 0.2;

    return Container(
      height: navBarHeight2,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: Card(
        color: Colors.grey[50],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: iconColor,
              size: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    text2,
                    style: GoogleFonts.outfit(
                        textStyle: textTheme.subtitle2, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Center(
                  child: Text(
                    text,
                    style: GoogleFonts.outfit(
                        textStyle: textTheme.subtitle1, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}


BoxDecoration customBoxDecoration() {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(20), color: Colors.white);
}
class CustomCard extends StatelessWidget {
  final String title;
  final String description;

  CustomCard({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ConstantsColor.lightblueColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.outfit(
        textStyle: textTheme.subtitle2,
        color: Colors.black
      ),
            ),
            SizedBox(height: 8),
            Text(description,  style: GoogleFonts.outfit(
        textStyle: textTheme.bodyText2,
        color: Colors.black
      ),),
          ],
        ),
      ),
    );
  }
}
