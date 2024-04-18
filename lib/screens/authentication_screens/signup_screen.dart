import 'package:agepeacts/custom_widgets/contants.dart';
import 'package:agepeacts/screens/authentication_screens/login_screens.dart';

import 'package:agepeacts/screens/home/carousel_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController poswordController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();
  void createAccount(BuildContext context) async {
    if (emailController.text.isEmpty ||
        fullnameController.text.isEmpty ||
        poswordController.text.isEmpty) {
      print('Please fill all the fields');
    } else {
      try {
        print('account creating');
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text, password: poswordController.text);
        print(userCredential);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return CarouselScreen();
        }));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(color: Color(0xffffffff)),
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                width: double.infinity,
                height: size.height * 0.41,
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                ),
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(image: AssetImage('assets/images/redheart.png')),
                    Image(image: AssetImage('assets/images/redageape.png')),
                  ],
                )),
              ),
              Container(
                width: double.infinity,
                height: size.height * 0.59,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                  color: Color(0xffF5F7F9),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(17.0),
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: size.height * 0.03,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: size.height * 0.04,
                          ),
                          TextFormFieldAuth(
                            size: size,
                            text: 'Email',
                            icon: Icon(Icons.email, color: Colors.black),
                            obscureText: false,
                            Controller: emailController,
                            onpressed: () {},
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          TextFormFieldAuth(
                            size: size,
                            text: 'Full Name',
                            icon: Icon(Icons.person, color: Colors.black),
                            obscureText: false,
                            Controller: fullnameController,
                            onpressed: () {},
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          TextFormFieldAuth(
                            size: size,
                            text: 'Password',
                            icon: Icon(Icons.lock, color: Colors.black),
                            obscureText: true,
                            Controller: poswordController,
                            onpressed: () {},
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          TextFormFieldAuth(
                            size: size,
                            text: 'Confirm Password',
                            icon: Icon(Icons.lock, color: Colors.black),
                            obscureText: true,
                            Controller: poswordController,
                            onpressed: () {},
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Center(
                            child: ButtonRedForAuth(
                              size: size,
                              text: 'Sign Up',
                              onpressed: () {
                                createAccount(context);
                              },
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Already have an account? ',
                                  style: TextStyle(
                                      color: Color(0xff9E9E9E),
                                      fontSize: size.height * 0.02)),
                              InkWell(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Login();
                                  }));
                                },
                                child: Text('Login',
                                    style: TextStyle(
                                        color: Color(0xffC60000),
                                        fontWeight: FontWeight.bold,
                                        fontSize: size.height * 0.02)),
                              )
                            ],
                          )
                        ]),
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
