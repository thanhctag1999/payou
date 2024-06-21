import 'package:bank_ui/pages/widgets/home_slider_item.dart';
import 'package:bank_ui/widgets/constant.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(height: 120.0),
      items: [1, 2, 3].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return HomSliderItem(
              icon: FaIcon(
                FontAwesomeIcons.speakap,
                size: 62,
                color: primaryColor,
              ),
              title: 'Cashback 100%',
              description: 'Invite your friends and get Cashback',
              background1: const Color.fromARGB(159, 231, 255, 146),
              background2: const Color.fromARGB(148, 152, 255, 207),
            );
          },
        );
      }).toList(),
    );
  }
}
