import 'package:agepeacts/screens/home/home.dart';
import 'package:agepeacts/screens/menubar.dart/bottommenu.dart';
import 'package:agepeacts/screens/menubar.dart/sidebar.dart';
import 'package:agepeacts/screens/profileScreens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class TopBadges extends StatefulWidget {
  const TopBadges({super.key});

  @override
  State<TopBadges> createState() => _TopBadgesState();
}

class _TopBadgesState extends State<TopBadges> {
  final GlobalKey<SideMenuState> _topBadgesSideMenuKey =
      GlobalKey<SideMenuState>();
  String selectedOption = 'Day';

  void _selectOption(String option) {
    setState(() {
      selectedOption = option;
    });
  }

  Color _getColor(String option) {
    return option == selectedOption ? Color(0xffC60000) : Color(0xffA4A4A4);
  }

  Color _getBorderColor(String option) {
    return option == selectedOption ? Color(0xffC60000) : Color(0xffffffff);
  }

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

    List<Map<String, dynamic>> TopBadgesData = [
      {
        'name': 'Lavem Bruen',
        'image': 'assets/images/Ellipse 784 (1).png',
        'token': '10 Agape Tokens',
      },
      {
        'name': 'Frank Conn',
        'image': 'assets/images/Ellipse 785 (1).png',
        'token': '8 Agape Tokens',
      },
      {
        'name': 'Garry Weimann',
        'image': 'assets/images/Ellipse 786 (1).png',
        'token': '5 Agape Tokens',
      },
      {
        'name': 'Juliana Hemarm',
        'image': 'assets/images/Ellipse 787 (1).png',
        'token': '7 Agape Tokens',
      },
      {
        'name': 'Kianna Barrows',
        'image': 'assets/images/Ellipse 788 (1).png',
        'token': '9 Agape Tokens',
      },
      {
        'name': 'Madsen Rippin',
        'image': 'assets/images/Ellipse 789 (1).png',
        'token': '10 Agape Tokens',
      },
      {
        'name': 'Katlin Carter',
        'image': 'assets/images/Ellipse 790 (1).png',
        'token': '4 Agape Tokens',
      },
      {
        'name': 'Jorge Wattson',
        'image': 'assets/images/Ellipse 786.png',
        'token': '5 Agape Tokens',
      },
      {
        'name': 'Jorge Wattson',
        'image': 'assets/images/Ellipse 787.png',
        'token': '5 Agape Tokens',
      },
    ];

    return SideMenu(
      key: _topBadgesSideMenuKey,
      background: Colors.blueGrey[900],
      type: SideMenuType.shrinkNSlide,
      menu: SideBar(),
      child: GestureDetector(
        onTap: () {
          final _state = _topBadgesSideMenuKey.currentState;
          if (_state!.isOpened) _state.closeSideMenu();

          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Color(0xffF3F3F3),
          appBar: AppBar(
            elevation: 0,
            title: Center(child: Text("Top Badges")),
            backgroundColor: Color(0xffc60000),
            leading: InkWell(
                onTap: () {
                  setState(() {
                    final _state = _topBadgesSideMenuKey.currentState;
                    if (_state!.isOpened)
                      _state.closeSideMenu();
                    else
                      _state.openSideMenu();
                  });
                },
                child: Image(image: AssetImage('assets/images/sideicon.png'))),
            actions: [
              IconButton(
                icon: Icon(Icons.more_vert),
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
                },
              ),
            ],
          ),
          body: SingleChildScrollView(
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
                          setState(() {
                            changeContainerColor('Individual');
                          });
                        });
                        //open friends screen
                      },
                      child: Container(
                        width: size.width * 0.45,
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
                    InkWell(
                      onTap: () {
                        setState(() {
                          changeContainerColor('Organization');
                        });
                      },
                      child: Container(
                        width: size.width * 0.45,
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
                SizedBox(height: size.height * 0.016),
                Container(
                    width: size.width * 0.9,
                    height: size.height * 0.06,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              _selectOption('Day');

                              //if day is true then change it to false and vice versa
                            });
                            //open friends screen
                          },
                          child: Container(
                            width: size.width * 0.225,
                            height: size.height * 0.06,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: _getBorderColor('Day'))),
                            child: Center(
                                child: Text(
                              "Day",
                              style: TextStyle(color: _getColor('Day')),
                            )),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _selectOption('Week');

                              //if day is true then change it to false and vice versa
                            });
                            //open friends screen
                          },
                          child: Container(
                            width: size.width * 0.225,
                            height: size.height * 0.06,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: _getBorderColor('Week')),
                            ),
                            child: Center(
                                child: Text(
                              "Week",
                              style: TextStyle(color: _getColor('Week')),
                            )),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _selectOption('Month');

                              //if day is true then change it to false and vice versa
                            });
                            //open friends screen
                          },
                          child: Container(
                            width: size.width * 0.225,
                            height: size.height * 0.06,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: _getBorderColor('Month')),
                            ),
                            child: Center(
                                child: Text(
                              "Month",
                              style: TextStyle(color: _getColor('Month')),
                            )),
                          ),
                        ),
                        InkWell(
                          onTap: () => _selectOption('All'),
                          child: Container(
                            width: size.width * 0.225,
                            height: size.height * 0.06,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: _getBorderColor('All')),
                            ),
                            child: Center(
                                child: Text(
                              "All",
                              style: TextStyle(color: _getColor('All')),
                            )),
                          ),
                        ),
                      ],
                    )),
                Container(
                    width: size.width * 0.9,
                    height: size.height * 0.65,
                    child: ListView.builder(
                      itemCount: TopBadgesData.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 6, bottom: 5),
                          child: Container(
                            width: size.width * 0.9,
                            height: size.height * 0.1,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(children: [
                              SizedBox(width: size.width * 0.03),
                              Container(
                                width: size.width * 0.15,
                                height: size.height * 0.1,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        TopBadgesData[index]['image']),
                                  ),
                                ),
                              ),
                              SizedBox(width: size.width * 0.03),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    TopBadgesData[index]['name'],
                                    style: TextStyle(
                                        color: Color(0xff19212C),
                                        fontSize: size.width * 0.04),
                                  ),
                                  SizedBox(height: size.height * 0.005),
                                  Text(
                                    TopBadgesData[index]['token'],
                                    style: TextStyle(
                                      color: Color(0xff757C83),
                                      fontSize: size.width * 0.03,
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Container(
                                  width: size.width * 0.22,
                                  height: size.height * 0.04,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color(0xffC60000),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      print('view profile');
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProfileScreen()));
                                    },
                                    child: Text(
                                      'View profile',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: size.width * 0.03),
                                    ),
                                  )),
                              SizedBox(width: size.width * 0.03),
                            ]),
                          ),
                        );
                      },
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
