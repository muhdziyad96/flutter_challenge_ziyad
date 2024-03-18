import 'package:flutter_challenge_ziyad/model/game_model.dart';
import 'package:flutter_challenge_ziyad/services/games_service.dart';
import 'package:get/get.dart';

class GameController extends GetxController {
  int? gamesId;
  var gameById = Games().obs;
  int page = 1;

  Future<void> getGameById(int page) async {
    final Games? response = await GameService().getGameById(gamesId!, page);
    gameById.value = response!;
    update();
  }
}
