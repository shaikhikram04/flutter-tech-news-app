import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tech_news/components/search_bar.dart';
import 'package:tech_news/utils/keys.dart';

Future<List> fetchNews() async {
  final key = Keys.newsApiKey;
  final response = await http.get(
    Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=us&category=technology&pageSize=100&apiKey=$key&q=${SearchBar.searchController.text}',
    ),
  );

  Map result = jsonDecode(response.body);

  return result['articles'];
}
