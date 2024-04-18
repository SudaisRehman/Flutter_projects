import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CustomPostWidget extends StatefulWidget {
  @override
  _CustomPostWidgetState createState() => _CustomPostWidgetState();
}

class _CustomPostWidgetState extends State<CustomPostWidget> {
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
    var size = MediaQuery.of(context).size;
    List<Map<String, dynamic>> postData = [
      {
        'imageUrl': 'assets/images/Ellipse 23 (2).png',
        'name': 'Dark_Emeralds',
        'vedio': 'assets/images/butterfly.mp4',
        'post':
            'Lloyd was very helpful today by taking my mother food and snacks for the week.',
        'ads': 'spontaneous',
      },
      {
        'imageUrl': 'assets/images/Ellipse 27.png',
        'name': 'Lucy wise',
        'vedio': 'assets/images/butterfly.mp4',
        'post':
            'So you\'re going abroad, you\'ve chosen your destination and now you have to choose a hotel. We will make some arrangements. So you are going abroad,.. ',
        'ads': 'Purpose-Driven',
      },
      {
        'imageUrl': 'assets/images/Ellipse 27.png',
        'name': 'Dark_Emeralds',
        'vedio': 'assets/images/butterfly.mp4',
        'post':
            'So you\'re going abroad, you\'ve chosen your destination and now you have to choose a hotel. We will make some arrangements. So you are going abroad,.. ',
        'ads': 'Purpose-Driven',
      },
    ];

    return Container(
      width: size.width * 0.9,
      height: size.height * 0.716,
      child: ListView.builder(
        itemCount: postData.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8),
            child: Container(
              width: double.infinity,
              height: size.height * 0.5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color(0xffCCCCCC),
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: postData[index]['imageUrl'] == null
                              ? AssetImage('assets/images/Ellipse 23.png')
                              : AssetImage(postData[index]['imageUrl']!),
                        ),
                        SizedBox(
                          width: size.width * 0.02,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              postData[index]['name'] == null
                                  ? 'Dark_Emeralds'
                                  : postData[index]['name']!,
                              style: TextStyle(
                                fontSize: 15,
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
                                //if spontaneous then red otherwise blue
                                color: postData[index]['ads'] == 'spontaneous'
                                    ? Color(0xff3576BF)
                                    : Color(0xff5E35B1),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Text(
                                  postData[index]['ads'] == null
                                      ? 'spontaneous'
                                      : postData[index]['ads']!,
                                  style: TextStyle(
                                    fontSize: 10,
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
                      postData[index]['post'] == null
                          ? 'Lloyd was very helpful today by taking my mother food and snacks for the week.'
                          : postData[index]['post']!,
                      style: TextStyle(
                        fontSize: 14,
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
                                  aspectRatio: _controller.value.aspectRatio,
                                  child: VideoPlayer(_controller),
                                )
                              : Container(),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          if (_controller.value.isPlaying) {
                            _controller.pause();
                          } else {
                            _controller.play();
                          }
                        });
                      },
                    ),
                    Positioned(
                      top: 70,
                      left: 150,
                      child: Container(
                          width: size.width * 0.1,
                          height: size.height * 0.05,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(0, 0, 0, 0.5),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: //if video is paused icon is play otherwise pause
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
                          child: Stack(
                            children: [
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
                            ],
                          ),
                        ),
                        Text(
                          'Connie and 56 others like it',
                          style: TextStyle(
                            fontSize: 12,
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
                                      fontSize: 14,
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
                                  fontSize: 14,
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
                                  fontSize: 14,
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
          );
        },
      ),
    );
  }
}
