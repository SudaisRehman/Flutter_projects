import 'package:agepeacts/screens/home/home.dart';
import 'package:agepeacts/screens/menubar.dart/bottommenu.dart';
import 'package:agepeacts/screens/menubar.dart/sidebar.dart';
import 'package:agepeacts/screens/profileScreens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class TopGivers extends StatefulWidget {
  const TopGivers({Key? key}) : super(key: key);

  @override
  State<TopGivers> createState() => _TopGiversState();
}

class _TopGiversState extends State<TopGivers> {
  int selectedIndex = 0;
  List<Map<String, dynamic>> alltopgivers = [
    {
      'name': 'Jorge Wattson',
      'image': 'assets/images/Ellipse 784.png',
      'tokens': '10 Agape Tokens',
    },
    {
      'name': 'Sara Denial',
      'image': 'assets/images/Ellipse 785.png',
      'tokens': '8 Agape Tokens',
    },
    {
      'name': 'Maria Martin',
      'image': 'assets/images/Ellipse 786.png',
      'tokens': '5 Agape Tokens',
    },
    {
      'name': 'Kane Rojers',
      'image': 'assets/images/Ellipse 787.png',
      'tokens': '7 Agape Tokens',
    },
    {
      'name': 'Sam Curran',
      'image': 'assets/images/Ellipse 788.png',
      'tokens': '9 Agape Tokens',
    },
    {
      'name': 'Natasha Watson',
      'image': 'assets/images/Ellipse 789.png',
      'tokens': '10 Agape Tokens',
    },
    {
      'name': 'Ammy Raben',
      'image': 'assets/images/Ellipse 790.png',
      'tokens': '10 Agape Tokens',
    },
    {
      'name': 'Lavem Bruen',
      'image': 'assets/images/Ellipse 784 (1).png',
      'tokens': '10 Agape Tokens',
    }
  ];
  List names = [
    'Day',
    'Week',
    'Month',
    'All',
  ];

  final GlobalKey<SideMenuState> _topGiverSideMenuKey =
      GlobalKey<SideMenuState>();

  Color individualContainerColor = Color(0xffC60000);
  Color organizationContainerColor = Colors.white;
  Color individualTextColor = Colors.white;
  Color organizationTextColor = Color(0xffC60000);
  void changeContainerColor(String containerType) {
    setState(() {
      if (containerType == 'Individual') {
        individualContainerColor =
            Color(0xffc60000); // Change to the desired color
        organizationContainerColor =
            Colors.white; // Reset the other container's color
        individualTextColor = Colors.white;
        organizationTextColor = Color(0xffa4a4a4);
      } else if (containerType == 'Organization') {
        individualContainerColor =
            Colors.white; // Reset the other container's color
        organizationContainerColor =
            Color(0xffc60000); // Change to the desired color
        organizationTextColor = Colors.white;
        individualTextColor = Color(0xffa4a4a4);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SideMenu(
      background: Color.fromARGB(255, 35, 49, 66),
      key: _topGiverSideMenuKey,
      type: SideMenuType.shrinkNSlide,
      menu: SideBar(),
      child: GestureDetector(
        onTap: () {
          final _state = _topGiverSideMenuKey.currentState;
          if (_state!.isOpened) _state.closeSideMenu();

          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Color(0xffC60000),
            actions: [
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    context: context,
                    builder: (context) {
                      return BottomMenu();
                    },
                  );
                  //open siderbar menu
                },
                icon: Icon(Icons.more_vert),
              ),
            ],
            leading: InkWell(
                onTap: () {
                  setState(() {
                    final _state = _topGiverSideMenuKey.currentState;
                    if (_state!.isOpened)
                      _state.closeSideMenu();
                    else
                      _state.openSideMenu();
                  });
                },
                child: Image(image: AssetImage('assets/images/sideicon.png'))),
            title: Center(child: Text('Top Givers')),
          ),
          body: Container(
            width: size.width,
            height: size.height,
            color: Color(0xffF3F3F3),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SearchWalaContainer(size: size),
                  SizedBox(height: size.height * 0.016),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            changeContainerColor('Individual');
                          });
                          //open friends screen
                        },
                        child: Container(
                          width: size.width * 0.4,
                          height: size.height * 0.05,
                          decoration: BoxDecoration(
                            color: individualContainerColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topLeft: Radius.circular(10),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Friends',
                              style: TextStyle(color: individualTextColor),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            changeContainerColor('Organization');
                          });
                        },
                        child: Container(
                          width: size.width * 0.4,
                          height: size.height * 0.05,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffCCCCCC)),
                            color: organizationContainerColor,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'All Members',
                              style: TextStyle(color: organizationTextColor),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: size.height * 0.015),
                  Container(
                    width: size.width * 0.9,
                    height: size.height * 0.06,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListView.builder(
                      //current index

                      scrollDirection: Axis.horizontal,
                      itemCount: names.length,

                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            width: size.width * 0.225,
                            height: size.height * 0.06,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: index == selectedIndex
                                    ? Color(0xffC60000)
                                    : Colors.white,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                names[index],
                                style: TextStyle(
                                  color: selectedIndex == index
                                      ? Color(0xffC60000)
                                      : Color(0xffA4A4A4),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: size.height * 0.015),
                  Container(
                      width: size.width * 0.9,
                      height: size.height * 0.64,
                      decoration: BoxDecoration(
                        color: Color(0xfff3f3f3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListView.builder(
                        itemCount: alltopgivers.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(top: 6, bottom: 6),
                            width: size.width * 0.9,
                            height: size.height * 0.08,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: size.width * 0.07,
                                    backgroundImage: AssetImage(
                                        alltopgivers[index]['image']),
                                  ),
                                  SizedBox(width: size.width * 0.03),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        alltopgivers[index]['name'],
                                        style: TextStyle(
                                          color: Color(0xff19212C),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: size.height * 0.008),
                                      Text(
                                        alltopgivers[index]['tokens'],
                                        style: TextStyle(
                                          color: Color(0xff757C83),
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProfileScreen()));
                                    },
                                    child: Container(
                                      width: size.width * 0.25,
                                      height: size.height * 0.04,
                                      decoration: BoxDecoration(
                                        color: Color(0xffC60000),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'View Profile',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
