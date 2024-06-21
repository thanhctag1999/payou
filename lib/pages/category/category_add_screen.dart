import 'package:bank_ui/controllers/category_controller.dart';
import 'package:bank_ui/controllers/wallet_controller.dart';
import 'package:bank_ui/widgets/constant.dart';
import 'package:bank_ui/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryAddScreen extends StatefulWidget {
  const CategoryAddScreen(
      {super.key, this.name, this.type, this.id, this.color});
  final id;
  final name;
  final type;
  final color;

  @override
  State<CategoryAddScreen> createState() => _CategoryAddScreenState();
}

class _CategoryAddScreenState extends State<CategoryAddScreen> {
  final CategoryController controller = Get.find();
  final List<String> _locations = ['Income', 'Spent']; // Option 2
  String _selectedLocation = "Income";

  @override
  void initState() {
    controller.categoryName.text = widget.name ?? "";
    controller.categoryType.text = widget.type ?? "";
    controller.selectedColor.value = widget.color ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        const Color.fromARGB(255, 211, 230, 255)
                                            .withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.arrow_back_ios_new_outlined,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          widget.id != null
                              ? Text(
                                  "Edit Category",
                                  style: GoogleFonts.coiny(fontSize: 26),
                                )
                              : Text(
                                  "Add new Category",
                                  style: GoogleFonts.coiny(fontSize: 26),
                                )
                        ],
                      ),
                      widget.id != null
                          ? GestureDetector(
                              onTap: () {
                                controller.deleteCategory(widget.id);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color.fromARGB(
                                              255, 219, 233, 253)
                                          .withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.delete,
                                  color: primaryColor,
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 219, 233, 253)
                                  .withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.wallet,
                          color: primaryColor,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Category Name",
                            style: GoogleFonts.coiny(fontSize: 18),
                          ),
                          SizedBox(
                            width: width / 2 + 100,
                            child: TextField(
                              enableInteractiveSelection: true,
                              textCapitalization: TextCapitalization.words,
                              cursorColor: primaryColor,
                              controller: controller.categoryName,
                              decoration: InputDecoration(
                                border: const UnderlineInputBorder(),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: primaryColor)),
                                hintText: 'Category name',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 219, 233, 253)
                                  .withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.price_change,
                          color: primaryColor,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Category Type",
                            style: GoogleFonts.coiny(fontSize: 18),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color.fromARGB(255, 219, 233, 253)
                                          .withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: DropdownButton(
                                hint: const Text('Please choose a type'),
                                value: _selectedLocation,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedLocation = newValue!;
                                  });
                                },
                                items: _locations.map((location) {
                                  return DropdownMenuItem(
                                    value: location,
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(location),
                                    ),
                                  );
                                }).toList(),
                                icon: const Icon(Icons.arrow_drop_down),
                                iconSize: 42,
                                underline: const SizedBox()),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Category Color",
                    style: GoogleFonts.coiny(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 40,
                    width: width,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: colors.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                controller.selectedColor.value = index;
                              },
                              child: Obx(
                                () => Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: colors[index],
                                    borderRadius: BorderRadius.circular(40),
                                    border: Border.all(
                                      color: controller.selectedColor.value ==
                                              index
                                          ? Colors.black
                                          : Colors
                                              .white, // Change to your desired border color
                                      width:
                                          2.0, // Change to your desired border width
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        if (controller.categoryName.text.isEmpty) {
                          showToast(message: "Category name is empty");
                        } else {
                          controller.categoryType.text = _selectedLocation;
                          widget.id != null
                              ? controller.updateCategory(widget.id)
                              : controller.addCategoryToDatabase();
                        }
                      },
                      child: Container(
                        width: width / 2,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "Save",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.coiny(
                              fontSize: 24, color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
