import 'dart:async';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibration/vibration.dart';

import '../utils.dart';
import '../utils/AssetUtils.dart';
import '../utils/TextStyle_utils.dart';
import '../utils/colorUtils.dart';
import '../wear.dart';

class PeeScreenMethod extends StatefulWidget {
  const PeeScreenMethod({Key? key}) : super(key: key);

  @override
  State<PeeScreenMethod> createState() => _PeeScreenMethodState();
}

class _PeeScreenMethodState extends State<PeeScreenMethod>
    with TickerProviderStateMixin {
  AnimationController? _animationController;
  Animation? _animation;
  bool animation_started = false;
  double percent = 0.0;

  Stopwatch watch = Stopwatch();
  Timer? timer;
  bool startStop = true;
  bool started = true;
  bool button_keep = true;

  String elapsedTime = '00:00';
  String method_selected = '';

  // List<ListMethodClass> method_time = [];

  updateTime(Timer timer) {
    if (watch.isRunning) {
      if (mounted) {
        setState(() {
          print("startstop Inside=$startStop");
          elapsedTime = transformMilliSeconds(watch.elapsedMilliseconds);
          Vibration.vibrate();

          percent += 1;
          if (percent >= 100) {
            percent = 0.0;
          }
        });
      }
    }
  }
  AnimationController? _animationController_button;
  Animation? _animation_button;

  bool shadow_animation1_completed = false;
  bool shadow_animation_pause = false;

  AnimationController? _animationController_shadow1;
  Animation? _animation_shadow1;
  Animation? _animation_shadow1_reverse;
  AnimationController? _animationController_shadow2;
  Animation? _animation_shadow2;

  double text_k_size = 40;

  Animation? _animation_textK;

  // AnimationController? _animationController_textTime;
  Animation? _animation_textTime;
  double button_height = 120;
  double text_time_size = 40;

  start_animation() {
    setState(() {
      animation_started = true;
      print(animation_started);
    });
    // _incrementCounter();
    // vibration();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    // _animationController!.repeat(reverse: true);
    _animationController!.forward();

    _animation = Tween(begin: 0.0, end: 65.0).animate(_animationController!)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {}
        // print(_animation!.value);
      });
    setState(() {
      // _status = 'Inhale';
      // print(_status);
    });
    _animationController_button =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    _animationController_button!.forward();
    _animation_button = Tween(begin: 120.0, end: 70.0)
        .animate(_animationController_button!)
      ..addStatusListener((status) {});
    _animationController_shadow1 =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animationController_shadow1!.forward();
    _animation_shadow1 =
    Tween(begin: 0.0, end: 30.0).animate(_animationController_shadow1!)
      ..addStatusListener((status) {
        print(status);
        if (status == AnimationStatus.completed) {
          // print("elapsedTime");
          setState(() {
            shadow_animation1_completed = true;
            // print(shadow_animation1_completed);
          });
        }
        // shadow_animation1_completed = true;
      });

    _animationController_shadow2 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));
    _animationController_shadow2!.repeat(reverse: true);
    _animation_shadow2 =
    Tween(begin: 30.0, end: 35.0).animate(_animationController_shadow2!)
      ..addStatusListener((status) {
        if (shadow_animation_pause == true) {}
        // print(status);
        // if (status == AnimationStatus.completed) {}
        // shadow_animation1_completed = true;
      });

    // _animationController_textK =
    //     AnimationController(vsync: this, duration: Duration(seconds: 5));
    // _animationController_textK!.forward();
    _animation_textK =
    Tween(begin: 40.0, end: 20.0).animate(_animationController_button!)
      ..addStatusListener((status) {
        // print(status);
        // if (status == AnimationStatus.completed) {
        //   setState(() {});
        //   _animationController_button!.reverse();
        // } else if (status == AnimationStatus.dismissed) {
        //   setState(() {});
        //   _animationController_button!.forward();
        // }
      });

    // _animationController_textTime =
    //     AnimationController(vsync: this, duration: Duration(seconds: 5));
    // _animationController_textTime!.forward();
    _animation_textTime =
    Tween(begin: 40.0, end: 25.0).animate(_animationController_button!)
      ..addStatusListener((status) {
        // print(status);
        // if (status == AnimationStatus.completed) {
        //   setState(() {});
        //   _animationController_button!.reverse();
        // } else if (status == AnimationStatus.dismissed) {
        //   setState(() {});
        //   _animationController_button!.forward();
        // }
      });
  }

  // start_animation() {
  //   setState(() {
  //     animation_started = true;
  //     print(animation_started);
  //   });
  //   // _incrementCounter();
  //   // vibration();
  //   _animationController =
  //       AnimationController(vsync: this, duration: const Duration(seconds: 1));
  //   _animationController!.repeat(reverse: true);
  //   _animation = Tween(begin: 0.0, end: 65.0).animate(_animationController!)
  //     ..addStatusListener((status) {
  //       if (status == AnimationStatus.completed) {}
  //       // print(_animation!.value);
  //     });
  //
  //   _animationController_button =
  //       AnimationController(vsync: this, duration: const Duration(seconds: 5));
  //   _animationController_button!.forward();
  //   _animation_button =
  //   Tween(begin: 200.0, end: 150.0).animate(_animationController_button!)
  //     ..addStatusListener((status) {
  //       // print(status);
  //       // if (status == AnimationStatus.completed) {
  //       //   setState(() {});
  //       //   _animationController_button!.reverse();
  //       // } else if (status == AnimationStatus.dismissed) {
  //       //   setState(() {});
  //       //   _animationController_button!.forward();
  //       // }
  //     });
  //
  //   // _animationController_textK =
  //   //     AnimationController(vsync: this, duration: Duration(seconds: 5));
  //   // _animationController_textK!.forward();
  //   _animation_textK =
  //   Tween(begin: 100.0, end: 70.0).animate(_animationController_button!)
  //     ..addStatusListener((status) {
  //       // print(status);
  //       // if (status == AnimationStatus.completed) {
  //       //   setState(() {});
  //       //   _animationController_button!.reverse();
  //       // } else if (status == AnimationStatus.dismissed) {
  //       //   setState(() {});
  //       //   _animationController_button!.forward();
  //       // }
  //     });
  //
  //   // _animationController_textTime =
  //   //     AnimationController(vsync: this, duration: Duration(seconds: 5));
  //   // _animationController_textTime!.forward();
  //   _animation_textTime =
  //   Tween(begin: 40.0, end: 25.0).animate(_animationController_button!)
  //     ..addStatusListener((status) {
  //       // print(status);
  //       // if (status == AnimationStatus.completed) {
  //       //   setState(() {});
  //       //   _animationController_button!.reverse();
  //       // } else if (status == AnimationStatus.dismissed) {
  //       //   setState(() {});
  //       //   _animationController_button!.forward();
  //       // }
  //     });
  // }

  AnimationController? _animationController_middle;
  Animation? _animation_middle;
  bool animation_started_middle = false;
  Animation? _animation_middle2;
  Animation? _animation_middle3;
  Animation? _animation_middle4;
  bool back_wallpaper = true;

  middle_animation() {
    setState(() {
      animation_started_middle = true;
    });
    _animationController_middle = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _animationController_middle!.forward();
    _animation_middle =
    Tween(begin: 15.0, end: 50.0).animate(_animationController_middle!)
      ..addStatusListener((status) {
        // print(status);
        // shadow_animation1_completed = true;
      });
    _animation_middle2 =
    Tween(begin: 15.0, end: 80.0).animate(_animationController_middle!)
      ..addStatusListener((status) {
        // print(status);
        // shadow_animation1_completed = true;
      });
    _animation_middle3 =
    Tween(begin: 15.0, end: 180.0).animate(_animationController_middle!)
      ..addStatusListener((status) {
        // print(status);
        // shadow_animation1_completed = true;
      });
    _animation_middle4 =
    Tween(begin: 15.0, end: 140.0).animate(_animationController_middle!)
      ..addStatusListener((status) {
        // print(status);
        // shadow_animation1_completed = true;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          // decoration: BoxDecoration(
          //
          //   image: DecorationImage(
          //     image: AssetImage(AssetUtils.backgroundImage), // <-- BACKGROUND IMAGE
          //     fit: BoxFit.cover,
          //   ),
          // ),
          decoration: (back_wallpaper
              ? const BoxDecoration(
            // gradient: LinearGradient(
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            //   // stops: [0.1, 0.5, 0.7, 0.9],
            //   colors: [
            //     HexColor("#000000").withOpacity(0.86),
            //     HexColor("#000000").withOpacity(0.81),
            //     HexColor("#000000").withOpacity(0.44),
            //     HexColor("#000000").withOpacity(1),
            //
            //   ],
            // ),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                AssetUtils.p_screen_back,
              ),
            ),
          )
              : BoxDecoration()),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: WatchShape(builder: (context, shape) {
            var screenSize = MediaQuery.of(context).size;
            final shape = InheritedShape.of(context)?.shape;
            if (shape == Shape.round) {
              // boxInsetLength requires radius, so divide by 2
              screenSize = Size(boxInsetLength(screenSize.width / 2),
                  boxInsetLength(screenSize.height / 2));
            }
            var screenHeight = screenSize.height;
            var screenWidth = screenSize.width;
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Container(
                  //   margin: EdgeInsets.symmetric(vertical: 10),
                  //   width: screenWidth / 2.5,
                  //   height: screenHeight / 2.5,
                  //   decoration: BoxDecoration(
                  //       shape: BoxShape.circle,
                  //       image: DecorationImage(
                  //           alignment: Alignment.center,
                  //           image: AssetImage(AssetUtils.home_button)),
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: (animation_started
                  //               ? HexColor('#F8D44D')
                  //               : Colors.transparent),
                  //           blurRadius:
                  //               (animation_started ? _animation!.value : 0),
                  //           spreadRadius:
                  //               (animation_started ? _animation!.value : 0),
                  //         )
                  //       ]),
                  //   child: Stack(
                  //     children: [
                  //       Container(
                  //         alignment: Alignment.center,
                  //         child: Text(
                  //           'P',
                  //           style: TextStyle(
                  //               color: HexColor('#F8D44D').withOpacity(0.2),
                  //               fontSize: 60,
                  //               fontWeight: FontWeight.w600),
                  //         ),
                  //       ),
                  //       Container(
                  //         alignment: Alignment.center,
                  //         child: Text(
                  //           elapsedTime,
                  //           style: TextStyle(
                  //               color: Colors.white,
                  //               fontSize: 20,
                  //               fontWeight: FontWeight.w900),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  AvatarGlow(
                    endRadius: 80.0,
                    showTwoGlows: true,
                    animate: false,
                    // (startStop ? false : true),
                    duration: const Duration(milliseconds: 900),
                    repeat: true,
                    child: GestureDetector(
                      onTap: () {
                        print('helllllllooooooooooooooo');
                        // startOrStop();
                      },
                      child:
                      // CircularPercentIndicator(
                      //   circularStrokeCap: CircularStrokeCap.round,
                      //   percent: percent / 100,
                      //   animation: true,
                      //   animateFromLastPercent: true,
                      //   radius: 61,
                      //   lineWidth: 0,
                      //   progressColor: Colors.transparent,
                      //   backgroundColor: Colors.transparent,
                      //   center:
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black,
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: (animation_started
                              //         ? HexColor('#F5C921')
                              //         : Colors.transparent),
                              //     blurRadius: (animation_started
                              //         ? _animation!.value
                              //         : 0),
                              //     spreadRadius: (animation_started
                              //         ? _animation!.value
                              //         : 0),
                              //   )
                              // ]
                              boxShadow: [
                                BoxShadow(
                                  color: (animation_started
                                      ? HexColor('#F5C921')
                                      : Colors.transparent),
                                  spreadRadius: (animation_started
                                      ? (shadow_animation1_completed
                                      ? _animation_shadow2!.value
                                      : _animation_shadow1!.value)
                                      : 0),
                                  blurRadius: 20,
                                )
                              ],
                            ),
                          ),
                          // (animation_started
                          //     ? DottedBorder(
                          //   borderType: BorderType.Circle,
                          //   strokeWidth: 3,
                          //   dashPattern: [0, 6],
                          //   strokeCap: StrokeCap.round,
                          //   radius: Radius.circular(100),
                          //   padding: EdgeInsets.all(0),
                          //   color: Colors.red,
                          //   child: Container(
                          //     height: 340,
                          //     width: 340,
                          //   ),
                          // )
                          //     : SizedBox.shrink()),
                          // (animation_started
                          //     ? DottedBorder(
                          //   borderType: BorderType.Circle,
                          //   strokeWidth: 3,
                          //   dashPattern: [0, 8.5],
                          //   strokeCap: StrokeCap.round,
                          //   radius: Radius.circular(100),
                          //   padding: EdgeInsets.all(0),
                          //   color: Colors.red,
                          //   child: Container(
                          //     height: 330,
                          //     width: 330,
                          //   ),
                          // )
                          //     : SizedBox.shrink()),
                          // (animation_started
                          //     ? DottedBorder(
                          //   borderType: BorderType.Circle,
                          //   strokeWidth: 3,
                          //   dashPattern: [0, 7.5],
                          //   strokeCap: StrokeCap.round,
                          //   radius: Radius.circular(100),
                          //   padding: EdgeInsets.all(0),
                          //   color: Colors.red,
                          //   child: Container(
                          //     height: 320,
                          //     width: 320,
                          //   ),
                          // )
                          //     : SizedBox.shrink()),
                          // (animation_started
                          //     ? DottedBorder(
                          //   borderType: BorderType.Circle,
                          //   strokeWidth: 3,
                          //   dashPattern: [0, 7.5],
                          //   strokeCap: StrokeCap.round,
                          //   radius: Radius.circular(100),
                          //   padding: EdgeInsets.all(0),
                          //   color: Colors.red,
                          //   child: Container(
                          //     height: 310,
                          //     width: 310,
                          //   ),
                          // )
                          //     : SizedBox.shrink()),
                          // (animation_started
                          //     ? DottedBorder(
                          //   borderType: BorderType.Circle,
                          //   strokeWidth: 3,
                          //   dashPattern: [0, 8],
                          //   strokeCap: StrokeCap.round,
                          //   radius: Radius.circular(100),
                          //   padding: EdgeInsets.all(0),
                          //   color: Colors.red,
                          //   child: Container(
                          //     height: 300,
                          //     width: 300,
                          //   ),
                          // )
                          //     : SizedBox.shrink()),
                          // (animation_started
                          //     ? DottedBorder(
                          //   borderType: BorderType.Circle,
                          //   strokeWidth: 3,
                          //   dashPattern: [0, 8.5],
                          //   strokeCap: StrokeCap.round,
                          //   radius: Radius.circular(100),
                          //   padding: EdgeInsets.all(0),
                          //   color: Colors.red,
                          //   child: Container(
                          //     height: 290,
                          //     width: 290,
                          //   ),
                          // )
                          //     : SizedBox.shrink()),
                          // (animation_started
                          //     ? DottedBorder(
                          //   borderType: BorderType.Circle,
                          //   strokeWidth: 3,
                          //   dashPattern: [0, 9],
                          //   strokeCap: StrokeCap.round,
                          //   radius: Radius.circular(100),
                          //   padding: EdgeInsets.all(0),
                          //   color: Colors.red,
                          //   child: Container(
                          //     height: 280,
                          //     width: 280,
                          //   ),
                          // )
                          //     : SizedBox.shrink()),
                          // (animation_started
                          //     ? DottedBorder(
                          //   borderType: BorderType.Circle,
                          //   strokeWidth: 3,
                          //   dashPattern: [0, 8.5],
                          //   strokeCap: StrokeCap.round,
                          //   radius: Radius.circular(100),
                          //   padding: EdgeInsets.all(0),
                          //   color: Colors.red,
                          //   child: Container(
                          //     height: 270,
                          //     width: 270,
                          //   ),
                          // )
                          //     : SizedBox.shrink()),
                          // (animation_started
                          //     ? DottedBorder(
                          //   borderType: BorderType.Oval,
                          //   strokeWidth: 3,
                          //   dashPattern: [0, 10],
                          //   strokeCap: StrokeCap.round,
                          //   radius: Radius.circular(100),
                          //   padding: EdgeInsets.all(0),
                          //   color: Colors.red,
                          //   child: Container(
                          //     height: 260,
                          //     width: 260,
                          //   ),
                          // )
                          //     : SizedBox.shrink()),
                          // (animation_started
                          //     ? DottedBorder(
                          //   borderType: BorderType.Oval,
                          //   strokeWidth: 3,
                          //   dashPattern: [0, 9.5],
                          //   strokeCap: StrokeCap.round,
                          //   radius: Radius.circular(100),
                          //   padding: EdgeInsets.all(0),
                          //   color: Colors.red,
                          //   child: Container(
                          //     height: 250,
                          //     width: 250,
                          //   ),
                          // )
                          //     : SizedBox.shrink()),
                          // (animation_started
                          //     ? DottedBorder(
                          //   borderType: BorderType.Oval,
                          //   strokeWidth: 3,
                          //   dashPattern: [0, 9],
                          //   strokeCap: StrokeCap.round,
                          //   radius: Radius.circular(100),
                          //   padding: EdgeInsets.all(0),
                          //   color: Colors.red,
                          //   child: Container(
                          //     height: 240,
                          //     width: 240,
                          //   ),
                          // )
                          //     : SizedBox.shrink()),
                          // (animation_started
                          //     ? DottedBorder(
                          //   borderType: BorderType.Oval,
                          //   strokeWidth: 3,
                          //   dashPattern: [0, 8.5],
                          //   strokeCap: StrokeCap.round,
                          //   radius: Radius.circular(100),
                          //   padding: EdgeInsets.all(0),
                          //   color: Colors.red,
                          //   child: Container(
                          //     height: 230,
                          //     width: 230,
                          //   ),
                          // )
                          //     : SizedBox.shrink()),
                          // (animation_started
                          //     ? DottedBorder(
                          //   borderType: BorderType.Oval,
                          //   strokeWidth: 3,
                          //   dashPattern: [0, 7],
                          //   strokeCap: StrokeCap.round,
                          //   radius: Radius.circular(100),
                          //   padding: EdgeInsets.all(0),
                          //   color: Colors.red,
                          //   child: Container(
                          //     height: 220,
                          //     width: 220,
                          //   ),
                          // )
                          //     : SizedBox.shrink()),
                          // (animation_started
                          //     ? DottedBorder(
                          //   borderType: BorderType.Oval,
                          //   strokeWidth: 3,
                          //   dashPattern: [0, 7.5],
                          //   strokeCap: StrokeCap.round,
                          //   radius: Radius.circular(100),
                          //   padding: EdgeInsets.all(0),
                          //   color: Colors.red,
                          //   child: Container(
                          //     height: 210,
                          //     width: 210,
                          //   ),
                          // )
                          //     : SizedBox.shrink()),
                          // (animation_started
                          //     ? DottedBorder(
                          //   borderType: BorderType.Oval,
                          //   strokeWidth: 3,
                          //   dashPattern: [0, 7],
                          //   strokeCap: StrokeCap.round,
                          //   radius: Radius.circular(100),
                          //   padding: EdgeInsets.all(0),
                          //   color: Colors.red,
                          //   child: Container(
                          //     height: 200,
                          //     width: 200,
                          //   ),
                          // )
                          //     : SizedBox.shrink()),
                          // (animation_started
                          //     ? DottedBorder(
                          //   borderType: BorderType.Oval,
                          //   strokeWidth: 3,
                          //   dashPattern: [0, 6.5],
                          //   strokeCap: StrokeCap.round,
                          //   radius: Radius.circular(100),
                          //   padding: EdgeInsets.all(0),
                          //   color: Colors.red,
                          //   child: Container(
                          //     height: 190,
                          //     width: 190,
                          //   ),
                          // )
                          //     : SizedBox.shrink()),
                          // (animation_started
                          //     ? DottedBorder(
                          //   borderType: BorderType.Oval,
                          //   strokeWidth: 3,
                          //   dashPattern: [0, 6],
                          //   strokeCap: StrokeCap.round,
                          //   radius: Radius.circular(100),
                          //   padding: EdgeInsets.all(0),
                          //   color: Colors.red,
                          //   child: Container(
                          //     height: 180,
                          //     width: 180,
                          //   ),
                          // )
                          //     : SizedBox.shrink()),

                          (animation_started
                              ? DottedBorder(
                            borderType: BorderType.Oval,
                            strokeWidth: 3.5,
                            dashPattern: [0, 15],
                            strokeCap: StrokeCap.round,
                            radius: Radius.circular(100),
                            padding: EdgeInsets.all(0),
                            color: Colors.black,
                            child: Container(
                              height: 160,
                              width: 160,
                              padding: EdgeInsets.all(5),
                            ),
                          )
                              : SizedBox.shrink()),
                          (animation_started
                              ? DottedBorder(
                            borderType: BorderType.Oval,
                            strokeWidth: 3.5,
                            dashPattern: [0, 14],
                            strokeCap: StrokeCap.round,
                            radius: Radius.circular(100),
                            padding: EdgeInsets.all(0),
                            color: Colors.black,
                            child: Container(
                              height: 150,
                              width: 150,
                              padding: EdgeInsets.all(5),
                            ),
                          )
                              : SizedBox.shrink()),
                          (animation_started
                              ? DottedBorder(
                            borderType: BorderType.Oval,
                            strokeWidth: 3.5,
                            dashPattern: [0, 11],
                            strokeCap: StrokeCap.round,
                            radius: Radius.circular(100),
                            padding: EdgeInsets.all(0),
                            color: Colors.black,
                            child: Container(
                              height: 140,
                              width: 140,
                              padding: EdgeInsets.all(5),
                            ),
                          )
                              : SizedBox.shrink()),
                          (animation_started
                              ? DottedBorder(
                            borderType: BorderType.Oval,
                            strokeWidth: 3.5,
                            dashPattern: [0, 12],
                            strokeCap: StrokeCap.round,
                            radius: Radius.circular(100),
                            padding: EdgeInsets.all(0),
                            color: Colors.black,
                            child: Container(
                              height: 130,
                              width: 130,
                              padding: EdgeInsets.all(5),
                            ),
                          )
                              : SizedBox.shrink()),
                          (animation_started
                              ? DottedBorder(
                            borderType: BorderType.Oval,
                            strokeWidth: 3.5,
                            dashPattern: [0, 14],
                            strokeCap: StrokeCap.round,
                            radius: Radius.circular(100),
                            padding: EdgeInsets.all(0),
                            color: Colors.black,
                            child: Container(
                              height: 120,
                              width: 120,
                              padding: EdgeInsets.all(5),
                            ),
                          )
                              : SizedBox.shrink()),
                          (animation_started
                              ? DottedBorder(
                            borderType: BorderType.Oval,
                            strokeWidth: 3,
                            dashPattern: [0, 15],
                            strokeCap: StrokeCap.round,
                            radius: Radius.circular(100),
                            padding: EdgeInsets.all(0),
                            color: Colors.black,
                            child: Container(
                              height: 105,
                              width: 105,
                              padding: EdgeInsets.all(5),
                            ),
                          )
                              : SizedBox.shrink()),
                          (animation_started
                              ? DottedBorder(
                            borderType: BorderType.Oval,
                            strokeWidth: 3,
                            dashPattern: [0, 12],
                            strokeCap: StrokeCap.round,
                            radius: Radius.circular(100),
                            padding: EdgeInsets.all(0),
                            color: Colors.black,
                            child: Container(
                              height: 95,
                              width: 95,
                              padding: EdgeInsets.all(5),
                            ),
                          )
                              : SizedBox.shrink()),
                          (animation_started
                              ? DottedBorder(
                            borderType: BorderType.Oval,
                            strokeWidth: 3,
                            dashPattern: [0, 10],
                            strokeCap: StrokeCap.round,
                            radius: Radius.circular(100),
                            padding: EdgeInsets.all(0),
                            color: Colors.black,
                            child: Container(
                              height: 80,
                              width: 80,
                              padding: EdgeInsets.all(5),
                            ),
                          )
                              : SizedBox.shrink()),

                          Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Container(
                              height: (animation_started
                                  ? _animation_button!.value
                                  : button_height),
                              width: (animation_started
                                  ? _animation_button!.value
                                  : button_height),
                              // decoration: BoxDecoration(
                              //     shape: BoxShape.circle,
                              //     image: const DecorationImage(
                              //         alignment: Alignment.center,
                              //         image: const AssetImage(
                              //             AssetUtils.home_button)),
                              //     // boxShadow: [
                              //     //   BoxShadow(
                              //     //     color: (animation_started
                              //     //         ? HexColor('#F5C921')
                              //     //         : Colors.transparent),
                              //     //     blurRadius: (animation_started
                              //     //         ? _animation!.value
                              //     //         : 0),
                              //     //     spreadRadius: (animation_started
                              //     //         ? _animation!.value
                              //     //         : 0),
                              //     //   )
                              //     // ]
                              // ),
                              decoration: (animation_started
                                  ? BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Color(0xFFFCF483),
                                    width: 2.5),
                                boxShadow: [
                                  BoxShadow(
                                    color: HexColor(
                                        '#F5C921'), // darker color
                                  ),
                                  BoxShadow(
                                    color: HexColor('#000000'),
                                    // background color
                                    spreadRadius: -7.0,
                                    blurRadius: 10.0,
                                  ),
                                ],
                                // boxShadow: [
                                //   BoxShadow(
                                //       color:
                                //       ColorUtils.primary_gold.withOpacity(0.5),
                                //       spreadRadius: (animation_started
                                //           ? (shadow_animation1_completed
                                //           ? _animation_shadow2!.value
                                //           : _animation_shadow1!.value)
                                //           : 0),
                                //       blurRadius: 0)
                                // ],
                              )
                                  : const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    alignment: Alignment.center,
                                    image: AssetImage(
                                        AssetUtils.home_button)),
                                // boxShadow: [
                                //   BoxShadow(
                                //     color: (animation_started
                                //         ? HexColor('#F5C921')
                                //         : Colors.transparent),
                                //     blurRadius: (animation_started
                                //         ? _animation!.value
                                //         : 0),
                                //     spreadRadius: (animation_started
                                //         ? _animation!.value
                                //         : 0),
                                //   )
                                // ]
                              )),
                              child: Stack(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    child: Text('Pee',
                                        style: GoogleFonts.sourceSerifPro(
                                          textStyle: TextStyle(
                                              color: (timer_started
                                                  ? HexColor('#F5C921')
                                                  .withOpacity(0.4)
                                                  : HexColor('#F5C921')),
                                              fontSize: (animation_started
                                                  ? _animation_textK!.value
                                                  : text_k_size),
                                              fontWeight: FontWeight.w600),
                                        )),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      (timer_started ? elapsedTime : ''),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: (animation_started
                                              ? _animation_textTime!.value
                                              : text_time_size),
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      // ),
                    ),
                    glowColor: Colors.white,
                  ),


                  GestureDetector(
                    onTap: () async {
                      if (started) {
                        start_animation();
                        startWatch();
                        setState(() {
                          back_wallpaper = false;
                        });

                      } else {
                        await stopWatch_finish();
                        // method_time.add(ListMethodClass(
                        //     method_name: method_selected,
                        //     total_time: elapsedTime));
                        setState(() {
                          back_wallpaper = true;
                          elapsedTime = '00:00';
                          percent = 0.0;
                          method_selected = '';
                          watch.reset();
                          // paused_time.clear();
                        });
                        // print('method_time : ${method_time[0].total_time}');
                        // print('method_name : ${method_time[0].method_name}');
                      }
                    },
                    child: Container(
                      height: 35,
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      // height: 45,
                      // width:(width ?? 300) ,
                      decoration: BoxDecoration(
                          color: ColorUtils.primary_gold,
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            // stops: [0.1, 0.5, 0.7, 0.9],
                            colors: [
                              HexColor("#ECDD8F").withOpacity(0.90),
                              HexColor("#E5CC79").withOpacity(0.90),
                              HexColor("#CE952F").withOpacity(0.90),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(
                            vertical: 0,
                          ),
                          child: Text(
                            (started ? 'Start' : 'Finish'),
                            style: FontStyleUtility.h12(
                                fontColor: Colors.black, family: 'PM'),
                          )),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ],

    );
  }
  bool timer_started = false;


  startWatch() {
    setState(() {
      startStop = false;
      started = false;
      watch.start();
      timer = Timer.periodic(Duration(milliseconds: 100), updateTime);
    });
  }

  stopWatch_finish() {
    setState(() {
      startStop = true;
      started = true;
      animation_started = false;
      watch.stop();
      setTime_finish();
    });
  }

  List paused_time = [];

  setTime_finish() {
    var timeSoFar = watch.elapsedMilliseconds;
    setState(() {
      elapsedTime = transformMilliSeconds(timeSoFar);
    });
    // paused_time.add(elapsedTime);
    print("elapsedTime $elapsedTime");
    print("elapsedTime Listtttttt $paused_time");
  }

  transformMilliSeconds(int milliseconds) {
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();
    int hours = (minutes / 60).truncate();

    String hoursStr = (hours % 60).toString().padLeft(2, '0');
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    return "$minutesStr:$secondsStr";
  }
}
