import 'dart:io';

import 'package:agepeacts/custom_widgets/contants.dart';
import 'package:agepeacts/screens/menubar.dart/bottommenu.dart';
import 'package:agepeacts/screens/menubar.dart/sidebar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:image_picker/image_picker.dart';

class NominateGiver extends StatefulWidget {
  const NominateGiver({super.key});

  @override
  State<NominateGiver> createState() => _NominateGiverState();
}

class _NominateGiverState extends State<NominateGiver> {
  final GlobalKey<SideMenuState> _nominateSideMenuKey =
      GlobalKey<SideMenuState>();
  Color individualContainerColor = Color(0xffC60000);
  Color organizationContainerColor = Colors.white;
  Color individualTextColor = Colors.white;
  Color organizationTextColor = Color(0xffC60000);
  final ImagePicker _picker = ImagePicker();

  XFile? _image;

  Future getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = XFile(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

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

  TextEditingController FnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SideMenu(
      background: Color.fromARGB(255, 35, 49, 66),
      type: SideMenuType.shrinkNSlide,
      key: _nominateSideMenuKey,
      menu: SideBar(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xffC60000),
          actions: [
            IconButton(
              onPressed: () {
                //open siderbar menu
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
              icon: Icon(Icons.more_vert),
            ),
          ],
          title: Center(child: Text('Nominate a Giver')),
          leading: InkWell(
              onTap: () {
                setState(() {
                  final _state = _nominateSideMenuKey.currentState;
                  if (_state!.isOpened)
                    _state.closeSideMenu();
                  else
                    _state.openSideMenu();
                });
              },
              child: Image.asset('assets/images/sideicon.png')),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: size.width,
                height: size.height * 0.08,
                color: Colors.transparent,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    width: size.width * 0.9,
                    height: size.height * 0.05,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: Color(0xffcccccc),
                        width: size.width * 0.005,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            changeContainerColor('Individual');
                          },
                          child: Container(
                              width: size.width * 0.445,
                              height: size.height * 0.05,
                              decoration: BoxDecoration(
                                color: individualContainerColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Individual',
                                  style: TextStyle(
                                    color: individualTextColor,
                                    fontSize: 15,
                                  ),
                                ),
                              )),
                        ),
                        InkWell(
                          onTap: () {
                            changeContainerColor('Organization');
                          },
                          child: Container(
                            width: size.width * 0.445,
                            height: size.height * 0.05,
                            decoration: BoxDecoration(
                              color: organizationContainerColor,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Organization',
                                style: TextStyle(
                                  color: organizationTextColor,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
              ),
              SizedBox(
                height: size.height * 0.008,
              ),
              SingleChildScrollView(
                child: Container(
                  width: size.width,
                  height: size.height * 0.7855,
                  decoration: BoxDecoration(
                      color: Color(0xffF5F7F9),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: size.height * 0.02,
                        ),
                        width: size.width * 0.9,
                        child: TextFormFieldAuth(
                            Controller: FnameController,
                            size: size,
                            text: 'Fullname',
                            onpressed: () {},
                            icon: Icon(
                              Icons.person,
                              color: Colors.black,
                            )),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Container(
                        width: size.width * 0.9,
                        child: TextFormFieldAuth(
                            Controller: emailController,
                            size: size,
                            text: 'Email',
                            onpressed: () {},
                            icon: Icon(
                              Icons.email,
                              color: Colors.black,
                            )),
                      ),
                      //container size.width*0.9 and height size.height*0.3 in which user can write message to the giver upto 500 characters and in write bottom write hint text that you can write upto 500 characters
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Container(
                        width: size.width * 0.9,
                        height: size.height * 0.2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            maxLines: 10,
                            maxLength: 500,
                            decoration: InputDecoration(
                              hintText: 'Write your message here...',
                              hintStyle: TextStyle(
                                color: Color(0xffA4A4A4),
                                fontSize: 15,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      //container size.width*0.9 and height size.height*0.3 in which user caan upload pictures in vedio
                      DottedBorder(
                        borderType: BorderType.RRect,
                        dashPattern: [8, 4],
                        strokeWidth: 2,
                        radius: Radius.circular(10),
                        color: Color(0xffC60000),
                        child: InkWell(
                          onTap: () {
                            getImage();
                          },
                          child: Container(
                              width: size.width * 0.9,
                              height: size.height * 0.16,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 247, 218, 218),
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: _image == null
                                      ? AssetImage(
                                          'assets/images/image (15) 1 (Traced).png')
                                      : FileImage(File(_image!.path))
                                          as ImageProvider,
                                  fit: BoxFit.cover,
                                ),

                                //dotid border
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  Container(
                                    width: size.width * 0.15,
                                    height: size.height * 0.06,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(6))),
                                    child: Image.asset(
                                        'assets/images/image (15) 1 (Traced).png'),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  Text(
                                    'Upload pictures and videos',
                                    style: TextStyle(
                                      color: Color(0xff19212C),
                                      fontSize: size.width * 0.05,
                                    ),
                                  ),
                                  Text(
                                    'Up to 52 MB',
                                    style: TextStyle(
                                      color: Color(0xff7C7878),
                                      fontSize: size.width * 0.04,
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.1,
                      ),

                      ButtonRedForAuth(
                          size: size,
                          text: 'Submit Nomination',
                          onpressed: () {})
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
//function for image picker from gallery
 
