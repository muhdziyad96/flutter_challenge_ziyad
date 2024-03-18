import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Games? gamesFromJson(String? str) =>
    str != null ? Games.fromJson(json.decode(str)) : null;

String? gamesToJson(Games? data) =>
    data != null ? json.encode(data.toJson()) : null;

class Games {
  int? id;
  String? slug;
  String? name;
  DateTime? released;
  bool? tba;
  String? backgroundImage;
  double? rating;
  int? ratingTop;
  List<Rating>? ratings;
  int? ratingsCount;
  int? reviewsTextCount;
  int? added;
  AddedByStatus? addedByStatus;
  int? metacritic;
  int? playtime;
  int? suggestionsCount;
  DateTime? updated;
  dynamic userGame;
  int? reviewsCount;
  Color? saturatedColor;
  Color? dominantColor;
  List<PlatformElement>? platforms;
  List<ParentPlatform>? parentPlatforms;
  List<Genre>? genres;
  List<Store>? stores;
  dynamic clip;
  List<Genre>? tags;
  EsrbRating? esrbRating;
  List<ShortScreenshot>? shortScreenshots;

  Games({
    this.id,
    this.slug,
    this.name,
    this.released,
    this.tba,
    this.backgroundImage,
    this.rating,
    this.ratingTop,
    this.ratings,
    this.ratingsCount,
    this.reviewsTextCount,
    this.added,
    this.addedByStatus,
    this.metacritic,
    this.playtime,
    this.suggestionsCount,
    this.updated,
    this.userGame,
    this.reviewsCount,
    this.saturatedColor,
    this.dominantColor,
    this.platforms,
    this.parentPlatforms,
    this.genres,
    this.stores,
    this.clip,
    this.tags,
    this.esrbRating,
    this.shortScreenshots,
  });

  factory Games.fromJson(Map<String, dynamic> json) => Games(
        id: json["id"],
        slug: json["slug"],
        name: json["name"],
        released:
            json["released"] != null ? DateTime.parse(json["released"]) : null,
        tba: json["tba"],
        backgroundImage: json["background_image"],
        rating: json["rating"]?.toDouble(),
        ratingTop: json["rating_top"],
        ratings: json["ratings"] != null
            ? List<Rating>.from(json["ratings"].map((x) => Rating.fromJson(x)))
            : null,
        ratingsCount: json["ratings_count"],
        reviewsTextCount: json["reviews_text_count"],
        added: json["added"],
        addedByStatus: json["added_by_status"] != null
            ? AddedByStatus.fromJson(json["added_by_status"])
            : null,
        metacritic: json["metacritic"],
        playtime: json["playtime"],
        suggestionsCount: json["suggestions_count"],
        updated:
            json["updated"] != null ? DateTime.parse(json["updated"]) : null,
        userGame: json["user_game"],
        reviewsCount: json["reviews_count"],
        saturatedColor: json["saturated_color"] != null
            ? colorValues.map[json["saturated_color"]]
            : null,
        dominantColor: json["dominant_color"] != null
            ? colorValues.map[json["dominant_color"]]
            : null,
        platforms: json["platforms"] != null
            ? List<PlatformElement>.from(
                json["platforms"].map((x) => PlatformElement.fromJson(x)))
            : null,
        parentPlatforms: json["parent_platforms"] != null
            ? List<ParentPlatform>.from(
                json["parent_platforms"].map((x) => ParentPlatform.fromJson(x)))
            : null,
        genres: json["genres"] != null
            ? List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x)))
            : null,
        stores: json["stores"] != null
            ? List<Store>.from(json["stores"].map((x) => Store.fromJson(x)))
            : null,
        clip: json["clip"],
        tags: json["tags"] != null
            ? List<Genre>.from(json["tags"].map((x) => Genre.fromJson(x)))
            : null,
        esrbRating: json["esrb_rating"] != null
            ? EsrbRating.fromJson(json["esrb_rating"])
            : null,
        shortScreenshots: json["short_screenshots"] != null
            ? List<ShortScreenshot>.from(json["short_screenshots"]
                .map((x) => ShortScreenshot.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "name": name,
        "released": released != null
            ? "${released!.year.toString().padLeft(4, '0')}-${released!.month.toString().padLeft(2, '0')}-${released!.day.toString().padLeft(2, '0')}"
            : null,
        "tba": tba,
        "background_image": backgroundImage,
        "rating": rating,
        "rating_top": ratingTop,
        "ratings": ratings != null
            ? List<dynamic>.from(ratings!.map((x) => x.toJson()))
            : null,
        "ratings_count": ratingsCount,
        "reviews_text_count": reviewsTextCount,
        "added": added,
        "added_by_status":
            addedByStatus != null ? addedByStatus!.toJson() : null,
        "metacritic": metacritic,
        "playtime": playtime,
        "suggestions_count": suggestionsCount,
        "updated": updated != null ? updated!.toIso8601String() : null,
        "user_game": userGame,
        "reviews_count": reviewsCount,
        "saturated_color":
            saturatedColor != null ? colorValues.reverse[saturatedColor] : null,
        "dominant_color":
            dominantColor != null ? colorValues.reverse[dominantColor] : null,
        "platforms": platforms != null
            ? List<dynamic>.from(platforms!.map((x) => x.toJson()))
            : null,
        "parent_platforms": parentPlatforms != null
            ? List<dynamic>.from(parentPlatforms!.map((x) => x.toJson()))
            : null,
        "genres": genres != null
            ? List<dynamic>.from(genres!.map((x) => x.toJson()))
            : null,
        "stores": stores != null
            ? List<dynamic>.from(stores!.map((x) => x.toJson()))
            : null,
        "clip": clip,
        "tags": tags != null
            ? List<dynamic>.from(tags!.map((x) => x.toJson()))
            : null,
        "esrb_rating": esrbRating != null ? esrbRating!.toJson() : null,
        "short_screenshots": shortScreenshots != null
            ? List<dynamic>.from(shortScreenshots!.map((x) => x.toJson()))
            : null,
      };
}

class Filters {
  List<FiltersYear>? years;

  Filters({
    required this.years,
  });

  factory Filters.fromJson(Map<String, dynamic> json) => Filters(
        years: json["years"] != null
            ? List<FiltersYear>.from(
                json["years"].map((x) => FiltersYear.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "years": years != null
            ? List<dynamic>.from(years!.map((x) => x.toJson()))
            : null,
      };
}

class FiltersYear {
  int? from;
  int? to;
  String? filter;
  int? decade;
  List<YearYear>? years;
  bool? nofollow;
  int? count;

  FiltersYear({
    required this.from,
    required this.to,
    required this.filter,
    required this.decade,
    required this.years,
    required this.nofollow,
    required this.count,
  });

  factory FiltersYear.fromJson(Map<String, dynamic> json) => FiltersYear(
        from: json["from"],
        to: json["to"],
        filter: json["filter"],
        decade: json["decade"],
        years: json["years"] != null
            ? List<YearYear>.from(
                json["years"].map((x) => YearYear.fromJson(x)))
            : null,
        nofollow: json["nofollow"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "from": from,
        "to": to,
        "filter": filter,
        "decade": decade,
        "years": years != null
            ? List<dynamic>.from(years!.map((x) => x.toJson()))
            : null,
        "nofollow": nofollow,
        "count": count,
      };
}

class YearYear {
  int? year;
  int? count;
  bool? nofollow;

  YearYear({
    required this.year,
    required this.count,
    required this.nofollow,
  });

  factory YearYear.fromJson(Map<String, dynamic> json) => YearYear(
        year: json["year"],
        count: json["count"],
        nofollow: json["nofollow"],
      );

  Map<String, dynamic> toJson() => {
        "year": year,
        "count": count,
        "nofollow": nofollow,
      };
}

class AddedByStatus {
  int? yet;
  int? owned;
  int? beaten;
  int? toplay;
  int? dropped;
  int? playing;

  AddedByStatus({
    required this.yet,
    required this.owned,
    required this.beaten,
    required this.toplay,
    required this.dropped,
    required this.playing,
  });

  factory AddedByStatus.fromJson(Map<String, dynamic> json) => AddedByStatus(
        yet: json["yet"],
        owned: json["owned"],
        beaten: json["beaten"],
        toplay: json["toplay"],
        dropped: json["dropped"],
        playing: json["playing"],
      );

  Map<String, dynamic> toJson() => {
        "yet": yet,
        "owned": owned,
        "beaten": beaten,
        "toplay": toplay,
        "dropped": dropped,
        "playing": playing,
      };
}

enum Color { THE_0_F0_F0_F }

final colorValues = EnumValues({"0f0f0f": Color.THE_0_F0_F0_F});

class EsrbRating {
  int? id;
  String? name;
  String? slug;

  EsrbRating({
    required this.id,
    required this.name,
    required this.slug,
  });

  factory EsrbRating.fromJson(Map<String, dynamic> json) => EsrbRating(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
      };
}

class Genre {
  int? id;
  String? name;
  String? slug;
  int? gamesCount;
  String? imageBackground;
  Domain? domain;
  Language? language;

  Genre({
    required this.id,
    required this.name,
    required this.slug,
    required this.gamesCount,
    required this.imageBackground,
    this.domain,
    this.language,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        gamesCount: json["games_count"],
        imageBackground: json["image_background"],
        domain:
            json["domain"] != null ? domainValues.map[json["domain"]] : null,
        language: json["language"] != null
            ? languageValues.map[json["language"]]
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "games_count": gamesCount,
        "image_background": imageBackground,
        "domain": domain != null ? domainValues.reverse[domain!] : null,
        "language": language != null ? languageValues.reverse[language!] : null,
      };
}

enum Domain {
  APPS_APPLE_COM,
  EPICGAMES_COM,
  GOG_COM,
  MARKETPLACE_XBOX_COM,
  MICROSOFT_COM,
  NINTENDO_COM,
  PLAY_GOOGLE_COM,
  STORE_PLAYSTATION_COM,
  STORE_STEAMPOWERED_COM
}

final domainValues = EnumValues({
  "apps.apple.com": Domain.APPS_APPLE_COM,
  "epicgames.com": Domain.EPICGAMES_COM,
  "gog.com": Domain.GOG_COM,
  "marketplace.xbox.com": Domain.MARKETPLACE_XBOX_COM,
  "microsoft.com": Domain.MICROSOFT_COM,
  "nintendo.com": Domain.NINTENDO_COM,
  "play.google.com": Domain.PLAY_GOOGLE_COM,
  "store.playstation.com": Domain.STORE_PLAYSTATION_COM,
  "store.steampowered.com": Domain.STORE_STEAMPOWERED_COM
});

enum Language { ENG }

final languageValues = EnumValues({"eng": Language.ENG});

class ParentPlatform {
  EsrbRating? platform;

  ParentPlatform({
    required this.platform,
  });

  factory ParentPlatform.fromJson(Map<String, dynamic> json) => ParentPlatform(
        platform: json["platform"] != null
            ? EsrbRating.fromJson(json["platform"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "platform": platform != null ? platform!.toJson() : null,
      };
}

class PlatformElement {
  PlatformPlatform? platform;
  DateTime? releasedAt;
  Requirements? requirementsEn;
  Requirements? requirementsRu;

  PlatformElement({
    required this.platform,
    required this.releasedAt,
    required this.requirementsEn,
    required this.requirementsRu,
  });

  factory PlatformElement.fromJson(Map<String, dynamic> json) =>
      PlatformElement(
        platform: json["platform"] != null
            ? PlatformPlatform.fromJson(json["platform"])
            : null,
        releasedAt: json["released_at"] != null
            ? DateTime.parse(json["released_at"])
            : null,
        requirementsEn: json["requirements_en"] != null
            ? Requirements.fromJson(json["requirements_en"])
            : null,
        requirementsRu: json["requirements_ru"] != null
            ? Requirements.fromJson(json["requirements_ru"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "platform": platform != null ? platform!.toJson() : null,
        "released_at": releasedAt != null
            ? "${releasedAt!.year.toString().padLeft(4, '0')}-${releasedAt!.month.toString().padLeft(2, '0')}-${releasedAt!.day.toString().padLeft(2, '0')}"
            : null,
        "requirements_en":
            requirementsEn != null ? requirementsEn!.toJson() : null,
        "requirements_ru":
            requirementsRu != null ? requirementsRu!.toJson() : null,
      };
}

class PlatformPlatform {
  int? id;
  String? name;
  String? slug;
  dynamic image;
  dynamic yearEnd;
  int? yearStart;
  int? gamesCount;
  String? imageBackground;

  PlatformPlatform({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    required this.yearEnd,
    required this.yearStart,
    required this.gamesCount,
    required this.imageBackground,
  });

  factory PlatformPlatform.fromJson(Map<String, dynamic> json) =>
      PlatformPlatform(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        image: json["image"],
        yearEnd: json["year_end"],
        yearStart: json["year_start"],
        gamesCount: json["games_count"],
        imageBackground: json["image_background"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "image": image,
        "year_end": yearEnd,
        "year_start": yearStart,
        "games_count": gamesCount,
        "image_background": imageBackground,
      };
}

class Requirements {
  String? minimum;
  String? recommended;

  Requirements({
    required this.minimum,
    this.recommended,
  });

  factory Requirements.fromJson(Map<String, dynamic> json) => Requirements(
        minimum: json["minimum"],
        recommended: json["recommended"],
      );

  Map<String, dynamic> toJson() => {
        "minimum": minimum,
        "recommended": recommended,
      };
}

class Rating {
  int? id;
  Title? title;
  int? count;
  double? percent;

  Rating({
    required this.id,
    required this.title,
    required this.count,
    required this.percent,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        id: json["id"],
        title: json["title"] != null ? titleValues.map[json["title"]] : null,
        count: json["count"],
        percent: json["percent"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title != null ? titleValues.reverse[title!] : null,
        "count": count,
        "percent": percent,
      };
}

enum Title { EXCEPTIONAL, MEH, RECOMMENDED, SKIP }

final titleValues = EnumValues({
  "exceptional": Title.EXCEPTIONAL,
  "meh": Title.MEH,
  "recommended": Title.RECOMMENDED,
  "skip": Title.SKIP
});

class ShortScreenshot {
  int? id;
  String? image;

  ShortScreenshot({
    required this.id,
    required this.image,
  });

  factory ShortScreenshot.fromJson(Map<String, dynamic> json) =>
      ShortScreenshot(
        id: json["id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
      };
}

class Store {
  int? id;
  Genre? store;

  Store({
    required this.id,
    required this.store,
  });

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        id: json["id"],
        store: json["store"] != null ? Genre.fromJson(json["store"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "store": store != null ? store!.toJson() : null,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

extension GamesExtension on Games {
  String getGameNameOrLoading(Games gameById, int id) {
    return gameById.id == id ? gameById.name ?? 'Loading..' : 'Loading..';
  }
}
