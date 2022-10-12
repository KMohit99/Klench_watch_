import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

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
                  AssetUtils.p_screen_back,
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
                              ? HexColor('#F8D44D')
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
                          'P',
                          style: TextStyle(
                              color: HexColor('#F8D44D').withOpacity(0.2),
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
