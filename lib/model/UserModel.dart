import 'dart:convert';

class User {
  String? name;
  String? username;
  String? email;
  String? bio;
  String? imageUrl;
  String? twitterUsername;
  int? followers;
  int? followings;
  int? publicRepo;
  String? joinedDate;
  User({
    this.name,
    this.username,
    this.email,
    this.bio,
    this.imageUrl,
    this.twitterUsername,
    this.followers,
    this.followings,
    this.publicRepo,
    this.joinedDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'username': username,
      'email': email,
      'bio': bio,
      'imageUrl': imageUrl,
      'twitterUsername': twitterUsername,
      'followers': followers,
      'followings': followings,
      'publicRepo': publicRepo,
      'joinedDate': joinedDate,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'],
      username: map['username'],
      email: map['email'],
      bio: map['bio'],
      imageUrl: map['imageUrl'],
      twitterUsername: map['twitterUsername'],
      followers: map['followers']?.toInt(),
      followings: map['followings']?.toInt(),
      publicRepo: map['publicRepo']?.toInt(),
      joinedDate: map['joinedDate'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(name: $name, username: $username, email: $email, bio: $bio, imageUrl: $imageUrl, twitterUsername: $twitterUsername, followers: $followers, followings: $followings, publicRepo: $publicRepo, joinedDate: $joinedDate)';
  }
}
