import 'package:bank_ui/controllers/category_controller.dart';
import 'package:bank_ui/pages/category/category_add_screen.dart';
import 'package:bank_ui/pages/category/widgets/category_item.dart';
import 'package:bank_ui/widgets/constant.dart';
import 'package:bank_ui/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {
  final controller = Get.put(CategoryController());
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CustomAppBar(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.diamond_outlined,
                          color: primaryColor,
                          size: 40,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Category",
                          style: GoogleFonts.coiny(fontSize: 22),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(const CategoryAddScreen());
                  },
                  child: Container(
                    width: 80,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 211, 230, 255)
                              .withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.add,
                      color: primaryColor,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            TabBar(
              unselectedLabelColor: Colors.black,
              labelColor: primaryColor,
              indicatorColor: primaryColor,
              dividerHeight: 2.0,
              tabs: [
                Tab(
                    icon: FaIcon(
                      FontAwesomeIcons.arrowUpFromBracket,
                      color: primaryColor,
                    ),
                    text: "Income"),
                Tab(
                    icon: RotatedBox(
                      quarterTurns: 90,
                      child: FaIcon(
                        FontAwesomeIcons.arrowUpFromBracket,
                        color: primaryColor,
                      ),
                    ),
                    text: "Spent"),
              ],
              controller: tabController,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
            Expanded(
              child: Obx(
                () => TabBarView(
                  controller: tabController,
                  children: [
                    controller.categoriesIncome.isNotEmpty
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.categoriesIncome.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: GestureDetector(
                                    onTap: () {
                                      Get.to(CategoryAddScreen(
                                        id: controller
                                            .categoriesIncome[index].id,
                                        name: controller
                                            .categoriesIncome[index].name,
                                        type: controller
                                            .categoriesIncome[index].type,
                                        color: controller
                                            .categoriesIncome[index].color,
                                      ));
                                    },
                                    child: CategoryItem(
                                      id: controller.categoriesIncome[index].id,
                                      name: controller
                                          .categoriesIncome[index].name,
                                      type: controller
                                          .categoriesIncome[index].type,
                                      color: controller
                                          .categoriesIncome[index].color,
                                    )),
                              );
                            })
                        : SizedBox(
                            height: height / 2,
                            child: Center(
                              child: Text(
                                "Empty Category",
                                style: GoogleFonts.coiny(
                                    fontSize: 20,
                                    color:
                                        const Color.fromARGB(255, 87, 87, 87)),
                              ),
                            ),
                          ),
                    controller.categoriesSpent.isNotEmpty
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.categoriesSpent.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: GestureDetector(
                                    onTap: () {
                                      Get.to(CategoryAddScreen(
                                        id: controller
                                            .categoriesSpent[index].id,
                                        name: controller
                                            .categoriesSpent[index].name,
                                        type: controller
                                            .categoriesSpent[index].type,
                                        color: controller
                                            .categoriesSpent[index].color,
                                      ));
                                    },
                                    child: CategoryItem(
                                      id: controller.categoriesSpent[index].id,
                                      name: controller
                                          .categoriesSpent[index].name,
                                      type: controller
                                          .categoriesSpent[index].type,
                                      color: controller
                                          .categoriesSpent[index].color,
                                    )),
                              );
                            })
                        : SizedBox(
                            height: height / 2,
                            child: Center(
                              child: Text(
                                "Empty Category",
                                style: GoogleFonts.coiny(
                                    fontSize: 20,
                                    color:
                                        const Color.fromARGB(255, 87, 87, 87)),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
