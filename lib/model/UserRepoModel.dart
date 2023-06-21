import 'dart:convert';

class Repository {
  String name;
  String full_name; // full_name
  String? description;
  String created_at;
  int size;
  String? language;
  String default_branch;
  RepoOwner owner;
  Repository({
    required this.name,
    required this.full_name,
    this.description,
    required this.created_at,
    required this.size,
    this.language,
    required this.default_branch,
    required this.owner,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'full_name': full_name,
      'description': description,
      'created_at': created_at,
      'size': size,
      'language': language,
      'default_branch': default_branch,
      'owner': owner.toMap(),
    };
  }

  factory Repository.fromMap(Map<String, dynamic> map) {
    return Repository(
      name: map['name'] ?? '',
      full_name: map['full_name'] ?? '',
      description: map['description'],
      created_at: map['created_at'] ?? '',
      size: map['size']?.toInt() ?? 0,
      language: map['language'],
      default_branch: map['default_branch'] ?? '',
      owner: RepoOwner.fromMap(map['owner']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Repository.fromJson(String source) =>
      Repository.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Repository(name: $name, full_name: $full_name, description: $description, created_at: $created_at, size: $size, language: $language, default_branch: $default_branch, owner: $owner)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Repository &&
        other.name == name &&
        other.full_name == full_name &&
        other.description == description &&
        other.created_at == created_at &&
        other.size == size &&
        other.language == language &&
        other.default_branch == default_branch &&
        other.owner == owner;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        full_name.hashCode ^
        description.hashCode ^
        created_at.hashCode ^
        size.hashCode ^
        language.hashCode ^
        default_branch.hashCode ^
        owner.hashCode;
  }
}

//  sub classes of Repository
class RepoOwner {
  String login;
  String url;
  String htmlUrl; // html_url
  String avatarUrl; // avatar_url
  RepoOwner({
    required this.login,
    required this.url,
    required this.htmlUrl,
    required this.avatarUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'login': login,
      'url': url,
      'html_url': htmlUrl,
      'avatar_url': avatarUrl,
    };
  }

  factory RepoOwner.fromMap(Map<String, dynamic> map) {
    return RepoOwner(
      login: map['login'] ?? '',
      url: map['url'] ?? '',
      htmlUrl: map['html_url'] ?? '',
      avatarUrl: map['avatar_url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RepoOwner.fromJson(String source) =>
      RepoOwner.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RepoOwner(login: $login, url: $url, htmlUrl: $htmlUrl, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RepoOwner &&
        other.login == login &&
        other.url == url &&
        other.htmlUrl == htmlUrl &&
        other.avatarUrl == avatarUrl;
  }

  @override
  int get hashCode {
    return login.hashCode ^
        url.hashCode ^
        htmlUrl.hashCode ^
        avatarUrl.hashCode;
  }
}
