import 'package:bank_ui/pages/home/home_screen.dart';
import 'package:bank_ui/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  var userName = TextEditingController();
  var phone = TextEditingController();
  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
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
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Icon(
                Icons.person,
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
                  "Your Name",
                  style: GoogleFonts.coiny(fontSize: 18),
                ),
                SizedBox(
                  width: width / 2 + 80,
                  child: TextField(
                    cursorColor: primaryColor,
                    controller: userName,
                    decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: primaryColor)),
                      hintText: 'Your name',
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
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: FaIcon(
                FontAwesomeIcons.mobile,
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
                  "Phone Number",
                  style: GoogleFonts.coiny(fontSize: 18),
                ),
                SizedBox(
                  width: width / 2 + 80,
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    cursorColor: primaryColor,
                    controller: phone,
                    decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: primaryColor)),
                      hintText: 'Phone number',
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
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: FaIcon(
                FontAwesomeIcons.key,
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
                  "Password",
                  style: GoogleFonts.coiny(fontSize: 18),
                ),
                SizedBox(
                  width: width / 2 + 80,
                  child: TextField(
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    cursorColor: primaryColor,
                    controller: password,
                    decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: primaryColor)),
                      hintText: 'Password',
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              FontAwesomeIcons.checkSquare,
              color: primaryColor,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "Agree to our Term and Conditions",
              style: GoogleFonts.notoSansMongolian(),
            )
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        GestureDetector(
          onTap: () {
            Get.to(const HomeScreen());
          },
          child: Container(
            width: width / 2,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(20)),
            child: Text(
              "Sign In",
              textAlign: TextAlign.center,
              style: GoogleFonts.coiny(fontSize: 24, color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
