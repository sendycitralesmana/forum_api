// To parse this JSON data, do
//
//     final feedModel = feedModelFromJson(jsonString);

import 'dart:convert';

FeedModel feedModelFromJson(String str) => FeedModel.fromJson(json.decode(str));

String feedModelToJson(FeedModel data) => json.encode(data.toJson());

class FeedModel {
    int id;
    int userId;
    String content;
    DateTime createdAt;
    DateTime updatedAt;
    bool liked;
    User user;

    FeedModel({
        required this.id,
        required this.userId,
        required this.content,
        required this.createdAt,
        required this.updatedAt,
        required this.liked,
        required this.user,
    });

    factory FeedModel.fromJson(Map<String, dynamic> json) => FeedModel(
        id: json["id"],
        userId: json["user_id"],
        content: json["content"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        liked: json["liked"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "content": content,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "liked": liked,
        "user": user.toJson(),
    };
}

class User {
    int id;
    String name;
    String email;
    dynamic emailVerifiedAt;
    DateTime createdAt;
    DateTime updatedAt;

    User({
        required this.id,
        required this.name,
        required this.email,
        required this.emailVerifiedAt,
        required this.createdAt,
        required this.updatedAt,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
