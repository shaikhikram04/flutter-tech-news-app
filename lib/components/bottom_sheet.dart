import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_news/components/components.dart';
import 'package:tech_news/utils/colors.dart';
import 'package:tech_news/utils/text.dart';
import 'package:url_launcher/url_launcher.dart';

void showMyBottomSheet(BuildContext context, String title, String description,
    String imageUrl, String url, String time) {
  showBottomSheet(
    context: context,
    backgroundColor: AppColor.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    elevation: 20,
    builder: (context) => MyBottomSheetLayout(
      title: title,
      description: description,
      imageUrl: imageUrl,
      url: url,
    ),
  );
}

_launchUrl(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}

class MyBottomSheetLayout extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String url;

  const MyBottomSheetLayout({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          BottomSheetImage(imageUrl: imageUrl, title: title),
          Container(
            padding: EdgeInsets.all(10),
            child: ModifiedText(
              text: description,
              size: 16,
              color: AppColor.white,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: RichText(
              text: TextSpan(
                text: 'Read Full Article',
                style: GoogleFonts.lato(
                  color: Colors.blue.shade400,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => _launchUrl(url),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
