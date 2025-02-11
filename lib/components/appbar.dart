import 'package:flutter/material.dart';
import 'package:tech_news/utils/colors.dart';
import 'package:tech_news/utils/text.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  const Appbar({super.key}) : preferredSize = const Size.fromHeight(50);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: SizedBox(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BoldText(text: 'Tech', size: 20, color: AppColor.primary),
            BoldText(text: 'Newz', size: 20, color: AppColor.lightWhite)
          ],
        ),
      ),
      backgroundColor: AppColor.black,
      elevation: 0,
      centerTitle: true,
    );
  }
}
