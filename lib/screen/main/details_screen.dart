import 'package:flutter/material.dart';
import 'package:flutter_challenge_ziyad/constant/color.dart';
import 'package:flutter_challenge_ziyad/controller/game_controller.dart';
import 'package:flutter_challenge_ziyad/model/game_model.dart' as gs;
import 'package:flutter_challenge_ziyad/model/game_model.dart';
import 'package:flutter_challenge_ziyad/screen/shared/shimmer_loading_shared.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  GameController g = Get.find();
  late Future<gs.Games?> getGameById;

  @override
  void initState() {
    super.initState();
    g.getGameById(g.page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(g.gameById.value
              .getGameNameOrLoading(g.gameById.value, g.gamesId!)),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
        ],
      ),
      body: Shimmer(
        linearGradient: shimmerGradient,
        child: Column(
          children: [
            // CustomPaint(
            //   size: Size.infinite,
            //   painter: PolkaDotPainter(),
            // ),
            Obx(() => ShimmerLoading(
                  isLoading: g.gameById.value.id != g.gamesId,
                  child: Image.network(g.gameById.value.backgroundImage ??
                      'https://media.rawg.io/media/games/20a/20aa03a10cda45239fe22d035c0ebe64.jpg'),
                )),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(2.1.w),
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadiusDirectional.circular(10)),
                    child: Obx(
                      () => SingleChildScrollView(
                        physics: g.gameById.value.id != g.gamesId
                            ? const NeverScrollableScrollPhysics()
                            : null,
                        child: Column(
                          children: [
                            Obx(
                              () => Padding(
                                padding: EdgeInsets.all(2.1.w),
                                child: ShimmerLoading(
                                  isLoading: g.gameById.value.id != g.gamesId,
                                  child: _buildList(
                                      g.gameById.value.id != g.gamesId,
                                      g.gameById.value,
                                      context),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget expandedTile(Widget child) {
  return Theme(data: ThemeData(dividerColor: Colors.transparent), child: child);
}

Widget shimmerContainer() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: double.infinity,
        height: 24,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      const SizedBox(height: 16),
      Container(
        width: 250,
        height: 24,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      const SizedBox(height: 16),
      Container(
        width: 300,
        height: 24,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      const SizedBox(height: 16),
      Container(
        width: 150,
        height: 24,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      const SizedBox(height: 16),
      Container(
        width: 250,
        height: 24,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      const SizedBox(height: 16),
      Container(
        width: double.infinity,
        height: 24,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      const SizedBox(height: 16),
      Container(
        width: 150,
        height: 24,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      const SizedBox(height: 16),
      Container(
        width: 500,
        height: 24,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      const SizedBox(height: 16),
      Container(
        width: 150,
        height: 24,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      const SizedBox(height: 16),
      Container(
        width: double.infinity,
        height: 24,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ],
  );
}

Widget _buildList(bool isLoading, Games gameData, BuildContext context) {
  if (isLoading) {
    return shimmerContainer();
  } else {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 2.1.w),
            child: SmoothStarRating(
                allowHalfRating: false,
                starCount: 5,
                rating: gameData.rating ?? 0,
                size: 30.0,
                color: Colors.amber,
                borderColor: Colors.amber,
                spacing: 0.0),
          ),
        ),
        Row(
          children: [
            const Text('Game Name: '),
            Text(gameData.name!),
          ],
        ),
        Row(
          children: [
            const Text('Released Date: '),
            Text(
              DateFormat('yyyy').format(gameData.released!),
            ),
          ],
        ),
        Row(
          children: [
            const Text('ESRB Rating: '),
            Text(gameData.esrbRating?.name ?? ''),
          ],
        ),
        const Divider(),
        expandedTile(
          ExpansionTile(
            tilePadding: EdgeInsets.zero,
            title: const Text('Genres:'),
            initiallyExpanded: false,
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: gameData.genres!.length,
                itemBuilder: (context, index) {
                  final genres = gameData.genres![index];
                  return Text("- ${genres.name!}");
                },
              ),
            ],
          ),
        ),
        expandedTile(
          ExpansionTile(
            tilePadding: EdgeInsets.zero,
            title: const Text('Platforms:'),
            initiallyExpanded: false,
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: gameData.platforms!.length,
                itemBuilder: (context, index) {
                  final platform = gameData.platforms![index];

                  return Text("- ${platform.platform!.name!}");
                },
              ),
            ],
          ),
        ),
        expandedTile(
          ExpansionTile(
            tilePadding: EdgeInsets.zero,
            title: const Text('Where to get: '),
            initiallyExpanded: false,
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: gameData.stores!.length,
                itemBuilder: (context, index) {
                  final stores = gameData.stores![index];

                  return Text("- ${stores.store!.name}");
                },
              ),
            ],
          ),
        ),
        const Divider(),
        if (gameData.shortScreenshots != null)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.2.w),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (final shortScreenshots in gameData.shortScreenshots!)
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => Dialog(
                            child: Image.network(
                              shortScreenshots.image!,
                              fit: BoxFit.contain,
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 8.0), // Adjust the spacing between images
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            shortScreenshots.image!,
                            fit: BoxFit.fill,
                            height: 13.h, // Adjust the height as needed
                            width: 40.w, // Adjust the width as needed
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
