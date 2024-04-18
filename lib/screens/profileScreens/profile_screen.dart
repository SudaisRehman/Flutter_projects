import 'package:agepeacts/screens/menubar.dart/bottommenu.dart';
import 'package:agepeacts/screens/menubar.dart/sidebar.dart';
import 'package:agepeacts/screens/profileScreens/AgeapeBadgesProfile.dart';
import 'package:flutter/material.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<SideMenuState> _profileScreenSideMenuKey =
      GlobalKey<SideMenuState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SideMenu(
      background: Color.fromARGB(255, 35, 49, 66),
      key: _profileScreenSideMenuKey,
      menu: SideBar(),
      type: SideMenuType.shrinkNSlide,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xffC60000),
          leading: InkWell(
              onTap: () {
                setState(() {
                  final _state = _profileScreenSideMenuKey.currentState;
                  if (_state!.isOpened)
                    _state.closeSideMenu();
                  else
                    _state.openSideMenu();
                });
              },
              child: Image(image: AssetImage('assets/images/sideicon.png'))),
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
              },
              icon: Icon(Icons.more_vert),
            ),
          ],
          title: Center(child: Text('Profile')),
        ),
        backgroundColor: Color(0xffF3F3F3),
        body: Column(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.345,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Stack(children: [
                Container(
                  width: size.width,
                  height: size.height * 0.188,
                  child: Image(
                    image: AssetImage('assets/images/Rectangle 6509.png'),
                  ),
                ),
                Positioned(
                  top: size.height * 0.15,
                  left: size.width * 0.05,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        AssetImage('assets/images/Ellipse 779.png'),
                  ),
                ),
                Positioned(
                  top: size.height * 0.24,
                  left: size.width * 0.04,
                  child: Text(
                    'Anisha Watson',
                    style: TextStyle(
                        fontSize: size.width * 0.051,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff19212C)),
                  ),
                ),
                Positioned(
                  top: size.height * 0.27,
                  left: size.width * 0.04,
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Color(0xffa4a4a4a4),
                        size: size.width * 0.054,
                      ),
                      Text(
                        'Georgia',
                        style: TextStyle(
                            fontSize: size.width * 0.034,
                            color: Color(0xffa4a4a4a4)),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: size.height * 0.31,
                  left: size.width * 0.04,
                  child: Row(
                    children: [
                      Text(
                        '18',
                        style: TextStyle(
                            fontSize: size.width * 0.040,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff19212c)),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Text(
                        ' Friends',
                        style: TextStyle(
                            fontSize: size.width * 0.040,
                            color: Color(0xffa4a4a4a4)),
                      ),
                      SizedBox(
                        width: size.width * 0.05,
                      ),
                      Text(
                        '314',
                        style: TextStyle(
                            fontSize: size.width * 0.040,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff19212c)),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Text('Ageape Tokens',
                          style: TextStyle(
                              fontSize: size.width * 0.040,
                              color: Color(0xffa4a4a4a4))),
                      SizedBox(
                        width: size.width * 0.05,
                      ),
                      Text('1.3k',
                          style: TextStyle(
                              fontSize: size.width * 0.040,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff19212c))),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Text('Applaud',
                          style: TextStyle(
                              fontSize: size.width * 0.040,
                              color: Color(0xffa4a4a4a4))),
                    ],
                  ),
                )
              ]),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Container(
              width: size.width,
              height: size.height * 0.5,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: AgeapeBadgesProfile(),
            )
          ],
        ),
      ),
    );
  }
}
