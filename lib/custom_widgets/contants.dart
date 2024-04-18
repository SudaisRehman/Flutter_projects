import 'package:flutter/material.dart';

class ButtonRedForAuth extends StatelessWidget {
  const ButtonRedForAuth({
    Key? key,
    required this.size,
    required this.text,
    required this.onpressed,
    this.width,
    this.height,
  }) : super(key: key);

  final Size size;
  final String text;
  final Function onpressed;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onpressed();
      },
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xffC60000),
          minimumSize:
              Size(width ?? size.width * 0.9, height ?? size.height * 0.06),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          elevation: 8,
          shadowColor: Colors.black),
    );
  }
}

class CircleAvaterAuth extends StatelessWidget {
  const CircleAvaterAuth({
    super.key,
    required this.size,
    required this.icon,
  });

  final Size size;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size.height * 0.03,
      backgroundColor: Color(0xffF5F5F5),
      child: icon,
    );
  }
}

class TextFormFieldAuth extends StatelessWidget {
  final TextEditingController Controller;
  final Size size;
  final String text;
  final Function onpressed;
  final Icon icon;
  final bool obscureText;
  final Icon? suffixIcon;
  const TextFormFieldAuth({
    Key? key, // Add the key parameter here
    required this.Controller,
    required this.size,
    required this.text,
    required this.onpressed,
    required this.icon,
    this.obscureText = false,
    this.suffixIcon,

    // Add the onpressed parameter here
  } // Add the onpressed parameter here

      ) : super(key: key); // Initialize the super constructor with the key parameter

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardAppearance: Brightness.light,
      obscureText: obscureText,
      keyboardType: TextInputType.emailAddress,
      controller: Controller,
      decoration: InputDecoration(
        labelText: text,
        alignLabelWithHint: true,
        labelStyle: TextStyle(
          color: Color(0xff9E9E9E),
          fontSize: size.height * 0.02,
        ),
        contentPadding: EdgeInsets.only(top: 10),
        prefixIcon: icon,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Color(0xffffffff),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Color(0xffffffff)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Color(0xffF5F7F9)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Color(0xffF5F7F9)),
        ),
      ),
    );
  }
}

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({
    super.key,
    required this.size,
    required this.text,
  });

  final Size size;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: size.height * 0.2,
      color: Color(0xffC60000),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 12.0,
            ),
            child: Image(image: AssetImage('assets/images/sideicon.png')),
          ),
          Text(text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(
              //three dots icon
              Icons.more_vert,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
