import 'package:flutter/services.dart';
import 'package:flutter_challenge_ziyad/controller/game_controller.dart';
import 'package:flutter_challenge_ziyad/model/game_model.dart';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GameService {
  GameController g = Get.find();
  Future<List<Games>> getGameList(int page) async {
    try {
      final response = await http.get(
        Uri.parse(
            "https://api.rawg.io/api/games?key=e3deef19077748c3bf6b5c189e363106&page=$page"),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      // final String response = await rootBundle.loadString('assets/games.json');

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        var results = responseData['results'];
        List<Games> gamesList =
            List.from(results.map((data) => Games.fromJson(data)));

        return gamesList;
      } else {
        throw Exception('Failed to load game');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<Games?> getGameById(int id, int page) async {
    try {
      final response = await http.get(
        Uri.parse(
            "https://api.rawg.io/api/games?key=e3deef19077748c3bf6b5c189e363106&page=$page"),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        var results = responseData['results'];

        var gameData = results.firstWhere(
          (data) => data['id'] == id,
          orElse: () => null,
        );

        if (gameData != null) {
          return Games.fromJson(gameData);
        } else {
          return null;
        }
      } else {
        throw Exception('Failed to load games');
      }
    } catch (e) {
      throw Exception('Failed to fetch game: $e');
    }
  }
}
