import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hr_mobile_app/widgets/card_widget.dart';
import 'package:hr_mobile_app/constants/constants.dart';
import 'package:hr_mobile_app/widgets/list_tile.dart'; 

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final double navBarHeight = 80.0;
    final double navBarWidth = MediaQuery.of(context).size.width * 0.8;
   
    final List<CustomCard> customCards = [
      CustomCard(
        icon: '👩‍💻',
        title: 'Development',
        subtitle: '88 techies',
        backgroundColor:ConstantsColor.bodyColor,
      ),
      CustomCard(
        icon: "👨‍🎨",
        title: 'UI/UX design',
        subtitle: '45 creatives',
        backgroundColor: ConstantsColor.orangeColor,
      ),
      CustomCard(
        icon: "🙅‍♂️",
        title: 'QA testing',
        subtitle: '24 checkers',
        backgroundColor: ConstantsColor.pinkColor,
      ),
      CustomCard(
        icon: "🙅‍♂️",
        title: 'PM Team',
        subtitle: '20 big rains',
        backgroundColor: ConstantsColor.lightPurpleColor,
      ),
      CustomCard(
        icon: "🙅‍♂️",
        title: 'Sales Team',
        subtitle: '8 minyaj',
        backgroundColor: ConstantsColor.greenColor,
      ),
    ];
    
    return Scaffold(
     
      backgroundColor: Colors.white,
      bottomNavigationBar: buildBottomNavigationBar(navBarHeight, navBarWidth),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 2, child: buildHeaderItems(context, ConstantsAdress.avatarImage2)),
          buildSearchBarItem(),
          Expanded(flex: 1, child: buildTitleDepartmants(context)),
          Expanded(
            flex: 2,
            child: buildCardItem(context, customCards),
          ),
          Expanded(flex: 1, child: buildTitleItem(context)),
          Expanded(
            flex: 5,
            child: buildListTile(ConstantsAdress.avatarImage2, ConstantsAdress.avatarImage, ConstantsAdress.avatarImage3),
          ),
        ],
      ),
    );
  }

  Column buildListTile(
      String avatarImage2, String avatarImage, String avatarImage3) {
    return Column(
      children: [
        CustomListTile(
          title: 'Sam Smith',
          subtitle: 'Frontend Developer',
          imageUrl: ConstantsAdress.avatarImage,
          trailingIcon: Icons.edit_note,
          color: ConstantsColor.lightblueColor,
          borderRadius: 20.0,
        ),
        CustomListTile(
          title: 'Jacob Gavrilov',
          subtitle: 'QA Assistant',
          imageUrl: ConstantsAdress.avatarImage2,
          trailingIcon: Icons.edit_note,
          color: ConstantsColor.lightPinkColor,
          borderRadius: 20.0,
        ),
        CustomListTile(
          title: 'Stephanie Fleischer',
          subtitle: 'UI/UX designer',
          imageUrl: ConstantsAdress.avatarImage3,
          trailingIcon: Icons.edit_note,
          color: ConstantsColor.lightorangeColor,
          borderRadius: 20.0,
        ),
      ],
    );
  }

  Padding buildTitleItem(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20, top: 20),
        child: Text('Your recently worked with',
        style: GoogleFonts.outfit(
        textStyle: textTheme.headline6, color: Colors.black),
  ),

            );
  }

  Padding buildCardItem(BuildContext context, List<CustomCard> customCards) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemExtent: MediaQuery.of(context).size.width / 2.7,
        itemCount: customCards.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: customCards[index]);
        },
      ),
    );
  }

  Padding buildTitleDepartmants(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20),
      child: Text('Departmants',
          style: GoogleFonts.outfit(
        textStyle: textTheme.headline6, color: Colors.black),
      )
    );
  }

  Expanded buildSearchBarItem() {
    return Expanded(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search by name or job title",
              hintStyle: GoogleFonts.outfit(
                textStyle: textTheme.bodyMedium
              ),
             
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none,
              ),
              fillColor: ConstantsColor.lightGreyColor,
              filled: true,
            ),
          ),
        ));
  }

  Padding buildHeaderItems(BuildContext context, String avatarImage) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                child: Text(
                  'Today',
                  style: GoogleFonts.outfit(
                    textStyle: textTheme.headline5,color: Colors.black
                  ),
                ),
              ),
              FittedBox(
                child: Text(
                  'Good Morning,Hannah',
                 style: GoogleFonts.outfit(
                    textStyle: textTheme.subtitle1,color: Colors.grey
                  ),
                ),
              ),
            ],
          ),
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(avatarImage),
          ),
        ],
      ),
    );
  }
}

Padding buildBottomNavigationBar(double navBarHeight, double navBarWidth) {
  return Padding(
    padding: const EdgeInsets.all(3.0),
    child: SizedBox(
      height: navBarHeight,
      width: navBarWidth,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BottomNavigationBar(
          backgroundColor: ConstantsColor.bottomNavColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.5),
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.thumbs_up_down_outlined), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.view_cozy), label: ""),
          ],
        ),
      ),
    ),
  );
}
