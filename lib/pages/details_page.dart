import 'package:app_rick_and_morty/componentes/detailed_personagem_card.dart';
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

  @override
  void initState() {
    super.initState();
    characterDetails = PersonagensRepository.getDetalhesPersonagens(
      widget.characterId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarComponent(context, isSecondPage: true),
      backgroundColor: AppColors.backgroundColor,
      body: FutureBuilder<DetailsPersonagensModel>(
        future: characterDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Erro: ${snapshot.error}',
                style: const TextStyle(color: Colors.white),
              ),
            );
          }
          if (!snapshot.hasData) {
            return const Center(
              child: Text(
                'Nenhum dado encontrado',
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          final personagem = snapshot.data!;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: DetailedPersonagemCard(detailsPersonagensModel: personagem),
          );
        },
      ),
    );
  }
}















/*
class DetailsPage extends StatefulWidget {
  static const routeId = '/details';
  const DetailsPage({super.key, required this.characterId});

  final int characterId;

  @override
  DetailsPageState createState() => DetailsPageState();
}

class DetailsPageState extends State<DetailsPage> {
  Future<DetailsPersonagensModel>? characterDetails;

  @override
  void initState() {
    characterDetails = PersonagensRepository.getDetalhesPersonagens(
      widget.characterId,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Character Details')),
      body: FutureBuilder(
        future: characterDetails,
        builder: (context, AsyncSnapshot<DetailsPersonagensModel> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final character = snapshot.data;
            return ListView(
              children: [
                Image.network(character?.image ?? ''),
                Text('Name: ${character?.name ?? 'Unknown'}'),
                Text('Status: ${character?.status ?? 'Unknown'}'),
                Text('Species: ${character?.species ?? 'Unknown'}'),
              ],
            );
          }
        },
      ),
    );
  }
}
*/