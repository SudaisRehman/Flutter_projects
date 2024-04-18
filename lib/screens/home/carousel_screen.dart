import 'package:agepeacts/custom_widgets/contants.dart';

import 'package:agepeacts/screens/home/home.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselScreen extends StatefulWidget {
  const CarouselScreen({super.key});

  @override
  State<CarouselScreen> createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> {
  final CarouselController _carouselController = CarouselController();

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(color: Color(0xffffffff)),
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: size.height * 0.41,
              decoration: BoxDecoration(
                color: Color(0xffC60000),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0, left: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(image: AssetImage('assets/images/ageapelogo.png')),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                  margin: EdgeInsets.only(top: size.height * 0.12),
                  width: size.width * 0.9,
                  height: size.height * 0.85,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.transparent,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CarouselSlider(
                        carouselController: _carouselController,
                        options: CarouselOptions(
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                          height: size.height * 0.65,
                          viewportFraction: 1.0,
                          enlargeCenterPage: false,
                          autoPlay: true,
                        ),
                        items: combinedList.map((item) {
                          return Container(
                            child: Column(
                              children: [
                                Expanded(child: item.image),
                                // Image
                                SizedBox(height: 10),
                                // Spacing between image and text
                                SizedBox(
                                  height: size.height * 0.02,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    for (int i = 0;
                                        i < combinedList.length;
                                        i++)
                                      if (i == combinedList.indexOf(item))
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Container(
                                              width: 8,
                                              height: 8,
                                              decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xffC60000),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                        )
                                      else
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Container(
                                              width: 8,
                                              height: 8,
                                              decoration: BoxDecoration(
                                                  color: Color(0XFFE3E3E3),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                        )
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * 0.02,
                                ),
                                Text(
                                  item.text.data.toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xff3E3E3E)),
                                ),
                                SizedBox(height: 15),
                                // Spacing between text and text

                                Text(item.text1!.data.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xff8C8A8A))),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                      SizedBox(
                        height: size.height * 0.09,
                      ),
                      ButtonRedForAuth(
                        size: size,
                        text: currentIndex == combinedList.length - 1
                            ? 'Explore Agape'
                            : 'Continue',
                        onpressed: () {
                          if (currentIndex == combinedList.length - 1) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          } else {
                            _carouselController.nextPage();
                            setState(() {
                              currentIndex++;
                            });
                          }
                        },
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    ));
  }
}

class CarouselItem {
  final Widget image;
  final Text text;
  final Text? text1;

  CarouselItem({required this.image, required this.text, this.text1});
}

List<CarouselItem> combinedList = [
  CarouselItem(
    image: Image.asset('assets/images/Rectangle 11 (1).png'),
    text: Text('Nominate a Giver'),
    text1: Text(
        'We want to congratulate the givers in the world and give them recognition for their good deeds. Nominate a giver to show the world their good deeds. '),
  ),
  CarouselItem(
    image: Image.asset('assets/images/Rectangle 11 (2).png'),
    text: Text('Give Agape Tokens'),
    text1: Text(
        ' Give your nominee Agape tokens to show your appreciation for their acts of kindness. The Agape token is a token of appreciation to say thank you. '),
  ),
  CarouselItem(
    image: Image.asset('assets/images/Rectangle 11 (3).png'),
    text: Text('Tell The Story'),
    text1: Text(
        'Let the world know how great your nominee has been. Explain their acts of kindness, upload videos and images of the good deed or its results. '),
  ),
  CarouselItem(
    image: Image.asset('assets/images/Rectangle 11 (4).png'),
    text: Text('Give an Applaus'),
    text1: Text(
        'Once your giver receives their Agape Tokens, they can receive an applause from all Agape members. Everyone wants to recognize a job well done. '),
  ),
  CarouselItem(
    image: Image.asset('assets/images/Rectangle 11 (5).png'),
    text: Text('Agape Badges'),
    text1: Text(
        'Agape Badges are given to members that give abundantly. Build up your Agape Tokens to achieve Lifetime Achivement Badges. '),
  ),
  CarouselItem(
    image: Image.asset('assets/images/Rectangle 11 (6).png'),
    text: Text('Agape Gives Community'),
    text1: Text(
        'Interact the Agape Givers Community. You can applaud acts of kindness, add friends, and send kind messages. This community was built to show love. '),
  ),
  CarouselItem(
    image: Image.asset('assets/images/Rectangle 11 (7).png'),
    text: Text('View Opportunity to Give'),
    text1: Text(
        'Are you looking for an opportunity to make a difference? We provide list of opportunities so you can assist organizations in your local community. '),
  ),
];
