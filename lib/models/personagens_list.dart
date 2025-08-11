import 'dart:convert';
import 'package:flutter/foundation.dart';

class PersonagemListModel {
  final Info info;
  final List<Result> results;

  PersonagemListModel({
    required this.info,
    required this.results,
  });

  PersonagemListModel copyWith({
    Info? info,
    List<Result>? results,
  }) {
    return PersonagemListModel(
      info: info ?? this.info,
      results: results ?? this.results,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'info': info.toMap(),
      'results': results.map((x) => x.toMap()).toList(),
    };
  }

  factory PersonagemListModel.fromMap(Map<String, dynamic> map) {
    return PersonagemListModel(
      info: Info.fromMap(map['info']),
      results: List<Result>.from(
        (map['results'] as List).map((x) => Result.fromMap(x)),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory PersonagemListModel.fromJson(String source) =>
      PersonagemListModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'PersonagemListModel(info: $info, results: $results)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PersonagemListModel &&
        other.info == info &&
        listEquals(other.results, results);
  }

  @override
  int get hashCode => info.hashCode ^ results.hashCode;
}


class Info {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  Info({
    required this.count,
    required this.pages,
    this.next,
    this.prev,
  });

  Info copyWith({
    int? count,
    int? pages,
    String? next,
    String? prev,
  }) {
    return Info(
      count: count ?? this.count,
      pages: pages ?? this.pages,
      next: next ?? this.next,
      prev: prev ?? this.prev,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'count': count,
      'pages': pages,
      'next': next,
      'prev': prev,
    };
  }

  factory Info.fromMap(Map<String, dynamic> map) {
    return Info(
      count: map['count'],
      pages: map['pages'],
      next: map['next'],
      prev: map['prev'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Info.fromJson(String source) => Info.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Info(count: $count, pages: $pages, next: $next, prev: $prev)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Info &&
        other.count == count &&
        other.pages == pages &&
        other.next == next &&
        other.prev == prev;
  }

  @override
  int get hashCode =>
      count.hashCode ^ pages.hashCode ^ next.hashCode ^ prev.hashCode;
}

class Result {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final Origin origin;
  final Location location;
  final String image;
  final List<String> episode;
  final String url;
  final String created;

  Result({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  Result copyWith({
    int? id,
    String? name,
    String? status,
    String? species,
    String? type,
    String? gender,
    Origin? origin,
    Location? location,
    String? image,
    List<String>? episode,
    String? url,
    String? created,
  }) {
    return Result(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
      species: species ?? this.species,
      type: type ?? this.type,
      gender: gender ?? this.gender,
      origin: origin ?? this.origin,
      location: location ?? this.location,
      image: image ?? this.image,
      episode: episode ?? this.episode,
      url: url ?? this.url,
      created: created ?? this.created,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'species': species,
      'type': type,
      'gender': gender,
      'origin': origin.toMap(),
      'location': location.toMap(),
      'image': image,
      'episode': episode,
      'url': url,
      'created': created,
    };
  }

  factory Result.fromMap(Map<String, dynamic> map) {
    return Result(
      id: map['id'],
      name: map['name'],
      status: map['status'],
      species: map['species'],
      type: map['type'],
      gender: map['gender'],
      origin: Origin.fromMap(map['origin']),
      location: Location.fromMap(map['location']),
      image: map['image'],
      episode: List<String>.from(map['episode']),
      url: map['url'],
      created: map['created'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Result.fromJson(String source) =>
      Result.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Result(id: $id, name: $name, status: $status, species: $species, type: $type, gender: $gender, origin: $origin, location: $location, image: $image, episode: $episode, url: $url, created: $created)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Result &&
        other.id == id &&
        other.name == name &&
        other.status == status &&
        other.species == species &&
        other.type == type &&
        other.gender == gender &&
        other.origin == origin &&
        other.location == location &&
        other.image == image &&
        listEquals(other.episode, episode) &&
        other.url == url &&
        other.created == created;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        status.hashCode ^
        species.hashCode ^
        type.hashCode ^
        gender.hashCode ^
        origin.hashCode ^
        location.hashCode ^
        image.hashCode ^
        episode.hashCode ^
        url.hashCode ^
        created.hashCode;
  }
}

class Origin {
  final String name;
  final String url;

  Origin({
    required this.name,
    required this.url,
  });

  Origin copyWith({
    String? name,
    String? url,
  }) {
    return Origin(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory Origin.fromMap(Map<String, dynamic> map) {
    return Origin(
      name: map['name'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Origin.fromJson(String source) =>
      Origin.fromMap(json.decode(source));

  @override
  String toString() => 'Origin(name: $name, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Origin && other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}

class Location {
  final String name;
  final String url;

  Location({
    required this.name,
    required this.url,
  });

  Location copyWith({
    String? name,
    String? url,
  }) {
    return Location(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      name: map['name'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Location.fromJson(String source) =>
      Location.fromMap(json.decode(source));

  @override
  String toString() => 'Location(name: $name, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Location && other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}
