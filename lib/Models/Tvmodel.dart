import 'dart:convert';

class TvshowModel {
  int id;
  String name;
  List<String> genres;
  String language;
  String type;
  Rating rating;
  TVImage image;

  TvshowModel({
    required this.id,
    required this.name,
    required this.genres,
    required this.language,
    required this.type,
    required this.rating,
    required this.image,
  });

  factory TvshowModel.fromJson(Map<String, dynamic> json) => TvshowModel(
        id: json["id"],
        name: json["name"],
        genres: List<String>.from(json["genres"]),
        language: json["language"],
        type: json["type"],
        rating: Rating.fromJson(json["rating"]),
        image: TVImage.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "genres": genres,
        "language": language,
        "type": type,
        "rating": rating.toJson(),
        "image": image.toJson(),
      };
}

class Rating {
  double? average;

  Rating({this.average});

  factory Rating.fromJson(Map<String, dynamic> json) =>
      Rating(average: json["average"]?.toDouble());

  Map<String, dynamic> toJson() => {"average": average};
}

class TVImage {
  String medium;
  String original;

  TVImage({required this.medium, required this.original});

  factory TVImage.fromJson(Map<String, dynamic> json) =>
      TVImage(medium: json["medium"], original: json["original"]);

  Map<String, dynamic> toJson() => {"medium": medium, "original": original};
}

List<TvshowModel> tvshowModelFromJson(String str) =>
    List<TvshowModel>.from(json.decode(str).map((x) => TvshowModel.fromJson(x)));

String tvshowModelToJson(List<TvshowModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
