import 'package:agepeacts/custom_widgets/custom_post.dart';
import 'package:agepeacts/screens/home/home.dart';
import 'package:agepeacts/screens/menubar.dart/bottommenu.dart';
import 'package:agepeacts/screens/menubar.dart/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:video_player/video_player.dart';

class ActOfKindness extends StatefulWidget {
  const ActOfKindness({super.key});

  @override
  State<ActOfKindness> createState() => _ActOfKindnessState();
}

class _ActOfKindnessState extends State<ActOfKindness> {
  final GlobalKey<SideMenuState> _actofKindnessSideMenuKey =
      GlobalKey<SideMenuState>();

  Color individualContainerColor = Color(0xffC60000);
  Color organizationContainerColor = Colors.white;
  Color individualTextColor = Colors.white;
  Color organizationTextColor = Color(0xffC60000);
  void changeContainerColor(String containerType) {
    setState(() {
      if (containerType == 'Individual') {
        individualContainerColor =
            Color(0xffc60000); // Change to the desired color
        organizationContainerColor =
            Colors.white; // Reset the other container's color
        individualTextColor = Colors.white;
        organizationTextColor = Color(0xffa4a4a4);
      } else if (containerType == 'Organization') {
        individualContainerColor =
            Colors.white; // Reset the other container's color
        organizationContainerColor =
            Color(0xffc60000); // Change to the desired color
        organizationTextColor = Colors.white;
        individualTextColor = Color(0xffa4a4a4);
      }
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SideMenu(
      background: Color.fromARGB(255, 35, 49, 66),
      key: _actofKindnessSideMenuKey,
      menu: SideBar(),
      type: SideMenuType.shrinkNSlide,
      child: GestureDetector(
        onTap: () {
          final _state = _actofKindnessSideMenuKey.currentState;
          if (_state!.isOpened) _state.closeSideMenu();

          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: InkWell(
                onTap: () {
                  setState(() {
                    final _state = _actofKindnessSideMenuKey.currentState;
                    if (_state!.isOpened)
                      _state.closeSideMenu();
                    else
                      _state.openSideMenu();
                  });
                },
                child: Image.asset('assets/images/sideicon.png')),
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
                  //open siderbar menu
                },
                icon: Icon(Icons.more_vert),
              ),
            ],
            title: Center(child: Text('Act of Kindness')),
            backgroundColor: Color(0xffC60000),
          ),
          body: Container(
            decoration: BoxDecoration(
              color: Color(0xffF3F3F3),
            ),
            child: Center(
              child: Column(children: [
                SearchWalaContainer(size: size),
                SizedBox(height: size.height * 0.016),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          changeContainerColor('Individual');
                        });
                        //open friends screen
                      },
                      child: Container(
                        width: size.width * 0.4,
                        height: size.height * 0.05,
                        decoration: BoxDecoration(
                          color: individualContainerColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            topLeft: Radius.circular(10),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Friends',
                            style: TextStyle(color: individualTextColor),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          changeContainerColor('Organization');
                        });
                        //open organization screen
                      },
                      child: Container(
                        width: size.width * 0.4,
                        height: size.height * 0.05,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffCCCCCC)),
                          color: organizationContainerColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'All Members',
                            style: TextStyle(color: organizationTextColor),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Expanded(child: CustomPostWidget())
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
