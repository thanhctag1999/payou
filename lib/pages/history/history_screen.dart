import 'package:bank_ui/pages/history/widgets/filter_form.dart';
import 'package:bank_ui/pages/history/widgets/history_item.dart';
import 'package:bank_ui/pages/history/widgets/search_form.dart';
import 'package:bank_ui/widgets/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "History",
                  style: GoogleFonts.coiny(fontSize: 28),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.filter_alt_outlined,
                      size: 28,
                      color: Colors.black,
                    ))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const SearchForm(),
            const SizedBox(
              height: 20,
            ),
            const FilterForm(),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return HistoryItem(
                    icon: Icon(
                      index % 2 == 0
                          ? Icons.shopping_bag_outlined
                          : Icons.movie_creation_outlined,
                      color: primaryColor,
                    ),
                    title: 'Broadband',
                    time: '08 Mar 2024',
                    price: '120.00\$',
                    wallet: 'Cash',
                    isSend: index % 2 == 0 ? false : true,
                    background: index % 2 == 0
                        ? const Color.fromARGB(255, 224, 227, 255)
                        : const Color.fromARGB(255, 255, 236, 224),
                  );
                })
          ],
        ),
      ),
    ));
  }
}
