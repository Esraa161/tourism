import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../core/IconBroken.dart';
import '../../core/constants.dart';
import '../../view_model/control_home_view_model.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;

    return GetBuilder<ControlHomeViewModel>(
        init: ControlHomeViewModel(),
        builder: (controller) => Scaffold(
              backgroundColor: Colors.white,
              extendBody: false,
              appBar: AppBar(
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Icon(IconBroken.Notification,color: KSecondryColor,size: 27,)
                    ),
                  )
                ],
                backgroundColor: Colors.white,
                elevation: 0,
                centerTitle: true,
                scrolledUnderElevation: 0,
                automaticallyImplyLeading: false,
                title: Text(
                  controller.listOfTitles[controller.currentIndex],
                  style: const TextStyle(
                      color: KPrimaryColor, fontWeight: FontWeight.w600),
                ),
              ),
              body: controller.bottomScreens[controller.currentIndex],
              bottomNavigationBar: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5),
                height: displayWidth * .165,
                decoration: BoxDecoration(
                  color: KPrimaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: displayWidth * .02),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      setState(() {
                        currentIndex = index;
                        HapticFeedback.lightImpact();
                      });
                      controller.changeSelectedIndex(index);
                      HapticFeedback.lightImpact();
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Stack(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          width: index == currentIndex
                              ? displayWidth * .32
                              : displayWidth * .18,
                          alignment: Alignment.center,
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            height:
                                index == currentIndex ? displayWidth * .12 : 0,
                            width:
                                index == currentIndex ? displayWidth * .32 : 0,
                            decoration: BoxDecoration(
                              color: index == currentIndex
                                  ? KPrimaryColor.withOpacity(.2)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          width: index == currentIndex
                              ? displayWidth * .31
                              : displayWidth * .18,
                          alignment: Alignment.center,
                          child: Stack(
                            children: [
                              Row(
                                children: [
                                  AnimatedContainer(
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.fastLinearToSlowEaseIn,
                                    width: index == currentIndex
                                        ? displayWidth * .13
                                        : 0,
                                  ),
                                  AnimatedOpacity(
                                    opacity: index == currentIndex ? 1 : 0,
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.fastLinearToSlowEaseIn,
                                    child: Text(
                                      index == currentIndex
                                          ? listOfStrings[index]
                                          : '',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  AnimatedContainer(
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.fastLinearToSlowEaseIn,
                                    width: index == currentIndex
                                        ? displayWidth * .03
                                        : 20,
                                  ),
                                  Icon(
                                    listOfIcons?[index],
                                    size: displayWidth * .074,
                                    color: index == currentIndex
                                        ? Colors.white
                                        : Colors.white,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }

  List<IconData> listOfIcons = [
    IconBroken.Home,
    IconBroken.Swap,
    Icons.hotel,
    IconBroken.Profile,
  ];

  List<String> listOfStrings = [
    'Home',
    'Transport',
    'Hotels',
    'Profile',

  ];
}
