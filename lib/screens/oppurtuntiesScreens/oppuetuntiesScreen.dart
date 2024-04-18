import 'package:agepeacts/screens/menubar.dart/bottommenu.dart';
import 'package:agepeacts/screens/menubar.dart/sidebar.dart';
import 'package:agepeacts/screens/oppurtuntiesScreens/oppurtuntiesData.dart';
import 'package:flutter/material.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class OppurtuntiesScreen extends StatefulWidget {
  OppurtuntiesScreen({super.key});

  @override
  State<OppurtuntiesScreen> createState() => _OppurtuntiesScreenState();
}

class _OppurtuntiesScreenState extends State<OppurtuntiesScreen> {
  final GlobalKey<SideMenuState> _oppurtuntiesScreenSideMenuKey =
      GlobalKey<SideMenuState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SideMenu(
      key: _oppurtuntiesScreenSideMenuKey,
      background: Color.fromARGB(255, 35, 49, 66),
      type: SideMenuType.shrinkNSlide,
      menu: SideBar(),
      child: Scaffold(
        backgroundColor: Color(0xffF3F3F3),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xffC60000),
          title: Center(child: Text('Oppurtunties')),
          leading: InkWell(
              onTap: () {
                setState(() {
                  final _state = _oppurtuntiesScreenSideMenuKey.currentState;
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
            Container(
              width: double.infinity,
              height: size.height * 0.08,
              color: Color(0xffC60000),
              child: Container(
                margin:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: size.width * 0.42,
                          height: size.height * 0.05,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Color(0xffffffff),
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Enter ZipCode ',
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 0.66),
                                  fontSize: size.width * 0.035,
                                  fontWeight: FontWeight.w400),
                            ),
                          )),
                      Container(
                          width: size.width * 0.42,
                          height: size.height * 0.05,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Color(0xffffffff),
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Distance(i.e. 10miles)',
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 0.66),
                                  fontSize: size.width * 0.035,
                                  fontWeight: FontWeight.w400),
                            ),
                          )),
                    ]),
              ),
            ),
            Expanded(
                child: Container(
              width: size.width * 0.9,
              height: size.height,
              color: Color(0xffF3F3F3),
              child: ListView.builder(
                itemCount: OppurtuntiesScreenData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      width: size.width * 0.9,
                      height: size.height * 0.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(
                          color: Color.fromRGBO(255, 255, 255, 0.08),
                          width: 2,
                        ),
                      ),
                      child: ListTile(
                        title: Text(
                          OppurtuntiesScreenData[index]['title'],
                          style: TextStyle(
                              color: Color(0xff19212C),
                              fontSize: size.width * 0.047,
                              fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                            OppurtuntiesScreenData[index]['discription'],
                            style: TextStyle(
                                color: Color(0xff757C83),
                                fontSize: size.width * 0.033,
                                fontWeight: FontWeight.w400)),
                        trailing: Text(OppurtuntiesScreenData[index]['miles'],
                            style: TextStyle(
                                color: Color(0xff3E454B),
                                fontSize: size.width * 0.033,
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                  );
                },
              ),
            )),
          ],
        ),
      ),
    );
  }
}
