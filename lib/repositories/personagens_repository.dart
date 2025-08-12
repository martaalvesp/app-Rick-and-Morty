import 'package:app_rick_and_morty/models/details_episode.dart';
import 'package:app_rick_and_morty/models/details_personagens.dart';
import 'package:dio/dio.dart';
import 'package:app_rick_and_morty/models/personagens_list.dart';

abstract class PersonagensRepository {
  static final dio = Dio(
    BaseOptions(baseUrl: 'https://rickandmortyapi.com/api'),
  );

  static Future<PersonagemListModel> getUpcomingPersonagens() async {
    final reponse = await dio.get('/character');
    return PersonagemListModel.fromMap(reponse.data);
  } 

    static Future<DetailsPersonagensModel> getDetalhesPersonagens(characterId) async {
    final reponse = await dio.get('/character/$characterId');
    return DetailsPersonagensModel.fromMap(reponse.data);
  } 

   static Future<DetailsEpisodeModel> getDetalhesEpisode(episodeId) async {
    final reponse = await dio.get('/episode/$episodeId');
    return DetailsEpisodeModel.fromMap(reponse.data);
  } 

}
