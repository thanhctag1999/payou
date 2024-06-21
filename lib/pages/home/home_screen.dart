import 'package:bank_ui/controllers/home_controller.dart';
import 'package:bank_ui/pages/category/category_screen.dart';
import 'package:bank_ui/pages/history/history_screen.dart';
import 'package:bank_ui/pages/wallet/wallet_screen.dart';
import 'package:bank_ui/pages/widgets/home_card.dart';
import 'package:bank_ui/pages/widgets/home_slider.dart';
import 'package:bank_ui/pages/widgets/primary_feature.dart';
import 'package:bank_ui/pages/widgets/second_feature.dart';
import 'package:bank_ui/pages/widgets/third_feature.dart';
import 'package:bank_ui/widgets/constant.dart';
import 'package:bank_ui/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());
  final Color navigationBarColor = Colors.white;
  int selectedIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController =
        PageController(initialPage: controller.selectedIndex.value);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: navigationBarColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        // backgroundColor: Colors.grey,
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: <Widget>[
            HomePage(),
            const WalletScreen(),
            const HistoryScreen(),
            const CategoryScreen()
          ],
        ),
        bottomNavigationBar: WaterDropNavBar(
          backgroundColor: navigationBarColor,
          waterDropColor: primaryColor,
          onItemSelected: (int index) {
            setState(() {
              selectedIndex = index;
            });
            pageController.animateToPage(selectedIndex,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOutQuad);
          },
          selectedIndex: selectedIndex,
          barItems: <BarItem>[
            BarItem(
              filledIcon: FontAwesomeIcons.home,
              outlinedIcon: Icons.home_outlined,
            ),
            BarItem(
                filledIcon: FontAwesomeIcons.wallet,
                outlinedIcon: Icons.wallet_outlined),
            BarItem(
              filledIcon: FontAwesomeIcons.clockRotateLeft,
              outlinedIcon: Icons.history,
            ),
            BarItem(
              filledIcon: Icons.diamond,
              outlinedIcon: Icons.diamond_outlined,
            ),
          ],
        ),
      ),
    );
  }

  Widget HomePage() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          const CustomAppBar(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: height / 2 - 40,
              decoration: const BoxDecoration(),
              child: const Column(
                children: [
                  HomeCard(),
                  SizedBox(
                    height: 5,
                  ),
                  PrimaryFeature(),
                  SizedBox(
                    height: 5,
                  ),
                  HomeSlider()
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: width,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 227, 239, 255)
                          .withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                  color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Pay Service",
                      style: GoogleFonts.coiny(),
                    ),
                    const SecondFeature(),
                    const ThirdFeature(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
