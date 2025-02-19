import 'package:flutter/material.dart';
import 'package:tech_news/components/bottom_sheet.dart';
import 'package:tech_news/components/components.dart';
import 'package:tech_news/utils/colors.dart';
import 'package:tech_news/utils/text.dart';

class NewsBox extends StatelessWidget {
  const NewsBox(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.description,
      required this.url,
      required this.time});

  final String imageUrl;
  final String title;
  final String description;
  final String url;
  final String time;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        InkWell(
          onTap: () {
            showMyBottomSheet(context, title, description, imageUrl, url, time);
          },
          child: Container(
            width: w,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(left: 5, right: 5, top: 5),
            color: AppColor.black,
            child: Row(
              children: [
                Image.network(
                  imageUrl,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  headers: const {
                    'Accept': 'image/*',
                  },
                  frameBuilder:
                      (context, child, frame, wasSynchronouslyLoaded) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[300],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: child,
                      ),
                    );
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColor.primary,
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.error_outline, color: Colors.red),
                    );
                  },
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ModifiedText(
                          text: title, size: 16, color: AppColor.white),
                      SizedBox(height: 5),
                      ModifiedText(
                          text: time, size: 12, color: AppColor.lightWhite),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        DividerWidget(),
      ],
    );
  }
}
