import 'package:agepeacts/provider/providers.dart';
import 'package:agepeacts/screens/home/act_of_kindness.dart';
import 'package:agepeacts/screens/home/top_badges.dart';
import 'package:agepeacts/screens/home/top_givers.dart';
import 'package:agepeacts/screens/oppurtuntiesScreens/oppuetuntiesScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class FriendsScreen extends StatefulWidget {
  const FriendsScreen({super.key});

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/images/butterfly.mp4');
    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the video controller when done.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List imagesGivers = [
      'assets/images/Ellipse 784.png',
      'assets/images/Ellipse 785.png',
      'assets/images/Ellipse 786.png',
      'assets/images/Ellipse 787.png',
      'assets/images/Ellipse 788.png',
      'assets/images/Ellipse 784 (1).png',
      'assets/images/Ellipse 785 (1).png',
      'assets/images/Ellipse 786 (1).png',
    ];
    List namesGivers = [
      'Jorge',
      'Maria',
      'Sara',
      'Kane',
      'Juliana',
      'Lavem',
      'Frank',
      'Garry',
    ];
    List imagesBadge = [
      'assets/images/Ellipse 784 (1).png',
      'assets/images/Ellipse 785 (1).png',
      'assets/images/Ellipse 786 (1).png',
      'assets/images/Ellipse 787 (1).png',
      'assets/images/Ellipse 788 (1).png',
      'assets/images/Ellipse 784.png',
      'assets/images/Ellipse 785.png',
    ];
    List namesBadges = [
      'Lavem',
      'Frank',
      'Garry',
      'Kianna',
      'Merry',
      'Jorge',
      'Maria',
    ];
    var size = MediaQuery.of(context).size;
    return Consumer<vedioProvider>(
      builder: (context, vedioProvider, child) => Scaffold(
        backgroundColor: Color(0xffF3F3F3),
        body: Center(
          child: Container(
            width: size.width * 0.9,
            height: double.infinity,
            color: Colors.transparent,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Acts of Kindness',
                        style: TextStyle(
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ActOfKindness()));
                        },
                        child: Text(
                          'View More',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xffC60000),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Container(
                    width: double.infinity,
                    height: size.height * 0.48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundImage:
                                    AssetImage('assets/images/Ellipse 23.png'),
                              ),
                              SizedBox(
                                width: size.width * 0.02,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Dark_Emeralds',
                                    style: TextStyle(
                                      fontSize: size.width * 0.04,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff3E3E3E),
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.005,
                                  ),
                                  Container(
                                    width: size.width * 0.22,
                                    height: size.height * 0.023,
                                    decoration: BoxDecoration(
                                      color: Color(0xff3576BF),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Spontaneous',
                                        style: TextStyle(
                                          fontSize: size.width * 0.03,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: size.width * 0.25,
                              ),
                              Container(
                                width: size.width * 0.15,
                                height: size.height * 0.03,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(0, 0, 0, 0.06),
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: Color(0xffCCCCCC),
                                    width: 1,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.messenger_outline,
                                      color: Color(0xff242424),
                                      size: 15,
                                    ),
                                    SizedBox(
                                      width: size.width * 0.01,
                                    ),
                                    Text(
                                      '47',
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Lloyd was very helpful today by taking my mother food and snacks for the week.',
                            style: TextStyle(
                              fontSize: size.width * 0.035,
                              color: Color(0xff424242),
                            ),
                          ),
                        ),
                        Stack(children: [
                          InkWell(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Container(
                                width: size.width * 0.85,
                                height: size.height * 0.23,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 126, 124, 124),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: _controller.value.isInitialized
                                    ? AspectRatio(
                                        aspectRatio:
                                            _controller.value.aspectRatio,
                                        child: VideoPlayer(_controller),
                                      )
                                    : Container(),
                              ),
                            ),
                            onTap: () {
                              vedioProvider.setController(_controller);
                              vedioProvider.playvedio();
                            },
                          ),
                          Positioned(
                            top: 70,
                            left: 135,
                            child: Container(
                                alignment: Alignment.center,
                                width: size.width * 0.1,
                                height: size.height * 0.05,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(0, 0, 0, 0.5),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: //if vedio is paused icon is play otherwise pause
                                    _controller.value.isPlaying
                                        ? Icon(
                                            Icons.pause,
                                            color: Colors.white,
                                          )
                                        : Icon(
                                            Icons.play_arrow,
                                            color: Colors.white,
                                          )),
                          )
                        ]),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            children: [
                              Container(
                                width: size.width * 0.18,
                                child: Stack(children: [
                                  Image(
                                      image: AssetImage(
                                          'assets/images/Ellipse 24.png')),
                                  Positioned(
                                    left: 14,
                                    child: Image(
                                        image: AssetImage(
                                            'assets/images/Ellipse 25.png')),
                                  ),
                                  Positioned(
                                    left: 28,
                                    child: Image(
                                        image: AssetImage(
                                            'assets/images/Ellipse 26.png')),
                                  ),
                                ]),
                              ),
                              Text(
                                'Connie and 56 other likes it',
                                style: TextStyle(
                                  fontSize: size.width * 0.035,
                                  color: Color(0xff737373),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            children: [
                              Container(
                                width: size.width * 0.26,
                                height: size.height * 0.038,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(198, 0, 0, 0.12),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 6.0),
                                    child: Row(
                                      children: [
                                        Image(
                                            image: AssetImage(
                                                'assets/images/Group.png')),
                                        SizedBox(
                                          width: size.width * 0.02,
                                        ),
                                        Text(
                                          'Applaud',
                                          style: TextStyle(
                                            fontSize: size.width * 0.035,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xffC60000),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.messenger_outline,
                                    color: Color(0xff8C8A8A),
                                    size: size.width * 0.055,
                                  ),
                                  Text('Comment',
                                      style: TextStyle(
                                        fontSize: size.width * 0.035,
                                        color: Color(0xff8C8A8A),
                                      )),
                                ],
                              ),
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.share,
                                    color: Color(0xff8C8A8A),
                                    size: size.width * 0.055,
                                  ),
                                  Text('Share',
                                      style: TextStyle(
                                        fontSize: size.width * 0.035,
                                        color: Color(0xff8C8A8A),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Top Givers',
                          style: TextStyle(
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff3E3E3E),
                          )),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TopGivers()));
                        },
                        child: Text(
                          'View More',
                          style: TextStyle(
                            fontSize: size.width * 0.035,
                            color: Color(0xffC60000),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Container(
                    width: size.width * 0.9,
                    height: size.height * 0.122,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: namesGivers.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundImage:
                                    AssetImage(imagesGivers[index]),
                              ),
                              SizedBox(
                                height: size.height * 0.005,
                              ),
                              Text(
                                namesGivers[index],
                                style: TextStyle(
                                  fontSize: size.width * 0.035,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff3E3E3E),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Top Badges',
                        style: TextStyle(
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff3E3E3E),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TopBadges()));
                        },
                        child: Text(
                          'View More',
                          style: TextStyle(
                            fontSize: size.width * 0.035,
                            color: Color(0xffC60000),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Container(
                    width: size.width * 0.9,
                    height: size.height * 0.12,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: imagesBadge.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundImage: AssetImage(imagesBadge[index]),
                              ),
                              SizedBox(
                                height: size.height * 0.005,
                              ),
                              Text(
                                namesBadges[index],
                                style: TextStyle(
                                  fontSize: size.width * 0.035,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff3E3E3E),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Opportunties to Give',
                        style: TextStyle(
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff3E3E3E),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OppurtuntiesScreen()));
                        },
                        child: Text(
                          'View More',
                          style: TextStyle(
                            fontSize: size.width * 0.035,
                            color: Color(0xffC60000),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Container(
                    width: size.width * 0.9,
                    height: size.height * 0.085,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Feed Seniors',
                                    style: TextStyle(
                                      fontSize: size.width * 0.04,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff3E3E3E),
                                    )),
                                SizedBox(
                                  height: size.height * 0.005,
                                ),
                                Text('With Doorways for women and families',
                                    style: TextStyle(
                                      fontSize: size.width * 0.035,
                                      color: Color(0xff8C8A8A),
                                    )),
                              ],
                            ),
                            Container(
                              width: size.width * 0.16,
                              height: size.height * 0.031,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(0, 0, 0, 0.06),
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Color(0xffCCCCCC),
                                  width: 1,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '4.7 Miles',
                                  style: TextStyle(
                                    fontSize: size.width * 0.03,
                                    color: Color(0xff242424),
                                  ),
                                ),
                              ),
                            )
                          ]),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.012,
                  ),
                  Container(
                    width: size.width * 0.9,
                    height: size.height * 0.085,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Monthly Food Distribution',
                                    style: TextStyle(
                                      fontSize: size.width * 0.04,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff3E3E3E),
                                    )),
                                SizedBox(
                                  height: size.height * 0.005,
                                ),
                                Text('With new creation christian church',
                                    style: TextStyle(
                                      fontSize: size.width * 0.035,
                                      color: Color(0xff8C8A8A),
                                    )),
                              ],
                            ),
                            Container(
                              width: size.width * 0.16,
                              height: size.height * 0.031,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(0, 0, 0, 0.06),
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Color(0xffCCCCCC),
                                  width: 1,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '5.1 Miles',
                                  style: TextStyle(
                                    fontSize: size.width * 0.03,
                                    color: Color(0xff242424),
                                  ),
                                ),
                              ),
                            )
                          ]),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.012,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
