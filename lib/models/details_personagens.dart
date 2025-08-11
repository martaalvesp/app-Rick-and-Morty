import 'dart:convert';
// import 'package:app_rick_and_morty/models/personagens_list.dart';
import 'package:collection/collection.dart';
import 'package:flutter/src/material/chip.dart';

class DetailsPersonagensModel {
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

  static String overview = '';

  DetailsPersonagensModel({
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

  DetailsPersonagensModel copyWith({
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
    return DetailsPersonagensModel(
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
    return <String, dynamic>{
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

  factory DetailsPersonagensModel.fromMap(Map<String, dynamic> map) {
    return DetailsPersonagensModel(
      id: map['id'].toInt() as int,
      name: map['name'] as String,
      status: map['status'] as String,
      species: map['species'] as String,
      type: map['type'] as String,
      gender: map['gender'] as String,
      origin: Origin.fromMap(map['origin'] as Map<String, dynamic>),
      location: Location.fromMap(map['location'] as Map<String, dynamic>),
      image: map['image'] as String,
      episode: map['episode'] != null
          ? List<String>.from((map['episode'] as List).map((e) => e.toString()))
          : <String>[],
      //List<String>.from((map['episode'] as List<String>)),
      url: map['url'] as String,
      created: map['created'] as String,
    );
  }

  // url: '', created: ''

  String toJson() => json.encode(toMap());

  factory DetailsPersonagensModel.fromJson(String source) =>
      DetailsPersonagensModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() {
    return 'DetailsPersonagensModel(id: $id, name: $name, status: $status, species: $species, type: $type, gender: $gender, origin: $origin, location: $location, image: $image, episode: $episode, url: $url, created: $created)';
  }

  @override
  bool operator ==(covariant DetailsPersonagensModel other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.id == id &&
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

  String? get releaseDate => null;
}

class Origin {
  final String name;
  final String url;
  Origin({required this.name, required this.url});

  Origin copyWith({String? name, String? url}) {
    return Origin(name: name ?? this.name, url: url ?? this.url);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'name': name, 'url': url};
  }

  factory Origin.fromMap(Map<String, dynamic> map) {
    return Origin(name: map['name'] as String, url: map['url'] as String);
  }

  String toJson() => json.encode(toMap());

  factory Origin.fromJson(String source) =>
      Origin.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Origin(name: $name, url: $url)';

  @override
  bool operator ==(covariant Origin other) {
    if (identical(this, other)) return true;

    return other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;

  map(Chip Function(dynamic origin) param0) {}
}

class Location {
  final String name;
  final String url;
  Location({required this.name, required this.url});

  Location copyWith({String? name, String? url}) {
    return Location(name: name ?? this.name, url: url ?? this.url);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'name': name, 'url': url};
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(name: map['name'] as String, url: map['url'] as String);
  }

  String toJson() => json.encode(toMap());

  factory Location.fromJson(String source) =>
      Location.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Location(name: $name, url: $url)';

  @override
  bool operator ==(covariant Location other) {
    if (identical(this, other)) return true;

    return other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}
