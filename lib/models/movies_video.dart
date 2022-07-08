class MoviesVideo {
  int? id;
  List<Video>? results;

  MoviesVideo({this.id, this.results});

  MoviesVideo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['results'] != null) {
      results = <Video>[];
      json['results'].forEach((v) {
        results!.add(Video.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Video {
  String? iso6391;
  String? iso31661;
  String? name;
  String? key;
  String? publishedAt;
  String? site;
  int? size;
  String? type;
  bool? official;
  String? id;

  Video(
      {this.iso6391,
      this.iso31661,
      this.name,
      this.key,
      this.publishedAt,
      this.site,
      this.size,
      this.type,
      this.official,
      this.id});

  Video.fromJson(Map<String, dynamic> json) {
    iso6391 = json['iso_639_1'];
    iso31661 = json['iso_3166_1'];
    name = json['name'];
    key = json['key'];
    publishedAt = json['published_at'];
    site = json['site'];
    size = json['size'];
    type = json['type'];
    official = json['official'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['iso_639_1'] = iso6391;
    data['iso_3166_1'] = iso31661;
    data['name'] = name;
    data['key'] = key;
    data['published_at'] = publishedAt;
    data['site'] = site;
    data['size'] = size;
    data['type'] = type;
    data['official'] = official;
    data['id'] = id;
    return data;
  }
}