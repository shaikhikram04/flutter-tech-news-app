import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:tech_news/components/search_bar.dart';

Future<List> fetchNews() async {
  final key = dotenv.get('NEWS_API_KEY');
  final response = await http.get(
    Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=us&category=technology&pageSize=100&apiKey=$key&q=${SearchBar.searchController.text}',
    ),
  );

  Map result = jsonDecode(response.body);

  return result['articles'];
}
