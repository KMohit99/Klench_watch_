import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../methods/kegel-screen.dart';
import '../methods/m_screen.dart';
import '../methods/pee-screen_method.dart';
import '../methods/warmup-screen.dart';
import '../utils.dart';
import '../utils/AssetUtils.dart';
import '../wear.dart';
import 'name_screen.dart';

class StartScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
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
                  Colors.black.withOpacity(0.5), BlendMode.lighten),
              image: AssetImage(
                AssetUtils.home_back,
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
          height: MediaQuery
              .of(context)
              .size
              .height,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: WatchShape(
            builder: (context, shape) {
              var screenSize = MediaQuery
                  .of(context)
                  .size;
              final shape = InheritedShape
                  .of(context)
                  ?.shape;
              if (shape == Shape.round) {
                // boxInsetLength requires radius, so divide by 2
                screenSize = Size(boxInsetLength(screenSize.width / 2),
                    boxInsetLength(screenSize.height / 2));
              }
              var screenHeight = screenSize.height;
              var screenWidth = screenSize.width;

              return Center(
                child: Container(
                  color: Colors.transparent,
                  height: screenSize.height,
                  width: screenSize.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => KegelScreen()));
                            },
                            child: Container(
                              height: screenSize.height / 2.1,
                              width: screenSize.width / 2.1,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  alignment: Alignment.center,
                                  image: AssetImage(
                                    AssetUtils.home_button,
                                  ),
                                ),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                child: Text('K',
                                    style: GoogleFonts.sourceSerifPro(
                                      textStyle: TextStyle(
                                          color: HexColor('#EE499E'),
                                          shadows: [
                                            Shadow(
                                                color: HexColor('#EE499E'),
                                                offset: Offset(0, 10),
                                                blurRadius: 50)
                                          ],
                                          fontSize: 35,
                                          fontWeight: FontWeight.w600),
                                    )),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          m_screen_method()));
                            },
                            child: Container(
                              height: screenSize.height / 2.1,
                              width: screenSize.width / 2.1,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    alignment: Alignment.center,
                                    image: AssetImage(
                                        AssetUtils.home_button)),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                child: Text('M',
                                    style: GoogleFonts.sourceSerifPro(
                                      textStyle: TextStyle(
                                          color: HexColor('#ED4A42'),
                                          shadows: [
                                            Shadow(
                                                color: HexColor('#ED4A42'),
                                                offset: Offset(0, 10),
                                                blurRadius: 50)
                                          ],
                                          fontSize: 35,
                                          fontWeight: FontWeight.w600),
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Warmup_screen()));
                            },
                            child: Container(
                              height: screenSize.height / 2.1,
                              width: screenSize.width / 2.1,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    alignment: Alignment.center,
                                    image: AssetImage(
                                        AssetUtils.home_button)),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                child: Text('W',
                                    style: GoogleFonts.sourceSerifPro(
                                      textStyle: TextStyle(
                                          color: HexColor('#3EA244'),
                                          shadows: [
                                            Shadow(
                                                color: HexColor('#3EA244'),
                                                offset: Offset(0, 10),
                                                blurRadius: 50)
                                          ],
                                          fontSize: 35,
                                          fontWeight: FontWeight.w600),
                                    )),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PeeScreenMethod()));
                            },
                            child: Container(
                              height: screenSize.height / 2.1,
                              width: screenSize.width / 2.1,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    alignment: Alignment.center,
                                    image: AssetImage(
                                        AssetUtils.home_button)),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                child: Text('P',
                                    style: GoogleFonts.sourceSerifPro(
                                      textStyle: TextStyle(
                                          color: HexColor('#F8D44D'),
                                          shadows: [
                                            Shadow(
                                                color: HexColor('#F8D44D'),
                                                offset: Offset(0, 10),
                                                blurRadius: 50)
                                          ],
                                          fontSize: 35,
                                          fontWeight: FontWeight.w600),
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
