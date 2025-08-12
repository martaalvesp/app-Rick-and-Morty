import 'dart:convert';
import 'package:flutter/foundation.dart';

class DetailsEpisodeModel {
  final int id;
  final String name;
  final String air_date;
  final String episode;
  final List<String> characters;
  final String url;
  final String created;

  DetailsEpisodeModel({
    required this.id,
    required this.name,
    required this.air_date,
    required this.episode,
    required this.characters,
    required this.url,
    required this.created,
  });

  DetailsEpisodeModel copyWith({
    int? id,
    String? name,
    String? air_date,
    String? episode,
    List<String>? characters,
    String? url,
    String? created,
  }) {
    return DetailsEpisodeModel(
      id: id ?? this.id,
      name: name ?? this.name,
      air_date: air_date ?? this.air_date,
      episode: episode ?? this.episode,
      characters: characters ?? this.characters,
      url: url ?? this.url,
      created: created ?? this.created,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'air_date': air_date,
      'episode': episode,
      'characters': characters,
      'url': url,
      'created': created,
    };
  }

  factory DetailsEpisodeModel.fromMap(Map<String, dynamic> map) {
    return DetailsEpisodeModel(
      id: map['id'] as int,
      name: map['name'] as String,
      air_date: map['air_date'] as String,
      episode: map['episode'] as String,
      characters: List<String>.from(map['characters'] as List),
      url: map['url'] as String,
      created: map['created'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DetailsEpisodeModel.fromJson(String source) =>
      DetailsEpisodeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DetailsEpisodeModel(id: $id, name: $name, air_date: $air_date, episode: $episode, characters: $characters, url: $url, created: $created)';
  }

  @override
  bool operator ==(covariant DetailsEpisodeModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.air_date == air_date &&
        other.episode == episode &&
        listEquals(other.characters, characters) &&
        other.url == url &&
        other.created == created;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        air_date.hashCode ^
        episode.hashCode ^
        characters.hashCode ^
        url.hashCode ^
        created.hashCode;
  }
}
