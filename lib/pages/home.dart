import 'package:flutter/material.dart';
import 'package:tech_news/backend/functions.dart';
import 'package:tech_news/components/appbar.dart';
import 'package:tech_news/components/news_box.dart';
import 'package:tech_news/utils/colors.dart';
import 'package:tech_news/utils/constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List> news;

  @override
  void initState() {
    super.initState();
    news = fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: Appbar(),
      body: Column(
        children: [
          SearchBar(),
          Expanded(
            child: SizedBox(
              width: w,
              child: FutureBuilder(
                future: news,
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      if (snapshot.hasData) {
                        final data = snapshot.data![index];
                        return NewsBox(
                          imageUrl: data['urlToImage'] ?? Constants.imageUrl,
                          title: data['title'],
                          description: data['description'],
                          url: data['url'],
                          time: data['publishedAt'],
                        );
                      } else if (snapshot.hasError) {
                        return Text("Error: ${snapshot.error}");
                      }

                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColor.primary,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
