import 'package:agepeacts/screens/Messages/messagesScreen.dart';
import 'package:agepeacts/screens/friendScreenss/freindRequestScreen.dart';
import 'package:agepeacts/screens/friendScreenss/mainfriendScreen.dart';
import 'package:agepeacts/screens/home/nominateGiver.dart';
import 'package:agepeacts/screens/home/settingScreen.dart';
import 'package:agepeacts/screens/oppurtuntiesScreens/oppuetuntiesScreen.dart';
import 'package:flutter/material.dart';

class BottomMenu extends StatefulWidget {
  const BottomMenu({super.key});

  @override
  State<BottomMenu> createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        width: size.width,
        height: size.height * 0.492,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: SingleChildScrollView(
          child: Column(children: [
            BottommunuWalaRow(
              size: size,
              image: AssetImage(
                'assets/images/Group 17936.png',
              ),
              text: 'Nominate',
              onpressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return NominateGiver();
                }));
              },
            ),
            Divider(
              height: 1, // Specify the height of the divider
              color: Color(0xffEBEBEB), // Specify the color of the divider
              thickness: 1, // Specify the thickness of the divider
              indent:
                  16, // Specify the left indent (empty space before the divider)
              endIndent:
                  16, // Specify the right indent (empty space after the divider)
            ),
            BottommunuWalaRow(
              size: size,
              image: AssetImage(
                'assets/images/Group 17937.png',
              ),
              text: 'Friends',
              onpressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FriendScreenMain();
                }));
              },
            ),
            Divider(
              height: 1, // Specify the height of the divider
              color: Color(0xffEBEBEB), // Specify the color of the divider
              thickness: 1, // Specify the thickness of the divider
              indent:
                  16, // Specify the left indent (empty space before the divider)
              endIndent:
                  16, // Specify the right indent (empty space after the divider)
            ),
            BottommunuWalaRow(
              size: size,
              image: AssetImage(
                'assets/images/Group 17938.png',
              ),
              text: 'Settings',
              onpressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SettingScreen();
                }));
              },
            ),
            Divider(
              height: 1, // Specify the height of the divider
              color: Color(0xffEBEBEB), // Specify the color of the divider
              thickness: 1, // Specify the thickness of the divider
              indent:
                  16, // Specify the left indent (empty space before the divider)
              endIndent:
                  16, // Specify the right indent (empty space after the divider)
            ),
            BottommunuWalaRow(
              size: size,
              image: AssetImage(
                'assets/images/Group 17939.png',
              ),
              text: 'Messages',
              onpressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MessagesScreen();
                }));
              },
            ),
            Divider(
              height: 1, // Specify the height of the divider
              color: Color(0xffEBEBEB), // Specify the color of the divider
              thickness: 1, // Specify the thickness of the divider
              indent:
                  16, // Specify the left indent (empty space before the divider)
              endIndent:
                  16, // Specify the right indent (empty space after the divider)
            ),
            BottommunuWalaRow(
              size: size,
              image: AssetImage(
                'assets/images/Group 17941.png',
              ),
              text: 'Notifications',
              onpressed: () {},
            ),
            Divider(
              height: 1, // Specify the height of the divider
              color: Color(0xffEBEBEB), // Specify the color of the divider
              thickness: 1, // Specify the thickness of the divider
              indent:
                  16, // Specify the left indent (empty space before the divider)
              endIndent:
                  16, // Specify the right indent (empty space after the divider)
            ),
            BottommunuWalaRow(
              size: size,
              image: AssetImage(
                'assets/images/Group 17942.png',
              ),
              text: 'Oppurtunities',
              onpressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return OppurtuntiesScreen();
                }));
              },
            ),
            Divider(
              height: 1, // Specify the height of the divider
              color: Color(0xffEBEBEB), // Specify the color of the divider
              thickness: 1, // Specify the thickness of the divider
              indent:
                  16, // Specify the left indent (empty space before the divider)
              endIndent:
                  16, // Specify the right indent (empty space after the divider)
            ),
            BottommunuWalaRow(
              size: size,
              image: AssetImage(
                'assets/images/Group 17943.png',
              ),
              text: 'Friends Requests',
              onpressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FriendsRequestScreen();
                }));
              },
            ),
          ]),
        ),
      ),
    );
  }
}

class BottommunuWalaRow extends StatelessWidget {
  const BottommunuWalaRow({
    super.key,
    required this.size,
    required this.image,
    required this.text,
    required this.onpressed,
  });

  final Size size;
  final image;
  final String text;
  final onpressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 6,
        left: 10,
      ),
      child: InkWell(
        onTap: () {
          onpressed();
        },
        child: Row(
          children: [
            Image(
              image: image,
              width: size.width * 0.12,
              height: size.height * 0.06,
            ),
            SizedBox(
              width: size.width * 0.02,
            ),
            Text(
              text,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff19212C)),
            ),
          ],
        ),
      ),
    );
  }
}
