import 'package:app_rick_and_morty/models/details_personagens.dart';
import 'package:flutter/material.dart';
import 'package:app_rick_and_morty/repositories/personagens_repository.dart';

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
