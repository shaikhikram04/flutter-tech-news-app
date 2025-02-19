import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_news/backend/functions.dart';
import 'package:tech_news/utils/colors.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key, required this.onSearch});
  final VoidCallback onSearch;

  static final searchController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              color: AppColor.darkGrey,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: 'Search a Keyword or a Phrase',
                        hintStyle: GoogleFonts.lato(),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            FocusScope.of(context).unfocus();
            onSearch();
          },
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: AppColor.darkGrey,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.search,
              color: AppColor.white,
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
