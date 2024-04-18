import 'package:agepeacts/screens/Messages/messagesScreen.dart';
import 'package:agepeacts/screens/authentication_screens/welcome_screen.dart';
import 'package:agepeacts/screens/friendScreenss/mainfriendScreen.dart';
import 'package:agepeacts/screens/home/friendsScreeen.dart';
import 'package:agepeacts/screens/home/home.dart';
import 'package:agepeacts/screens/home/nominateGiver.dart';
import 'package:agepeacts/screens/home/settingScreen.dart';
import 'package:agepeacts/screens/home/top_badges.dart';
import 'package:agepeacts/screens/oppurtuntiesScreens/oppuetuntiesScreen.dart';
import 'package:agepeacts/screens/profileScreens/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SideBar extends StatefulWidget {
  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  void signOut() async {
    print('signing out');
    await FirebaseAuth.instance.signOut();
    print('signed out');
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return WelcomeScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
              left: size.width * 0.05,
            ),
            width: size.width * 0.6,
            height: size.height * 0.09,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Color.fromRGBO(255, 255, 255, 0.08),
                width: 2,
              ),
              color: Colors.transparent,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage('assets/images/Ellipse 23.png'),
                  ),
                  SizedBox(
                    width: size.width * 0.05,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dark_Emeralds',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.005,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.location_pin,
                            color: Colors.white,
                            size: 15,
                          ),
                          Text(
                            'Georgia',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                //on click close the side menu
                //on tap i go that screen in which it is present

                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home_outlined, color: Colors.white),
            title: Text(
              'Home',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onTap: () {
              // Check if you are on the "Home" screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.person_outline, color: Colors.white),
            title: Text('Profile', style: TextStyle(color: Colors.white)),
            onTap: () {
              // Handle the Profile option.
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              ); // Close the drawer
            },
          ),
          ListTile(
            leading: Image(
                image: AssetImage('assets/images/user (6) 1 (Traced).png')),
            title: Text('Nominate',
                style: TextStyle(
                  color: Colors.white,
                )),
            onTap: () {
              // Handle the Home option.
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) {
                  return NominateGiver();
                },
              )); // Close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.people, color: Colors.white),
            title: Text('Freinds',
                style: TextStyle(
                  color: Colors.white,
                )),
            onTap: () {
              // Handle the Profile option.
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) {
                  return FriendScreenMain();
                },
              )); // Close the drawer
            },
          ),
          ListTile(
            leading: Image(
                image: AssetImage('assets/images/insignia 1 (Traced).png')),
            title: Text('Badges', style: TextStyle(color: Color(0xffffffff))),
            onTap: () {
              // Handle the Home option.
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return TopBadges();
              })); // Close the drawer
            },
          ),
          ListTile(
            leading: Image(image: AssetImage('assets/images/Group 17287.png')),
            title: Text('Messages',
                style: TextStyle(
                  color: Color(0xffffffff),
                )),
            onTap: () {
              // Handle the Profile option.
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return MessagesScreen();
              })); // Close the drawer
            },
          ),
          ListTile(
            leading: Image(image: AssetImage('assets/images/oppur.png')),
            title: Text('Opportunities',
                style: TextStyle(
                  color: Color(0xffffffff),
                )),
            onTap: () {
              // Handle the Profile option.
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return OppurtuntiesScreen();
              })); // Close the drawer
            },
          ),
          SizedBox(
            height: size.height * 0.15,
          ),
          Row(
            children: [
              SizedBox(
                width: size.width * 0.05,
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SettingScreen();
                    }));
                  },
                  child: Icon(Icons.settings, color: Colors.white, size: 20)),
              SizedBox(
                width: size.width * 0.05,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SettingScreen();
                  }));
                },
                child: Text(
                  'Settings',
                  style: TextStyle(
                    color: Color(0xffffffff),
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.05,
              ),
              // horizontal divider
              Container(
                width: size.width * 0.003,
                height: size.height * 0.03,
                color: Color(0xffffffff),
              ),
              SizedBox(
                width: size.width * 0.05,
              ),
              GestureDetector(
                onTap: () {
                  signOut();
                },
                child: Text('Logout',
                    style: TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 15,
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
