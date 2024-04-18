import 'package:agepeacts/custom_widgets/custom_post.dart';
import 'package:agepeacts/screens/home/home.dart';
import 'package:agepeacts/screens/menubar.dart/bottommenu.dart';
import 'package:agepeacts/screens/menubar.dart/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class SubmmitedActs extends StatefulWidget {
  const SubmmitedActs({super.key});

  @override
  State<SubmmitedActs> createState() => _SubmmitedActsState();
}

class _SubmmitedActsState extends State<SubmmitedActs> {
  final GlobalKey<SideMenuState> _SubmmitedActsMenuKey =
      GlobalKey<SideMenuState>();

  Color container1Color = Color(0xffc60000);
  Color container1TextColor = Color(0xff424242);
  Color container2Color = Colors.white;
  Color container2TextColor = Color(0xff424242);

  void toggleColors() {
    setState(() {
      if (container1Color == Color(0xffc60000)) {
        container1Color = Colors.white;
        container1TextColor = Color(0xff424242);
        container2Color = Color(0xffc60000);
        container2TextColor = Colors.white;
      } else {
        container1Color = Color(0xffc60000);
        container1TextColor = Colors.white;
        container2Color = Colors.white;
        container2TextColor = Color(0xff424242);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SideMenu(
      background: Color.fromARGB(255, 35, 49, 66),
      key: _SubmmitedActsMenuKey,
      type: SideMenuType.shrinkNSlide,
      menu: SideBar(),
      child: Scaffold(
          appBar: AppBar(
              elevation: 0,
              title: Center(child: Text('Submitted Acts')),
              backgroundColor: Color(0xffC60000),
              leading: InkWell(
                  onTap: () {
                    if (_SubmmitedActsMenuKey.currentState!.isOpened)
                      _SubmmitedActsMenuKey.currentState!.closeSideMenu();
                    else
                      _SubmmitedActsMenuKey.currentState!.openSideMenu();
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
                    },
                    icon: Icon(Icons.more_vert))
              ]),
          body: Column(
            children: [
              SearchWalaContainer(size: size),
              Container(
                width: size.width * 0.9,
                height: size.height * 0.788,
                color: Colors.white,
                child: Column(children: [
                  Container(
                    width: size.width * 0.9,
                    height: size.height * 0.1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.transparent,
                      border: Border.all(
                        color: Color.fromRGBO(255, 255, 255, 0.08),
                        width: 2,
                      ),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              toggleColors();
                            },
                            child: Container(
                              width: size.width * 0.4,
                              height: size.height * 0.04,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Color(0xffC4C4C4),
                                  width: 2,
                                ),
                                color: container1Color,
                              ),
                              child: Center(
                                  child: Text(
                                'Pending',
                                style: TextStyle(
                                  color: container1TextColor,
                                ),
                              )),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              toggleColors();
                            },
                            child: Container(
                              width: size.width * 0.4,
                              height: size.height * 0.04,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Color(0xffC4C4C4),
                                  width: 2,
                                ),
                                color: container2Color,
                              ),
                              child: Center(
                                  child: Text(
                                'Approved',
                                style: TextStyle(
                                  color: container2TextColor,
                                ),
                              )),
                            ),
                          ),
                        ]),
                  ),
                  Expanded(child: CustomPostWidget())
                ]),
              )
            ],
          )),
    );
  }
}
