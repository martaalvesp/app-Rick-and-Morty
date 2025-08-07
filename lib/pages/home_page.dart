import 'package:flutter/material.dart';
import 'package:app_rick_and_morty/repositories/personagens_repository.dart';


class HomePage extends StatelessWidget {
  static const String routeId = '/';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rick & Morty Characters'),
      ),
      body: FutureBuilder(
        future: PersonagensRepository.dio.get('/character'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final data = snapshot.data?.data;
            return ListView.builder(
              itemCount: data['results'].length,
              itemBuilder: (context, index) {
                final character = data['results'][index];
                return ListTile(
                  title: Text(character['name']),
                  leading: Image.network(character['image']),
                );
              },
            );
          }
        },
      ),
    );
  }
}

extension on Object? {
   get data => null;
}