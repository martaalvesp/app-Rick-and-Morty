import 'package:app_rick_and_morty/componentes/app_bar_components.dart';
import 'package:app_rick_and_morty/componentes/personagem_card.dart';
import 'package:app_rick_and_morty/models/personagens_list.dart';
import 'package:app_rick_and_morty/pages/details_page.dart';
import 'package:app_rick_and_morty/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:app_rick_and_morty/repositories/personagens_repository.dart';

class HomePage extends StatefulWidget {
  static const String routeId = '/';
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Future<PersonagemListModel>? personagensList;
  String searchText = '';

  @override
  void initState() {
    super.initState();
    personagensList = PersonagensRepository.getUpcomingPersonagens();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarComponent(context),
      backgroundColor: AppColors.backgroundColor,
      body: FutureBuilder<PersonagemListModel>(
        future: personagensList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('Nenhum dado encontrado'));
          }

          final dataResults = snapshot.data!.results;

          final filtered = dataResults
              .where(
                (p) => p.name.toLowerCase().contains(searchText.toLowerCase()),
              )
              .toList();

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Pesquisar...',
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: (value) {
                    setState(() {
                      searchText = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 7.5),
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    return PersonagemCard(
                      personagem: filtered[index],
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          DetailsPage.routeId,
                          arguments: filtered[index].id,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
