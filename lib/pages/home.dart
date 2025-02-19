import 'package:flutter/material.dart';
import 'package:tech_news/backend/functions.dart';
import 'package:tech_news/components/appbar.dart';
import 'package:tech_news/components/news_box.dart';
import 'package:tech_news/components/search_bar.dart' as search;
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

  void onSearch() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: Appbar(),
      body: Column(
        children: [
          search.SearchBar(onSearch: onSearch),
          Expanded(
            child: SizedBox(
              width: w,
              child: FutureBuilder(
                future: fetchNews(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return NewsBox(
                            url: snapshot.data![index]['url'],
                            imageUrl: snapshot.data![index]['urlToImage'] ??
                                Constants.imageUrl,
                            title: snapshot.data![index]['title'],
                            time: snapshot.data![index]['publishedAt'],
                            description:
                                snapshot.data![index]['description'].toString(),
                          );
                        });
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  // By default, show a loading spinner.
                  return Center(
                      child: CircularProgressIndicator(
                    color: AppColor.primary,
                  ));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
