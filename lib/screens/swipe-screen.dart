import 'package:flutter/material.dart';
import 'package:klench_watch/screens/start_screen.dart';

import '../methods/breathing_screen.dart';

class SwipeScreen extends StatefulWidget {
  const SwipeScreen({Key? key}) : super(key: key);

  @override
  State<SwipeScreen> createState() => _SwipeScreenState();
}

class _SwipeScreenState extends State<SwipeScreen> {
  PageController? _pageController_customer;
  final ValueNotifier<int> buildCount = ValueNotifier<int>(0);

  List<Widget> widget_list =
  [
    StartScreen(),
    BreathingScreen(),

  ];
  @override
  void initState() {
    _pageController_customer = PageController(initialPage: 0, keepPage: false);
  }
  @override
  void dispose() {
    _pageController_customer!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView.builder(
        onPageChanged: (page) {
          print('PageChanged $page');
          // _pageController_customer!.dispose();
        },
        itemBuilder: (context , int index){
          return Center(
            child: widget_list[index % widget_list.length],
          );
        },
        controller: _pageController_customer,
        physics: const AlwaysScrollableScrollPhysics(),
        // children: [
        //   KegelScreen(),
        //   WarmUpScreen(),
        //   M_ScreenMetal(),
        //   PeeScreen()
        // ],
      ),
    );
  }
}
