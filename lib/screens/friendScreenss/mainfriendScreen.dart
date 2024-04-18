import 'package:agepeacts/screens/home/home.dart';
import 'package:agepeacts/screens/menubar.dart/bottommenu.dart';
import 'package:agepeacts/screens/menubar.dart/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class FriendScreenMain extends StatefulWidget {
  const FriendScreenMain({super.key});

  @override
  State<FriendScreenMain> createState() => _FriendScreenMainState();
}

class _FriendScreenMainState extends State<FriendScreenMain> {
  final GlobalKey<SideMenuState> _mainfriendSideMenuKey =
      GlobalKey<SideMenuState>();
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> FriendsData = [
      {
        'name': 'Jorge Wattson',
        'image': 'assets/images/Ellipse 788 (2).png',
      },
      {
        'name': 'Evelyn McCoy',
        'image': 'assets/images/Ellipse 789 (2).png',
      },
      {
        'name': 'Lura Fernandez',
        'image': 'assets/images/Ellipse 786 (2).png',
      },
      {
        'name': 'Willie Reese',
        'image': 'assets/images/Ellipse 787 (2).png',
      },
      {
        'name': 'Kyle Hopkins',
        'image': 'assets/images/Ellipse 790 (3).png',
      },
      {
        'name': 'Cecelia Curry',
        'image': 'assets/images/Ellipse 791.png',
      },
      {
        'name': 'Cornelia Larson',
        'image': 'assets/images/Ellipse 792.png',
      },
      {
        'name': 'Minnie Dunn',
        'image': 'assets/images/Ellipse 793.png',
      },
      {
        'name': 'Cornelia Larson',
        'image': 'assets/images/Ellipse 794.png',
      },
      {
        'name': 'Jon Butler',
        'image': 'assets/images/Ellipse 795.png',
      },
      {
        'name': 'Leila Carson',
        'image': 'assets/images/Ellipse 796.png',
      },
      {
        'name': 'Estelle Prsons',
        'image': 'assets/images/Ellipse 797.png',
      },
      {
        'name': 'Jorge Wattson',
        'image': 'assets/images/Ellipse 798.png',
      },
      {
        'name': 'Dark Emeralds',
        'image': 'assets/images/Ellipse 799.png',
      },
      {
        'name': 'John Snow',
        'image': 'assets/images/Ellipse 800.png',
      },
      {
        'name': 'Arya Stark',
        'image': 'assets/images/Ellipse 801.png',
      }
    ];
    var size = MediaQuery.of(context).size;
    return SideMenu(
      background: Color.fromARGB(255, 35, 49, 66),
      key: _mainfriendSideMenuKey,
      type: SideMenuType.shrinkNSlide,
      menu: SideBar(),
      child: GestureDetector(
        onTap: () {
          final _state = _mainfriendSideMenuKey.currentState;
          if (_state!.isOpened) _state.closeSideMenu();

          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xffc60000),
            elevation: 0,
            title: Title(
              color: Colors.white,
              child: Center(
                child: Text(
                  'Friends',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            leading: InkWell(
                onTap: () {
                  setState(() {
                    final _state = _mainfriendSideMenuKey.currentState;
                    if (_state!.isOpened)
                      _state.closeSideMenu();
                    else
                      _state.openSideMenu();
                  });
                },
                child: Image(image: AssetImage('assets/images/sideicon.png'))),
            actions: [
              InkWell(
                onTap: () {
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
                child: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
              )
            ],
          ),
          body: Container(
            width: size.width,
            height: size.height,
            color: Color(0xffF3F3F3),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SearchWalaContainer(size: size),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Container(
                    width: size.width * 0.9,
                    height: size.height * 0.76,
                    child: GridView.builder(
                      itemCount: FriendsData.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 20,
                        childAspectRatio: 2,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          width: size.width * 0.1,
                          height: size.height * 0.1,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: 25,
                                backgroundImage:
                                    AssetImage(FriendsData[index]['image']),
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.02,
                            ),

                            //text when long go to next line
                            Flexible(
                              child: Text(
                                FriendsData[index]['name'],
                                style: TextStyle(
                                    fontSize: size.width * 0.038,
                                    color: Color(0xff19212C)),
                              ),
                            ),
                          ]),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
