import 'package:agepeacts/screens/friendScreenss/friendRequestData.dart';
import 'package:agepeacts/screens/menubar.dart/bottommenu.dart';
import 'package:agepeacts/screens/menubar.dart/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class FriendsRequestScreen extends StatelessWidget {
  final GlobalKey<SideMenuState> _friendsRequestScreenSideMenuKey =
      GlobalKey<SideMenuState>();
  FriendsRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SideMenu(
        key: _friendsRequestScreenSideMenuKey,
        menu: SideBar(),
        type: SideMenuType.shrinkNSlide,
        background: Color.fromARGB(255, 35, 49, 66),
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Color(0xffC60000),
            title: Center(child: Text('Friend Requests')),
            actions: [
              IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return BottomMenu();
                        });
                  },
                  icon: Icon(Icons.more_vert))
            ],
            leading: InkWell(
                onTap: () {
                  if (_friendsRequestScreenSideMenuKey.currentState!.isOpened) {
                    _friendsRequestScreenSideMenuKey.currentState!
                        .closeSideMenu();
                  } else {
                    _friendsRequestScreenSideMenuKey.currentState!
                        .openSideMenu();
                  }
                },
                child: Image.asset('assets/images/sideicon.png')),
          ),
          body: Container(
            child: Center(
              child: Container(
                width: size.width * 0.9,
                height: size.height * 0.9,
                color: Colors.transparent,
                child: Column(children: [
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    children: [
                      Text(
                        'Friend Requests',
                        style: TextStyle(
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff3E3E3E)),
                      ),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      Text(
                        '252',
                        style: TextStyle(
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffc60000)),
                      ),
                      Spacer(),
                      Text(
                        'See all',
                        style: TextStyle(
                          color: Color(0xff3576BF),
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Expanded(
                      child: ListView.builder(
                    itemCount: RequestsData.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  AssetImage(RequestsData[index]['image']),
                            ),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          RequestsData[index]['name'],
                                          style: TextStyle(
                                              fontSize: size.width * 0.04,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff3E3E3E)),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 4),
                                          child: Text(
                                            RequestsData[index]
                                                ['mutualFriends'],
                                            style: TextStyle(
                                                fontSize: size.width * 0.03,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(
                                                    62, 62, 62, 0.69)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: size.width * 0.2,
                                    ),
                                    Text(RequestsData[index]['requesttime'],
                                        style: TextStyle(
                                            fontSize: size.width * 0.03,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xffACA9A9))),
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: size.width * 0.3,
                                      height: size.height * 0.032,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(0xffC60000),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Confirm',
                                          style: TextStyle(
                                              fontSize: size.width * 0.037,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.025,
                                    ),
                                    Container(
                                      width: size.width * 0.3,
                                      height: size.height * 0.032,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(0xffDBDBDB),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Confirm',
                                          style: TextStyle(
                                              fontSize: size.width * 0.037,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff424242)),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ))
                ]),
              ),
            ),
          ),
        ));
  }
}
