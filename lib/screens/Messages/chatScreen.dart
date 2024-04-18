import 'package:agepeacts/screens/menubar.dart/bottommenu.dart';
import 'package:agepeacts/screens/menubar.dart/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    super.key,
    this.name,
  });
  final String? name;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final GlobalKey<SideMenuState> _chatScreenSideMenuKey =
      GlobalKey<SideMenuState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SideMenu(
        background: Color.fromARGB(255, 35, 49, 66),
        type: SideMenuType.shrinkNSlide,
        key: _chatScreenSideMenuKey,
        menu: SideBar(),
        child: GestureDetector(
          onTap: () {
            final _state = _chatScreenSideMenuKey.currentState;
            if (_state!.isOpened) _state.closeSideMenu();

            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            backgroundColor: Color(0xffF3F3F3),
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Color(0xffC60000),
              title: Center(child: Text('${widget.name}')),
              leading: InkWell(
                  onTap: () {
                    setState(() {
                      final _state = _chatScreenSideMenuKey.currentState;
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
            body: Column(
              children: [
                Expanded(
                    child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 15),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage('assets/images/1.png'),
                          ),
                          SizedBox(width: 10),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Container(
                              width: size.width * 0.65,
                              height: size.height * 0.07,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.4),
                                    spreadRadius: 2,
                                    blurRadius: 1,
                                    offset: Offset(
                                        0, 1), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 5, bottom: 5),
                                child: Center(
                                  child: Text(
                                    'Hello, nice to see you again today.Hope you are well',
                                    style: TextStyle(
                                      color: Color(0Xff757C83),
                                      fontSize: size.width * 0.035,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 75, top: 5),
                      child: Row(
                        children: [
                          Text('12:30 pm',
                              style: TextStyle(
                                color: Color(0Xffc60000),
                                fontSize: size.width * 0.035,
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: size.width * 0.5,
                          height: size.height * 0.07,
                          decoration: BoxDecoration(
                            color: Color(0xffc60000),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                spreadRadius: 2,
                                blurRadius: 1,
                                offset:
                                    Offset(0, 1), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  'Hi, Doing good. How about you feeling good',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.width * 0.035,
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: CircleAvatar(
                            radius: 18,
                            backgroundImage: AssetImage('assets/images/1.png'),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 250, top: 5),
                      child: Row(
                        children: [
                          Text('12:30 pm',
                              style: TextStyle(
                                color: Color(0Xffc60000),
                                fontSize: size.width * 0.035,
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                    )
                  ],
                )),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: size.height * 0.05,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          textAlign: TextAlign.start,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(204, 204, 204, 0.55),
                            hintText: 'Type a message...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            prefixIcon: Icon(Icons.emoji_emotions_outlined),
                            suffixIcon: Icon(Icons.camera_alt_rounded),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      CircleAvatar(
                        backgroundColor: Color(0xffC60000),
                        child: Center(
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.send,
                              color: Colors.white,
                              size: size.width * 0.05,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
