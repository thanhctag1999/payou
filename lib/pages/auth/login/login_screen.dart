import 'package:bank_ui/pages/auth/login/widgets/login_form.dart';
import 'package:bank_ui/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
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
                Text(
                  "Welcome",
                  style: GoogleFonts.coiny(fontSize: 28),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Create a new account",
                  style: GoogleFonts.notoSansMongolian(
                      fontSize: 16,
                      color: const Color.fromARGB(255, 66, 66, 66)),
                ),
                const SizedBox(
                  height: 80,
                ),
                RichText(
                    text: TextSpan(
                  text: 'Pay',
                  style: GoogleFonts.coiny(
                      color: primaryColor,
                      fontSize: 48,
                      fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'ou',
                        style: GoogleFonts.coiny(
                          fontWeight: FontWeight.bold,
                          color: secondColor,
                          fontSize: 48,
                        )),
                  ],
                )),
                const SizedBox(
                  height: 100,
                ),
                const LoginForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
