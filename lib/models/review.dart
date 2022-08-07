

class Reviews {
  List<Review>? results;

  Reviews.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Review>[];
      json['results'].forEach((v) {
        results!.add(Review.fromJson(v));
      });
    } 
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =
        <String, dynamic>{};

    if (results != null) {
      data['results'] = results!
          .map((v) => v.toJson())
          .toList();
    }

    return data;
  }
}

class Review {
  String? author;
  AuthorDetails? authorDetails;
  String? content;
  String? createdAt;
  String? id;
  String? updatedAt;
  String? url;

  Review(
      {this.author,
      this.authorDetails,
      this.content,
      this.createdAt,
      this.id,
      this.updatedAt,
      this.url});

  Review.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    authorDetails = json['author_details'] != null
        ? AuthorDetails.fromJson(
            json['author_details'])
        : null;
    content = json['content'];
    createdAt = json['created_at'];
    id = json['id'];
    updatedAt = json['updated_at'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =
        <String, dynamic>{};
    data['author'] = author;
    if (authorDetails != null) {
      data['author_details'] =
          authorDetails!.toJson();
    }
    data['content'] = content;
    data['created_at'] = createdAt;
    data['id'] = id;
    data['updated_at'] = updatedAt;
    data['url'] = url;
    return data;
  }
}

class AuthorDetails {
  String? name;
  String? username;
  String? avatarPath;
  double? rating;

  AuthorDetails(
      {this.name,
      this.username,
      this.avatarPath,
      this.rating});

  AuthorDetails.fromJson(
      Map<String, dynamic> json) {
    name = json['name'];
    username = json['username'];
    avatarPath = json['avatar_path'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =
        <String, dynamic>{};
    data['name'] = name;
    data['username'] = username;
    data['avatar_path'] = avatarPath;
    data['rating'] = rating;
    return data;
  }
}
