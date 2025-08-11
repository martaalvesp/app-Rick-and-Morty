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

  @override
  initState() {
    personagensList = PersonagensRepository.getUpcomingPersonagens();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarComponent(context),
      backgroundColor: AppColors.backgroundColor,
      body: FutureBuilder(
        future: personagensList,
        builder: (context, snapshot) {
          // if (snapshot.connectionState == ConnectionState.waiting) {
          //   return const Center(child: CircularProgressIndicator());
          // } else if (snapshot.hasError) {
          //   return Center(child: Text('Error: ${snapshot.error}'));
          // } else {
          //if (snapshot.hasData) {
          final dataResults = snapshot.data!.results;

          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 7.5),
            itemCount: dataResults.length,
            itemBuilder: (context, index) {
              return PersonagemCard(
                personagem: dataResults[index],
                onTap: () {
                  Navigator.of(context).pushNamed(
                    DetailsPage.routeId,
                    arguments: dataResults[index].id,
                  );
                },
              );
              //   final character = data['results'][index];
              //   return ListTile(
              //     title: Text(character['name']),
              //     leading: Image.network(character['image']),
              //   );
            },
          );
        },
      ),
    );
  }
}


// import 'package:app_rick_and_morty/componentes/app_bar_components.dart';
// import 'package:app_rick_and_morty/componentes/personagem_card.dart';
// import 'package:app_rick_and_morty/models/personagens_list.dart';
// import 'package:app_rick_and_morty/pages/details_page.dart'; // Importe sua DetailsPage aqui
// import 'package:app_rick_and_morty/theme/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:app_rick_and_morty/repositories/personagens_repository.dart';

// class HomePage extends StatefulWidget {
//   static const String routeId = '/';
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   Future<PersonagensListModel>? futurePersonagens;

// @override
// void initState() {
//   super.initState();
//   futurePersonagens = PersonagensRepository.getUpcomingPersonagens();
// }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: appBarComponent(context),
//       backgroundColor: AppColors.backgroundColor,
//       body: FutureBuilder<PersonagensListModel>(
//   future: futurePersonagens,
//   builder: (context, snapshot) {
//     if (snapshot.hasData) {
//       final dataResults = snapshot.data!.results;
//       return ListView.builder(
//         padding: const EdgeInsets.symmetric(vertical: 7.5),
//         itemCount: dataResults.length,
//         itemBuilder: (context, index) {
//           return PersonagemCard(
//             personagem: dataResults[index],
//             onTap: () {
//               Navigator.of(context).pushNamed(
//                 DetailsPage.routeId,
//                 arguments: dataResults[index].id,
//               );
//             },
//             result: dataResults[index],
//           );
//         },
//       );
//     } else if (snapshot.hasError) {
//   return Center(
//     child: Text(
//       'Erro: ${snapshot.error}',
//       style: const TextStyle(color: Colors.white),
//     ),
//   );
// }
//  else {
//       return const Center(child: CircularProgressIndicator());
//     }
//   },
// )
//     );
//   }
// }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Rick & Morty Characters'),
// //         backgroundColor: AppColors.appBarColor,
// //       ),
// //       backgroundColor: AppColors.backgroundColor,
// //       body: FutureBuilder<PersonagensListModel>(
// //         future: futurePersonagens,
// //         builder: (context, snapshot) {
// //           if (snapshot.connectionState == ConnectionState.waiting) {
// //             return const Center(child: CircularProgressIndicator());
// //           } else if (snapshot.hasError) {
// //             return Center(
// //               child: Text(
// //                 'Ops, aconteceu um erro',
// //                 style: const TextStyle(color: Colors.white),
// //               ),
// //             );
// //           } else if (!snapshot.hasData || snapshot.data!.results.isEmpty) {
// //             return const Center(
// //               child: Text(
// //                 'Nenhum personagem encontrado',
// //                 style: TextStyle(color: Colors.white),
// //               ),
// //             );
// //           } else {
// //             final data = snapshot.data!;
// //             return ListView.builder(
// //               padding: const EdgeInsets.symmetric(horizontal: 8.0),
// //               itemCount: data.results.length,
// //               itemBuilder: (context, index) {
// //                 final personagem = data.results[index];
// //                 return PersonagemCard(
// //                   personagem: personagem,
// //                   onTap: () {
// //                     Navigator.of(
// //                       context,
// //                     ).pushNamed(DetailsPage.routeId, arguments: personagem.id);
// //                   },
// //                   result: personagem,
// //                 );
// //               },
// //             );
// //           }
// //         },
// //       ),
// //     );
// //   }
// // }


// // // import 'package:app_rick_and_morty/models/details_personagens.dart';
// // import 'package:app_rick_and_morty/componentes/personagem_card.dart';
// // import 'package:app_rick_and_morty/models/personagens_list.dart';
// // import 'package:app_rick_and_morty/theme/app_colors.dart';
// // import 'package:flutter/material.dart';
// // import 'package:app_rick_and_morty/repositories/personagens_repository.dart';

// // class HomePage extends StatefulWidget {
// //   static const String routeId = '/';

// //   const HomePage({super.key});

  
// //   State<HomePage> createState() => _HomePageState();
// // }
// // class _HomePageState extends State<HomePage> {
// //   Future<PersonagensListModel>? futurePersonagens;
  
// //   @override
// //   void initState()  {
// //     futurePersonagens = PersonagensRepository.getUpcomingPersonagens();
// //     super.initState();
// //    }
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: appBarComponent(context),
// //       backgroundColor: AppColors.backgroundColor,
// //       body: Center(
// //         child: 
// //       FutureBuilder<PersonagensListModel>(future: futurePersonagens, builder: (context, snapshot) {
// //         if (snapshot.hasData){
// //             final data = snapshot.data;
// //             if(data == null){
// //               return Text('Nenhum personagem encontrado', style: TextStyle(color: AppColors.white),
// //               );
// //             }
// //             return ListView.builder(
// //               padding: EdgeInsets.symmetric(horizontal: 8.0),
// //               itemCount: data.results.length, //está pegando o tamanho da lista de personagens
// //               itemBuilder: (context, index){
// //                 return PersonagemCard(
// //                   Personagem: data.results[index],
// //                   OnTap: () {
// //                     Navigator.of(context).pushNamed(
// //                       DetailsPage.routeId,
// //                       arguments: data.results[index].id,
// //                   );
// //                 },
// //               );
// //             },
// //             );
// //         }
// //         if (snapshot.hasError){
// //           return Text('Ops, aconteceu um erro', style: TextStyle(color: AppColors.white),);
// //         }
// //          return CircularProgressIndicator(); 
// //       }),
// //     ),
// //       );
// //   }
         
// //       //     final personagens = snapshot.data!.results;
// //       //     return ListView.builder(
// //       //       itemCount: personagens.length,
// //       //       itemBuilder: (context, index) {
// //       //         final personagem = personagens[index];
// //       //         return ListTile(
// //       //           leading: Image.network(personagem.image),
// //       //           title: Text(personagem.name),
// //       //           subtitle: Text('Status: ${personagem.status}'),
// //       //           onTap: () {
// //       //             Navigator.pushNamed(
// //       //               context,
// //       //               '/details',
// //       //               arguments: DetailsPersonagensModel(
// //       //                 id: personagem.id,
// //       //                 name: personagem.name,
// //       //                 status: personagem.status,
// //       //                 species: personagem.species,
// //       //                 type: personagem.type,
// //       // })
// //       // );
// //   }
// // }
// //   appBarComponent(BuildContext context) {}

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: const Text('Rick & Morty Characters')),
// //       body: FutureBuilder(
// //         future: PersonagensRepository.dio.get('/character'),
// //         builder: (context, snapshot) {
// //           if (snapshot.connectionState == ConnectionState.waiting) {
// //             return const Center(child: CircularProgressIndicator());
// //           } else if (snapshot.hasError) {
// //             return Center(child: Text('Error: ${snapshot.error}'));
// //           } else {
// //             final data = snapshot.data?.data;
// //             return ListView.builder(
// //               itemCount: data['results'].length,
// //               itemBuilder: (context, index) {
// //                 final character = data['results'][index];
// //                 return ListTile(
// //                   title: Text(character['name']),
// //                   subtitle: Text('Status: ${character['status']}'),
// //                   leading: Image.network(character['image']),
// //                 );
// //               },
// //             );
// //           }
// //         },
// //       ),
// //     );
// //   }
// // }

// // extension on Object? {
// //   get data => null;
// // }
