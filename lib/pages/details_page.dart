import 'package:app_rick_and_morty/componentes/detailed_personagem_card.dart';
import 'package:app_rick_and_morty/models/details_episode.dart';
import 'package:app_rick_and_morty/models/details_personagens.dart';
import 'package:flutter/material.dart';
import 'package:app_rick_and_morty/repositories/personagens_repository.dart';
import 'package:app_rick_and_morty/theme/app_colors.dart';

import '../componentes/app_bar_components.dart';

class DetailsPage extends StatefulWidget {
  static const routeId = '/details';
  final int characterId;

  const DetailsPage({super.key, required this.characterId});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late Future<DetailsPersonagensModel> characterDetails;
  late Future<DetailsEpisodeModel> episodeDetails;

  @override
  void initState() {
    super.initState();

    characterDetails = PersonagensRepository.getDetalhesPersonagens(
      widget.characterId,
    );

    episodeDetails = characterDetails.then((character) {
      final firstEpisodeUrl = character.episode.isNotEmpty
          ? character.episode.first
          : '';

      if (firstEpisodeUrl.isEmpty) {
        throw Exception('Nenhum episódio encontrado');
      }

      final uri = Uri.parse(firstEpisodeUrl);
      final episodeId = uri.pathSegments.last;

      return PersonagensRepository.getDetalhesEpisode(episodeId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarComponent(context, isSecondPage: true),
      backgroundColor: AppColors.backgroundColor,
      body: FutureBuilder<DetailsPersonagensModel>(
        future: characterDetails,
        builder: (context, snapshotChar) {
          if (snapshotChar.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshotChar.hasError) {
            return Center(
              child: Text(
                'Erro: ${snapshotChar.error}',
                style: TextStyle(color: AppColors.white),
              ),
            );
          }
          if (!snapshotChar.hasData) {
            return Center(
              child: Text(
                'Nenhum dado encontrado',
                style: TextStyle(color: AppColors.white),
              ),
            );
          }

          final personagem = snapshotChar.data!;

          return FutureBuilder<DetailsEpisodeModel>(
            future: episodeDetails,
            builder: (context, snapshotEp) {
              if (snapshotEp.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshotEp.hasError) {
                return Center(
                  child: Text(
                    'Erro ao carregar episódio: ${snapshotEp.error}',
                    style: TextStyle(color: AppColors.white),
                  ),
                );
              }

              final episode = snapshotEp.data!;

              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: DetailedPersonagemCard(
                  detailsPersonagensModel: personagem,
                  detailsEpisodeModel: episode,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
