import 'package:agepeacts/provider/providers.dart';
import 'package:agepeacts/screens/home/friendsScreeen.dart';
import 'package:agepeacts/screens/menubar.dart/bottommenu.dart';
import 'package:agepeacts/screens/menubar.dart/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<SideMenuState> _homeSideMenuKey = GlobalKey<SideMenuState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SideMenu(
        closeIcon: Icon(null),
        background: Color.fromARGB(255, 35, 49, 66),
        key: _homeSideMenuKey,
        maxMenuWidth: size.width * 0.8,
        menu: SideBar(),
        type: SideMenuType.shrinkNSlide,
        child: GestureDetector(
          onTap: () {
            final _state = _homeSideMenuKey.currentState;
            if (_state!.isOpened) _state.closeSideMenu();

            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            backgroundColor: Color(0xffF3F3F3),
            appBar: AppBar(
              elevation: 0,
              title: Center(child: Text('Home')),
              backgroundColor: Color(0xffC60000),
              leading: InkWell(
                child: Image.asset('assets/images/sideicon.png'),
                onTap: () {
                  setState(() {
                    final _state = _homeSideMenuKey.currentState;
                    if (_state!.isOpened)
                      _state.closeSideMenu();
                    else
                      _state.openSideMenu();
                  });
                },
              ),
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
            body: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SearchWalaContainer(size: size),
                    SizedBox(height: size.height * 0.016),
                    Consumer<homeProvider>(
                      builder: (context, value, child) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                value.screenchange(0);
                                value.changeContainerColor('Individual');
                              },
                              child: Container(
                                width: size.width * 0.4,
                                height: size.height * 0.05,
                                decoration: BoxDecoration(
                                  color: value.individualContainerColor,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    topLeft: Radius.circular(10),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Friends',
                                    style: TextStyle(
                                        color: value.individualTextColor),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                value.screenchange(1);
                                value.changeContainerColor('Organization');
                              },
                              child: Container(
                                width: size.width * 0.4,
                                height: size.height * 0.05,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xffCCCCCC)),
                                  color: value.organizationContainerColor,
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'All Members',
                                    style: TextStyle(
                                        color: value.organizationTextColor),
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                    SizedBox(height: size.height * 0.015),
                    Container(
                      width: double.infinity,
                      height: size.height * 0.716,
                      child: FriendsScreen(),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class SearchWalaContainer extends StatelessWidget {
  const SearchWalaContainer({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: size.height * 0.08,
      color: Color(0xffC60000),
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 0.77),
            ),
            prefixIcon: Icon(
              Icons.search,
              color: Color.fromRGBO(255, 255, 255, 0.77),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide:
                  BorderSide(color: Color.fromRGBO(255, 255, 255, 0.77)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide:
                  BorderSide(color: Color.fromRGBO(255, 255, 255, 0.77)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide:
                  BorderSide(color: Color.fromRGBO(255, 255, 255, 0.77)),
            ),
            contentPadding: EdgeInsets.only(top: 10),
          ),
        ),
      ),
    );
  }
}
