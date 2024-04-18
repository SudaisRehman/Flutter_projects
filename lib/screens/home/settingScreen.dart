import 'package:agepeacts/screens/home/submitted_Acts.dart';
import 'package:agepeacts/screens/menubar.dart/bottommenu.dart';
import 'package:agepeacts/screens/menubar.dart/sidebar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final GlobalKey<SideMenuState> _settingScreenSideMenuKey =
      GlobalKey<SideMenuState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SideMenu(
        background: Color.fromARGB(255, 35, 49, 66),
        key: _settingScreenSideMenuKey,
        menu: SideBar(),
        type: SideMenuType.shrinkNSlide,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Color(0xffC60000),
            title: Center(child: Text('Settings')),
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
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ))
            ],
            leading: InkWell(
                onTap: () {
                  final _state = _settingScreenSideMenuKey.currentState;
                  if (_state!.isOpened)
                    _state.closeSideMenu();
                  else
                    _state.openSideMenu();
                },
                child: Image.asset('assets/images/sideicon.png')),
          ),
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Container(
                width: size.width,
                height: size.height * 0.3,
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DottedBorder(
                      borderType: BorderType.Circle,
                      dashPattern: [15, 10],
                      strokeWidth: 3,
                      //padding
                      padding: EdgeInsets.all(size.width * 0.008),
                      color: Color(0xffc60000),
                      child: Container(
                        width: size.width * 0.28,
                        height: size.height * 0.12,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/Ellipse 770.png'),
                                fit: BoxFit.fill)),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Text(
                      'Jorge Wattson',
                      style: TextStyle(
                          color: Color(0xff19212c),
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: size.height * 0.006,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //location icon

                        Icon(
                          Icons.location_on_outlined,
                          color: Color(0xff7a7a7a),
                          size: size.width * 0.05,
                        ),
                        SizedBox(
                          width: size.width * 0.01,
                        ),
                        Text(
                          'Georgia',
                          style: TextStyle(
                              color: Color(0xff7a7a7a),
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Container(
                width: size.width * 0.9,
                height: size.height * 0.55,
                color: Colors.transparent,
                child: Column(
                  children: [
                    RowforSettingScreen(
                      size: size,
                      image: Image.asset('assets/images/Group 17767.png'),
                      text: 'Account',
                      text1: 'Change your name,phone,number,etc',
                      onpressed: () {},
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Divider(
                        color: Color(0xffe3e3e3),
                        thickness: size.height * 0.0015,
                      ),
                    ),
                    RowforSettingScreen(
                      size: size,
                      image: Image.asset('assets/images/Group 17774.png'),
                      text: 'Security',
                      text1: 'Edit Password-Two Factor Authentication',
                      onpressed: () {},
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Divider(
                        color: Color(0xffe3e3e3),
                        thickness: size.height * 0.0015,
                      ),
                    ),
                    RowforSettingScreen(
                      size: size,
                      image: Image.asset('assets/images/Group 17795.png'),
                      text: 'Activity',
                      text1: 'Show Members Activity On the AgeapeApp',
                      onpressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SubmmitedActs();
                        }));
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Divider(
                        color: Color(0xffe3e3e3),
                        thickness: size.height * 0.0015,
                      ),
                    ),
                    RowforSettingScreen(
                      size: size,
                      image: Image.asset('assets/images/Group 17776.png'),
                      text: 'Help',
                      text1: 'How To-Technical Support',
                      onpressed: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class RowforSettingScreen extends StatelessWidget {
  const RowforSettingScreen({
    super.key,
    required this.size,
    required this.image,
    required this.text,
    required this.text1,
    required this.onpressed,
  });

  final Size size;
  final Image image;
  final String text;
  final String text1;
  final onpressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image(
          image: image.image,
        ),
        SizedBox(
          width: size.width * 0.025,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(
                  color: Color(0xff19212c),
                  fontSize: size.width * 0.045,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: size.height * 0.002,
            ),
            Text(
              text1,
              style: TextStyle(
                  color: Color(0xff7a7a7a),
                  fontSize: size.width * 0.033,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
        Spacer(),
        InkWell(
          onTap: onpressed,
          child: Icon(Icons.arrow_forward_ios_outlined,
              color: Color(0xff19212c), size: size.width * 0.05),
        )
      ],
    );
  }
}
