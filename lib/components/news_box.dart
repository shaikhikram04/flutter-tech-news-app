import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
          onTap: () {},
          child: Container(
            width: w,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(left: 5, right: 5, top: 5),
            height: 200,
            color: AppColor.black,
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: imageUrl,
                  imageBuilder: (context, imageProvider) => Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.yellow,
                    ),
                  ),
                  placeholder: (context, url) => CircularProgressIndicator(
                    color: AppColor.primary,
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
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
