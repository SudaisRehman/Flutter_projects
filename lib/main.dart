import 'package:agepeacts/provider/providers.dart';
import 'package:agepeacts/screens/authentication_screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "My Flutter App",
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => homeProvider()),
        ChangeNotifierProvider(create: (context) => vedioProvider()),
        ChangeNotifierProvider(create: (context) => screenchangeProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: WelcomeScreen(),
        ),
      ),
    );
  }
}
