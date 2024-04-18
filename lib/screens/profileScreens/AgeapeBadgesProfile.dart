import 'package:agepeacts/custom_widgets/custom_post.dart';
import 'package:flutter/material.dart';

class AgeapeBadgesProfile extends StatefulWidget {
  const AgeapeBadgesProfile({super.key});

  @override
  State<AgeapeBadgesProfile> createState() => _AgeapeBadgesProfileState();
}

class _AgeapeBadgesProfileState extends State<AgeapeBadgesProfile> {
  @override
  Widget build(BuildContext context) {
    List Badges = [
      'assets/images/Group (1).png',
      'assets/images/Group (2).png',
      'assets/images/Group (3).png',
      'assets/images/Group (4).png',
      'assets/images/Group (5).png',
    ];
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 14),
            child: Text(
              'Ageape Badges',
              style: TextStyle(
                  fontSize: size.width * 0.047,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff3E3E3E)),
            ),
          ),
          Container(
            width: size.width,
            height: size.height * 0.1,
            color: Colors.transparent,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Badges.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Image.asset(
                    Badges[index],
                    width: size.width * 0.17,
                    height: size.height * 0.1,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 13.0),
            child: Text(
              'About',
              style: TextStyle(
                  fontSize: size.width * 0.044,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff3E3E3E)),
            ),
          ),
          SizedBox(height: size.height * 0.01),
          Center(
            child: Container(
              width: size.width * 0.925,
              height: size.height * 0.09,
              decoration: BoxDecoration(
                color: Color(0xffF0F2F5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 6.0,
                  top: 9,
                ),
                child: Text(
                    'A Passionate coder.Loves to swim and dance.An Enthusiastic Designer. Loves reading books. Always being positive.Sarcastic humor.'),
              ),
            ),
          ),
          SizedBox(height: size.height * 0.01),
          Container(
            width: size.width,
            color: Colors.transparent,
            child: LayoutBuilder(
              builder: (context, constraints) {
                // Calculate the desired height for CustomPostWidget
                double customPostHeight = constraints.maxHeight * 0.716;

                return CustomPostWidget();
              },
            ),
          )
        ]),
      ),
    );
  }
}
