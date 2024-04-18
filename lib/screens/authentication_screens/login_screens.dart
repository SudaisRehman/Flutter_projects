import 'package:agepeacts/custom_widgets/contants.dart';
import 'package:agepeacts/screens/authentication_screens/signup_screen.dart';
import 'package:agepeacts/screens/home/carousel_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatelessWidget {
  Login({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController poswordController = TextEditingController();

  void openaccout(BuildContext context) async {
    if (emailController.text.isEmpty || poswordController.text.isEmpty) {
      print('Please fill all the fields');
    } else {
      try {
        print('account opening');
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailController.text, password: poswordController.text);
        print(userCredential);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return CarouselScreen();
        }));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(color: Color(0xffffffff)),
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
                  ),
                ),
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
                        Text('Login',
                            style: TextStyle(
                                fontSize: size.height * 0.03,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff3E3E3E))),
                        SizedBox(
                          height: size.height * 0.06,
                        ),
                        TextFormFieldAuth(
                          size: size,
                          text: 'Email',
                          Controller: emailController,
                          onpressed: () {},
                          icon: Icon(
                            Icons.email,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        TextFormFieldAuth(
                          Controller: poswordController,
                          size: size,
                          text: 'Password',
                          onpressed: () {},
                          icon: Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                          obscureText: true,
                          suffixIcon: Icon(
                            Icons.visibility,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Forgot Password?',
                                style: TextStyle(
                                    color: Color(0xffC60000),
                                    fontSize: size.height * 0.02),
                              ),
                            ]),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        Center(
                          child: ButtonRedForAuth(
                            size: size,
                            text: 'Log in',
                            onpressed: () {
                              openaccout(context);
                            },
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.015,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account?',
                              style: TextStyle(
                                  color: Color(0xff9E9E9E),
                                  fontSize: size.height * 0.02),
                            ),
                            SizedBox(
                              width: size.width * 0.01,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return SignUp();
                                }));
                              },
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                    color: Color(0xffC60000),
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.height * 0.021),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
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
