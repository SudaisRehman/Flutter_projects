import 'package:agepeacts/screens/Messages/chatScreen.dart';
import 'package:agepeacts/screens/Messages/messagesData.dart';
import 'package:agepeacts/screens/menubar.dart/bottommenu.dart';
import 'package:agepeacts/screens/menubar.dart/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final GlobalKey<SideMenuState> _messagesScreenSideMenuKey =
      GlobalKey<SideMenuState>();
  @override
  Widget build(BuildContext context) {
    bool online = true;
    var size = MediaQuery.of(context).size;
    return SideMenu(
      background: Color.fromARGB(255, 35, 49, 66),
      key: _messagesScreenSideMenuKey,
      type: SideMenuType.shrinkNSlide,
      menu: SideBar(),
      child: GestureDetector(
        onTap: () {
          final _state = _messagesScreenSideMenuKey.currentState;
          if (_state!.isOpened) _state.closeSideMenu();

          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Color(0xffC60000),
            title: Center(child: Text('Messages')),
            leading: InkWell(
                onTap: () {
                  setState(() {
                    final _state = _messagesScreenSideMenuKey.currentState;
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
          ),
          body: Center(
            child: Container(
              width: size.width * 0.92,
              height: size.height,
              decoration: BoxDecoration(
                color: Color(0xffF3F3F3),
              ),
              child: ListView.builder(
                itemCount: messagesdata.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Container(
                      width: size.width * 0.9,
                      height: size.height * 0.09,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Stack(children: [
                            CircleAvatar(
                              radius: size.width * 0.07,
                              // images from messagesdata
                              backgroundImage:
                                  AssetImage(messagesdata[index]['image']),
                            ),
                            Positioned(
                              left: size.width * 0.088,
                              top: size.height * 0.003,
                              child: Container(
                                width: size.width * 0.025,
                                height: size.height * 0.012,
                                decoration: BoxDecoration(
                                  color: online
                                      ? Color(0xff00FF00)
                                      : Color(0xffFF0000),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ]),
                          SizedBox(
                            width: size.width * 0.03,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChatScreen(
                                            name: messagesdata[index]['name'],
                                          )));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  messagesdata[index]['name'],
                                  style: TextStyle(
                                    color: Color(0xff19212C),
                                    fontSize: size.width * 0.045,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.005,
                                ),
                                Flexible(
                                  child: Text(
                                    messagesdata[index]['message'],
                                    style: TextStyle(
                                      color: Color(0xff757C83),
                                      fontSize: size.width * 0.033,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.05,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 10, right: 2),
                                child: Text(
                                  messagesdata[index]['time'],
                                  style: TextStyle(
                                    color: Color(0xff757C83),
                                    fontSize: size.width * 0.033,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
