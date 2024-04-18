import 'package:agepeacts/custom_widgets/contants.dart';
import 'package:agepeacts/screens/authentication_screens/login_screens.dart';
import 'package:agepeacts/screens/authentication_screens/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  void signinGoogle() async {}

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(color: Color(0xffffffff)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: size.height * 0.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      color: Color(0xffC60000),
                      image: DecorationImage(
                        image: AssetImage('assets/images/ageapeact.png'),
                      )),
                ),
                SizedBox(
                  height: size.height * 0.12,
                ),
                Text(
                  "Congratulate those who do",
                  style: TextStyle(
                      fontSize: size.height * 0.03,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff3E3E3E)),
                ),
                Text(
                  'positive deeds',
                  style: TextStyle(
                      fontSize: size.height * 0.03,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff3E3E3E)),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Text(
                  'Applaud, Explore & Share with your friends',
                  style: TextStyle(color: Color(0xff9E9E9E)),
                ),
                SizedBox(
                  height: size.height * 0.10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvaterAuth(size: size, icon: Icon(Icons.facebook)),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    CircleAvaterAuth(
                        size: size, icon: Icon(FontAwesomeIcons.twitter)),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: CircleAvaterAuth(
                          size: size,
                          icon: Icon(
                            FontAwesomeIcons.googlePlusG,
                            size: 20,
                            color: Colors.red,
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                ButtonRedForAuth(
                  size: size,
                  text: 'Log in',
                  onpressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Login();
                    }));
                  },
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                ButtonRedForAuth(
                    size: size,
                    text: 'Create Account',
                    onpressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SignUp();
                      }));
                    }),
              ],
            ),
          )),
    );
  }
}
