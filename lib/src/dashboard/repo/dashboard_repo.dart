import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:movies/src/dashboard/model/movie_model.dart';

class DashboardRepository{
  Future<List<MovieModel>> searchMovie(String query, {int? page}) async {
    try {
      final response = await http.get(
        Uri.parse(
          "https://api.themoviedb.org/3/search/movie?api_key=17fb68a6d622e33da434219db226c3a4&query=$query&page=$page",
        ),
      ).timeout(const Duration(seconds: 20));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List result = data["results"];
        if (result.isNotEmpty) {
          return result.map((e) => MovieModel.fromJson(e)).toList();
        } else {
          return [];
        }
      }
      else {
        debugPrint(jsonDecode(response.body));
        throw Exception("Failed to fetch data. Status code: ${response.statusCode}");
      }
    }on TimeoutException catch(_){
      throw Exception("Error occurred: TimeoutException");
    }
    catch (e) {
      if(e.toString().contains("Failed host lookup")){
        throw Exception("Internet is not Connected");
      }
      throw Exception("Error occurred: $e");
    }
  }
}