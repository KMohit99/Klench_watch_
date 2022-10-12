import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../utils.dart';
import '../utils/AssetUtils.dart';
import '../utils/TextStyle_utils.dart';
import '../utils/colorUtils.dart';
import '../wear.dart';

class m_screen_method extends StatefulWidget {
  const m_screen_method({Key? key}) : super(key: key);

  @override
  State<m_screen_method> createState() => _m_screen_methodState();
}

class _m_screen_methodState extends State<m_screen_method>
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
  List method_list = ['Hand', 'Flashlight'];
  String method_selected = '';

  // List<ListMethodClass> method_time = [];

  updateTime(Timer timer) {
    if (watch.isRunning) {
      if (mounted) {
        setState(() {
          print("startstop Inside=$startStop");
          elapsedTime = transformMilliSeconds(watch.elapsedMilliseconds);
          percent += 1;
          if (percent >= 100) {
            percent = 0.0;
          }
        });
      }
    }
  }

  start_animation() {
    setState(() {
      animation_started = true;
      print(animation_started);
    });
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animationController!.repeat(reverse: true);
    _animation = Tween(begin: 0.0, end: 5.0).animate(_animationController!)
      ..addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: FractionalOffset.center,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.5), BlendMode.dst),
                image: AssetImage(
                  AssetUtils.m_screen_back,
                ),
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Colors.black,
                Colors.black.withOpacity(0.1),
                Colors.black.withOpacity(0.1),
                Colors.black,
              ])),
          height: MediaQuery.of(context).size.height,
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
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    print('object');

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        double width = MediaQuery.of(context).size.width;
                        double height = MediaQuery.of(context).size.height;
                        return AlertDialog(
                            backgroundColor: Colors.transparent,
                            contentPadding: EdgeInsets.zero,
                            elevation: 0.0,
                            // title: Center(child: Text("Evaluation our APP")),
                            content: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 100,
                                        width: double.maxFinite,
                                        decoration: BoxDecoration(
                                            // color: Colors.black.withOpacity(0.65),
                                            gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              // stops: [0.1, 0.5, 0.7, 0.9],
                                              colors: [
                                                HexColor("#020204")
                                                    .withOpacity(1),
                                                HexColor("#36393E")
                                                    .withOpacity(1),
                                              ],
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: HexColor('#04060F'),
                                                  offset: Offset(10, 10),
                                                  blurRadius: 10)
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 0),
                                        // height: 122,
                                        // width: 133,
                                        // padding: const EdgeInsets.all(8.0),
                                        alignment: Alignment.center,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: ListView.builder(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 5),
                                            itemCount: method_list.length,
                                            shrinkWrap: true,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    method_selected =
                                                        method_list[index];
                                                    print(
                                                        "method_selected $method_selected");
                                                    started = true;
                                                  });
                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 8.5),
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    method_list[index],
                                                    style: FontStyleUtility.h15(
                                                        fontColor: ColorUtils
                                                            .primary_grey,
                                                        family: 'PM'),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(right: 15),
                                        alignment: Alignment.topRight,
                                        child: Container(
                                            decoration: BoxDecoration(
                                                // color: Colors.black.withOpacity(0.65),
                                                gradient: LinearGradient(
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                  // stops: [0.1, 0.5, 0.7, 0.9],
                                                  colors: [
                                                    HexColor("#36393E")
                                                        .withOpacity(1),
                                                    HexColor("#020204")
                                                        .withOpacity(1),
                                                  ],
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color:
                                                          HexColor('#04060F'),
                                                      offset: Offset(0, 3),
                                                      blurRadius: 5)
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Icon(
                                                Icons.cancel_outlined,
                                                size: 13,
                                                color: ColorUtils.primary_grey,
                                              ),
                                            )),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ));
                      },
                    );
                  },
                  child: Container(
                    height: 35,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    // height: 45,
                    // width:(width ?? 300) ,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          // stops: [0.1, 0.5, 0.7, 0.9],
                          colors: [
                            HexColor("#020204").withOpacity(1),
                            HexColor("#151619").withOpacity(1),
                            HexColor("#36393E").withOpacity(1),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(
                          vertical: 0,
                        ),
                        child: Text(
                          (method_selected.isNotEmpty
                              ? method_selected
                              : "Select Method"),
                          style: FontStyleUtility.h12(
                              fontColor: ColorUtils.primary_metal,
                              family: 'PM'),
                        )),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: screenWidth / 2.5,
                  height: screenHeight / 2.5,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          alignment: Alignment.center,
                          image: AssetImage(AssetUtils.home_button)),
                      boxShadow: [
                        BoxShadow(
                          color: (animation_started
                              ? HexColor('#DD3931')
                              : Colors.transparent),
                          blurRadius:
                              (animation_started ? _animation!.value : 0),
                          spreadRadius:
                              (animation_started ? _animation!.value : 0),
                        )
                      ]),
                  child: Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'M',
                          style: TextStyle(
                              color: HexColor('#DD3931').withOpacity(0.2),
                              fontSize: 60,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          elapsedTime,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    if (method_selected.isNotEmpty) {
                      if (started) {
                        start_animation();
                        startWatch();
                      } else {
                        await stopWatch_finish();
                        // method_time.add(ListMethodClass(
                        //     method_name: method_selected,
                        //     total_time: elapsedTime));
                        setState(() {
                          elapsedTime = '00:00';
                          percent = 0.0;
                          method_selected = '';
                          watch.reset();
                          // paused_time.clear();
                        });
                        // print('method_time : ${method_time[0].total_time}');
                        // print('method_name : ${method_time[0].method_name}');
                      }
                    }else{
                      await Fluttertoast.showToast(
                        fontSize: 10,
                        msg: "Please select method first",
                        textColor: Colors.white,
                        backgroundColor: Colors.red,
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                      );
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

                        child: Text(
                          (started ? 'Start' : 'Finish'),
                          style: FontStyleUtility.h12(
                              fontColor: Colors.black, family: 'PM'),
                        )),
                  ),
                ),
              ],
            );
          }),
        )
      ],
    );
  }

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
