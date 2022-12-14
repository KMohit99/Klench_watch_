import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/material.dart';

// import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../utils/AssetUtils.dart';
import '../utils/TextStyle_utils.dart';
import '../utils/colorUtils.dart';
import '../utils/common_widgets.dart';

class BreathingScreen extends StatefulWidget {
  const BreathingScreen({Key? key}) : super(key: key);

  @override
  State<BreathingScreen> createState() => _BreathingScreenState();
}

class _BreathingScreenState extends State<BreathingScreen>
    with TickerProviderStateMixin {
  Stopwatch watch = Stopwatch();
  Stopwatch watch2 = Stopwatch();
  Timer? timer;
  Timer? timer2;
  bool startStop = true;
  bool started = true;

  String elapsedTime = '00';
  String elapsedTime2 = '00';

  updateTime(Timer timer) {
    if (watch.isRunning) {
      if (mounted) {
        setState(() {
          // print("startstop Inside=$startStop");
          elapsedTime = transformMilliSeconds(watch.elapsedMilliseconds);
          print("elapsedTime $elapsedTime");
          // vibration();
          if (elapsedTime == '12') {
            stopWatch();
            // _animationController_shadow1!.reverse();
            setState(() {
              elapsedTime = '00';
              percent = 0.0;
              watch.reset();
              CommonWidget().showToaster(msg: '${9 - counter} Times left');
              counter++;
              print(counter);
              // paused_time.clear();
            });
            Future.delayed(Duration(seconds: 2), () {
              if (counter == 10) {
                stopWatch();
                setState(() {
                  elapsedTime = '00';
                  percent = 0.0;
                  // watch.stop();
                  counter = 0;
                });
                sets++;
                print('Sets-------$sets');
                if (sets == 3) {
                  stopWatch();
                  setState(() {
                    elapsedTime = '00';
                    percent = 0.0;
                    // watch.stop();
                    counter = 0;
                  });
                  CommonWidget().showToaster(msg: "Method Complete");
                }
              } else {
                startWatch();
                startWatch2();
              }
            });
            // start_animation();
          }

          // percent += 1;
          // if (percent >= 100) {
          //   percent = 0.0;
          // }

          // final seconds = myDuration.inSeconds - reduceSecondsBy;
          // if (seconds < 0) {
          //   countdownTimer!.cancel();
          //   print('timesup');
          // } else {
          //   myDuration = Duration(seconds: seconds);
          // }
        });
      }
    }
  }
  updateTime2(Timer timer) {
    if (watch2.isRunning) {
      if (mounted) {
        setState(() {
          // print("startstop Inside=$startStop");
          elapsedTime2 = transformMilliSeconds2(watch2.elapsedMilliseconds);
          // print("elapsedTime $elapsedTime");
          // vibration();
          if (elapsedTime2 == '04') {
            stopWatch2();
            // _animationController_shadow1!.reverse();
            setState(() {
              elapsedTime2 = '00';
              watch2.reset();
              // paused_time.clear();
            });
            startWatch2();
            // start_animation();
          }

          // percent += 1;
          // if (percent >= 100) {
          //   percent = 0.0;
          // }

          // final seconds = myDuration.inSeconds - reduceSecondsBy;
          // if (seconds < 0) {
          //   countdownTimer!.cancel();
          //   print('timesup');
          // } else {
          //   myDuration = Duration(seconds: seconds);
          // }
        });
      }
    }
  }

  double percent = 0.0;
  bool back_wallpaper = false;

  Timer? countdownTimer;
  Duration myDuration = Duration(seconds: 11);

  void startTimer() {
    countdownTimer = Timer.periodic(Duration(microseconds: 100), setCountDown);
  }

  setCountDown(Timer timer) {
    const reduceSecondsBy = 1;
    if (mounted) {
      setState(() {
        final seconds = myDuration.inSeconds - reduceSecondsBy;
        if (seconds < 0) {
          countdownTimer!.cancel();
          print('timesup');
        } else {
          myDuration = Duration(seconds: seconds);
        }
      });
    }
  }

  AnimationController? _animationController;
  Animation? _animation;
  AnimationController? _animationController_1;
  Animation? _animation_1;

  AnimationController? _animationController_shadow1;
  Animation? _animation_shadow1;
  Animation? _animation_shadow1_reverse;
  AnimationController? _animationController_shadow2;
  Animation? _animation_shadow2;

  bool animation_started = false;
  String _status = 'Hold';
  bool shadow_animation1_completed = false;
  bool shadow_animation_pause = false;
  int counter = 0;
  int sets = 0;
  bool _canVibrate = true;
  final Iterable<Duration> pauses = [
    const Duration(milliseconds: 1),
    const Duration(milliseconds: 1000),
    const Duration(milliseconds: 1),
    const Duration(milliseconds: 1000),
    const Duration(milliseconds: 1),
    const Duration(milliseconds: 1000),
  ];

  // Future<void> _init() async {
  //   bool? canVibrate = await Vibration.hasVibrator();
  //   setState(() {
  //     _canVibrate = canVibrate!;
  //     _canVibrate
  //         ? debugPrint('This device can vibrate')
  //         : debugPrint('This device cannot vibrate');
  //   });
  // }
  //
  // vibration() async {
  //   if (_canVibrate) {
  //     // Vibration.vibrate(
  //     //     // pattern: [100, 100,100, 100,100, 100,100, 100,],
  //     //     duration: 4000,
  //     //     intensities: [1, 255]);
  //     // print(
  //     //     "Vibration.hasCustomVibrationsSupport() ${Vibration.hasCustomVibrationsSupport()}");
  //
  //     if (await Vibration.hasCustomVibrationsSupport() == true) {
  //       // print("has support");
  //       Vibration.vibrate(
  //         // pattern: [100, 100,100, 100,100, 100,100, 100,],
  //           duration: 5000,
  //           intensities: [1, 255]);
  //     } else {
  //       print("haddddd support");
  //       Vibration.vibrate();
  //       await Future.delayed(Duration(milliseconds: 500));
  //       Vibration.vibrate();
  //     }
  //     // Vibrate.defaultVibrationDuration;
  //     // Vibrate.defaultVibrationDuration;
  //     // Vibrate.vibrateWithPauses(pauses);
  //   } else {
  //     CommonWidget().showErrorToaster(msg: 'Device Cannot vibrate');
  //   }
  // }
  // vibration_hold() async {
  //   if (_canVibrate) {
  //     // Vibration.vibrate(
  //     //     // pattern: [100, 100,100, 100,100, 100,100, 100,],
  //     //     duration: 4000,
  //     //     intensities: [1, 255]);
  //     // print(
  //     //     "Vibration.hasCustomVibrationsSupport() ${Vibration.hasCustomVibrationsSupport()}");
  //
  //     if (await Vibration.hasCustomVibrationsSupport() == true) {
  //       // print("has support");
  //       Vibration.vibrate(pattern: [
  //         900,
  //         100,
  //         900,
  //         100,
  //         900,
  //         100,
  //         900,
  //         100,
  //         // 400,
  //         // 100,
  //         // 400,
  //         // 100,
  //         // 400,
  //         // 100,
  //         // 400,
  //         // 100,
  //         // 400,
  //         // 100,
  //       ], intensities: [
  //         5,
  //         255
  //       ]);
  //
  //     } else {
  //       print("haddddd support");
  //       Vibration.vibrate();
  //       await Future.delayed(Duration(milliseconds: 500));
  //       Vibration.vibrate();
  //     }
  //     // Vibrate.defaultVibrationDuration;
  //     // Vibrate.defaultVibrationDuration;
  //     // Vibrate.vibrateWithPauses(pauses);
  //   } else {
  //     CommonWidget().showErrorToaster(msg: 'Device Cannot vibrate');
  //   }
  // }

  start_animation() {
    setState(() {
      animation_started = true;
      print(animation_started);
    });
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    _animationController!.forward();
    // vibration();
    setState(() {
      _status = 'Inhale';
      print(_status);
    });
    _animation = Tween(begin: 80.0, end: 100.0).animate(_animationController!)
      ..addStatusListener((status) {
        // Vibrate.vibrateWithPauses(pauses);

        print(status);
        if (status == AnimationStatus.completed) {
          // vibration_hold();
          setState(() {
            _status = 'Hold';
            shadow_animation_pause = true;
            _animationController_shadow2!.stop();
            Future.delayed(Duration(seconds: 4), () {
              _animationController_shadow2!.repeat(reverse: true);
              // vibration();
              setState(() {

                // print(_status);
                shadow_animation_pause = false;
              });

            });
            // print("$_status _status");
            // print("shadow_animation_pause $shadow_animation_pause");
          });
          Future.delayed(Duration(seconds: 4), () {
            _animationController!.reverse();
            // vibration();

            setState(() {
              _status = 'Exhale';
              // print(_status);
            });
          });
        } else if (status == AnimationStatus.dismissed) {
          // vibration_hold();
          setState(() {
            _status = 'Hold';
            // print(_status);
          });
          Future.delayed(Duration(seconds: 4), () {
            _animationController!.forward();
            // vibration();
            setState(() {
              _status = 'Inhale';
              // print(_status);
            });
          });
        }
      });

    _animationController_shadow1 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _animationController_shadow1!.forward();
    _animation_shadow1 =
    Tween(begin: 0.0, end: 20.0).animate(_animationController_shadow1!)
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
    Tween(begin: 20.0, end: 22.0).animate(_animationController_shadow2!)
      ..addStatusListener((status) {
        if (shadow_animation_pause == true) {}
        // print(status);
        // if (status == AnimationStatus.completed) {}
        // shadow_animation1_completed = true;
      });

    print(_animationController!.status);
  }

  @override
  dispose() {
    _animationController!.dispose();
    _animationController_shadow1!.dispose();
    _animationController_shadow2!.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final seconds = myDuration.inSeconds.remainder(60);
    return Stack(
      children: [
        Container(
          color: Colors.black,
          height: MediaQuery.of(context).size.height,
        ),
        Container(
          // decoration: BoxDecoration(
          //
          //   image: DecorationImage(
          //     image: AssetImage(AssetUtils.backgroundImage), // <-- BACKGROUND IMAGE
          //     fit: BoxFit.cover,
          //   ),
          // ),
          decoration: BoxDecoration(
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
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.dst),
              image: AssetImage(
                AssetUtils.b_screen_back,
              ),
            ),
          ),
        ),
        Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 10, left: 8, right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Container(
                  //     margin: EdgeInsets.symmetric(horizontal: 10),
                  //     alignment: Alignment.center,
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.end,
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       children: [
                  //         Image.asset(
                  //           AssetUtils.star_icon,
                  //           color:
                  //           (sets >= 1 ? ColorUtils.primary_gold : Colors.grey),
                  //           height: 22,
                  //           width: 22,
                  //         ),
                  //         SizedBox(
                  //           width: 7,
                  //         ),
                  //         Image.asset(
                  //           AssetUtils.star_icon,
                  //           height: 22,
                  //           color:
                  //           (sets >= 2 ? ColorUtils.primary_gold : Colors.grey),
                  //           width: 22,
                  //         ),
                  //         SizedBox(
                  //           width: 7,
                  //         ),
                  //         Image.asset(
                  //           AssetUtils.star_icon,
                  //           color:
                  //           (sets >= 3 ? ColorUtils.primary_gold : Colors.grey),
                  //           height: 22,
                  //           width: 22,
                  //         ),
                  //       ],
                  //     )),

                  // CircularPercentIndicator(
                  //   circularStrokeCap: CircularStrokeCap.round,
                  //   percent: percent / 100,
                  //   animation: true,
                  //   animateFromLastPercent: true,
                  //   radius: 67,
                  //   lineWidth: 0,
                  //   progressColor: Colors.white,
                  //   backgroundColor: Colors.transparent,
                  //   center: Container(
                  //     decoration: BoxDecoration(
                  //         border: Border.all(color: ColorUtils.primary_gold, width: 10),
                  //         borderRadius: BorderRadius.circular(100)),
                  //     child: Container(
                  //       height: 130,
                  //       width: 130,
                  //       decoration: BoxDecoration(
                  //           color: ColorUtils.primary_gold,
                  //           border: Border.all(color: Colors.black, width: 10),
                  //           borderRadius: BorderRadius.circular(100)),
                  //       child: Column(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         crossAxisAlignment: CrossAxisAlignment.center,
                  //         children: [
                  //           IconButton(
                  //             alignment: Alignment.center,
                  //             // visualDensity:
                  //             //     VisualDensity(vertical: -4, horizontal: -4),
                  //             padding: EdgeInsets.only(left: 0.0),
                  //             icon: Image.asset(AssetUtils.breathe_icon,
                  //                 color:
                  //                 Colors.black,
                  //                 height: 40,
                  //                 width: 40),
                  //             onPressed: () {
                  //
                  //             },
                  //           ),
                  //           Container(
                  //             alignment: Alignment.center,
                  //             child: CircleAvatar(
                  //               maxRadius: 20,
                  //               backgroundColor: Colors.black,
                  //               child: Text(
                  //                 elapsedTime,
                  //                 style: TextStyle(
                  //                     color: Colors.white,
                  //                     fontSize: 20,
                  //                     fontFamily: 'PR',
                  //                     fontWeight: FontWeight.w900),
                  //               ),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  //
                  // ),

                  AvatarGlow(
                    endRadius: 65.0,
                    showTwoGlows: true,
                    animate: false,
                    // (startStop ? false : true),
                    duration: Duration(milliseconds: 900),
                    repeat: true,
                    child: Container(
                      height: (animation_started ? _animation!.value : 80),
                      width: (animation_started ? _animation!.value : 80),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: ColorUtils.primary_gold, width: 5),
                          boxShadow: [
                            BoxShadow(
                                color:
                                ColorUtils.primary_gold.withOpacity(0.5),
                                spreadRadius: (animation_started
                                    ? (shadow_animation1_completed
                                    ? _animation_shadow2!.value
                                    : _animation_shadow1!.value)
                                    : 0),
                                blurRadius: 0)
                          ],
                          borderRadius: BorderRadius.circular(200)),
                      child: Container(
                        decoration: BoxDecoration(
                            color: ColorUtils.primary_gold,
                            border:
                            Border.all(color: Colors.black, width: 5),
                            borderRadius: BorderRadius.circular(100)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // IconButton(
                            //   alignment: Alignment.center,
                            //   // visualDensity:
                            //   //     VisualDensity(vertical: -4, horizontal: -4),
                            //   padding: EdgeInsets.only(left: 0.0),
                            //   icon: Image.asset(AssetUtils.breathe_icon,
                            //       color: Colors.black, height: 40, width: 40),
                            //   onPressed: () {},
                            // ),
                            Text(
                              _status,
                              style: FontStyleUtility.h13(
                                  fontColor: Colors.black, family: 'PM'),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                elapsedTime2,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: 'PR',
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Text(('$counter/10'),
                  //     style: FontStyleUtility.h15(
                  //         fontColor: Colors.black, family: 'PM')),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.58),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          // stops: [0.1, 0.5, 0.7, 0.9],
                          colors: [
                            HexColor("#020204").withOpacity(0.8),
                            // HexColor("#151619").withOpacity(0.63),
                            HexColor("#36393E").withOpacity(0.8),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 5),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (startStop) {
                                (sets <= 3
                                    ? startWatch()
                                    : CommonWidget().showErrorToaster(
                                    msg:
                                    "You have completed your today's sets, comback tommorow"));
                              } else {
                                stopWatch();
                                setState(() {
                                  elapsedTime = '00';
                                  percent = 0.0;
                                  watch.reset();
                                  counter == 0;
                                  // paused_time.clear();
                                });
                              }
                              // startOrStop();
                            },
                            child: Container(
                              height: 35,
                              // height: 45,
                              // width:(width ?? 300) ,
                              margin: EdgeInsets.symmetric(horizontal: 20),

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
                                  boxShadow: [
                                    BoxShadow(
                                      color: HexColor('#04060F'),
                                      offset: Offset(10, 10),
                                      blurRadius: 20,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(15)),
                              child: Container(
                                  alignment: Alignment.center,

                                  child: Text(
                                    (startStop ? 'Start' : 'Finish'),
                                    style: FontStyleUtility.h12(
                                        fontColor: Colors.black, family: 'PM'),
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // Get.to(SignUpScreen());
                                },
                                child: Container(
                                  height: 35,
                                  margin: EdgeInsets.symmetric(horizontal: 5),

                                  decoration: BoxDecoration(
                                    // color: Colors.black.withOpacity(0.65),
                                      gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        // stops: [0.1, 0.5, 0.7, 0.9],
                                        colors: [
                                          HexColor("#020204").withOpacity(1),
                                          HexColor("#36393E").withOpacity(1),
                                        ],
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: HexColor('#04060F'),
                                          offset: Offset(10, 10),
                                          blurRadius: 20,
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.symmetric(vertical: 0),
                                      child: Text(
                                        'Breathing information',
                                        overflow: TextOverflow.clip,
                                        style: FontStyleUtility.h12(
                                            fontColor: HexColor('#AAAAAA'),
                                            family: 'PM'),
                                      )),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  // color: Colors.black.withOpacity(0.65),
                                  //   gradient: LinearGradient(
                                  //     begin: Alignment.centerLeft,
                                  //     end: Alignment.centerRight,
                                  //     // stops: [0.1, 0.5, 0.7, 0.9],
                                  //     colors: [
                                  //       HexColor("#020204").withOpacity(1),
                                  //       HexColor("#36393E").withOpacity(1),
                                  //     ],
                                  //   ),
                                  //   boxShadow: [
                                  //     BoxShadow(
                                  //       color: HexColor('#04060F'),
                                  //       offset: Offset(10,10),
                                  //       blurRadius: 20,
                                  //     ),
                                  //   ],
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 17, vertical: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          '1. Inhale 4',
                                          style: FontStyleUtility.h12(
                                              fontColor: HexColor('#DCDCDC'),
                                              family: 'PM'),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        child: Text(
                                          '2. Hold 4 sec',
                                          style: FontStyleUtility.h12(
                                              fontColor: HexColor('#DCDCDC'),
                                              family: 'PM'),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        child: Text(
                                          '3. Exhale 4 sec',
                                          style: FontStyleUtility.h12(
                                              fontColor: HexColor('#DCDCDC'),
                                              family: 'PM'),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        child: Text(
                                          '4. Repeat process 10 times is consider 1 set',
                                          style: FontStyleUtility.h12(
                                              fontColor: HexColor('#DCDCDC'),
                                              family: 'PM'),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 90,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  startOrStop() {
    if (startStop) {
      startWatch();
    } else {
      stopWatch();
    }
  }

  startWatch() {
    startWatch2();
    // countdownTimer =
    //     Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
    // vibration();
    start_animation();
    setState(() {
      startStop = false;
      watch.start();
      // startTimer();
      timer = Timer.periodic(Duration(microseconds: 100), updateTime);
    });
  }
  startWatch2() {
    // countdownTimer =
    //     Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
    setState(() {
      watch2.start();
      // startTimer();
      timer2 = Timer.periodic(Duration(microseconds: 100), updateTime2);
    });
  }

  stopWatch() {
    stopWatch2();
    setState(() {
      startStop = true;
      // Vibration.cancel();
      animation_started = false;
      _animationController!.stop();
      _animationController_shadow1!.stop();
      watch.stop();
      percent = 0.0;
      setTime();
      print("___________$counter");
    });
  }
  stopWatch2() {
    setState(() {
      watch2.stop();
      setTime2();
    });
  }

  setTime() {
    var timeSoFar = watch.elapsedMilliseconds;
    setState(() {
      elapsedTime = transformMilliSeconds(timeSoFar);
    });
    print("elapsedTime $elapsedTime");
  }
  setTime2() {
    var timeSoFar = watch.elapsedMilliseconds;
    setState(() {
      elapsedTime2 = transformMilliSeconds2(timeSoFar);
    });
    print("elapsedTime $elapsedTime2");
  }


  transformMilliSeconds(int milliseconds) {
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();
    int hours = (minutes / 60).truncate();

    String hoursStr = (hours % 60).toString().padLeft(2, '0');
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    return secondsStr;
  }
  transformMilliSeconds2(int milliseconds) {
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();
    int hours = (minutes / 60).truncate();

    String hoursStr = (hours % 60).toString().padLeft(2, '0');
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    return secondsStr;
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
