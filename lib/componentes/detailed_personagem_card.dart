import 'package:flutter/material.dart';
import 'package:app_rick_and_morty/models/details_personagens.dart';
import 'package:app_rick_and_morty/theme/app_colors.dart';

class DetailedPersonagemCard extends StatelessWidget {
  final DetailsPersonagensModel detailsPersonagensModel;

  const DetailedPersonagemCard({
    super.key,
    required this.detailsPersonagensModel,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primaryColorLight,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(
              detailsPersonagensModel.image,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  detailsPersonagensModel.name.toUpperCase(),
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  "Status: ${detailsPersonagensModel.status}",
                  style: TextStyle(color: AppColors.white),
                ),
                Text(
                  "Espécie: ${detailsPersonagensModel.species}",
                  style: TextStyle(color: AppColors.white),
                ),
                if (detailsPersonagensModel.type.isNotEmpty)
                  Text(
                    "Tipo: ${detailsPersonagensModel.type}",
                    style: TextStyle(color: AppColors.white),
                  ),
                Text(
                  "Origem: ${detailsPersonagensModel.origin.name}",
                  style: TextStyle(color: AppColors.white),
                ),
                Text(
                  "Localização: ${detailsPersonagensModel.location.name}",
                  style: TextStyle(color: AppColors.white),
                ),
                const SizedBox(height: 16),
                Text(
                  "Episódios em que aparece:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: detailsPersonagensModel.episode
                      .map(
                        (ep) => Chip(
                          backgroundColor: AppColors.primaryColorLight,
                          labelStyle: TextStyle(color: AppColors.white),
                          side: BorderSide(color: AppColors.white),
                          label: Text(ep),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}












/*
class DetailedPersonagemCard extends StatelessWidget {
  const DetailedPersonagemCard({
    required this.detailsPersonagensModel,
    super.key,
  });
  final DetailsPersonagensModel detailsPersonagensModel;
  // static String overview = '';

  // String? get data => null;

  @override
  Widget build(BuildContext context) {
    final date = DateTime.parse(
      detailsPersonagensModel.episode.isNotEmpty
          ? detailsPersonagensModel.episode.first
          : DateTime.now().toIso8601String(),
    );

    final companNames = detailsPersonagensModel.episode.map((compan) => compan);

    final allCompanies = companNames.reduce(
      (value, element) => value + ',' + element
    );

    return Card(
      color: AppColors.primaryColorLight,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 7.5),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 12,
              left: 16,
              right: 16,
              bottom: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${detailsPersonagensModel.name.toUpperCase()} (${date.year})",
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 14.5,
                  ),
                ),
                const SizedBox(height: 15),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  // children: detailsPersonagensModel.status
                      // .map(
                      //   (status) => Chip(
                      //     backgroundColor: AppColors.primaryColorLight,
                      //     labelStyle: TextStyle(color: AppColors.white),
                      //     side: BorderSide(color: AppColors.white),
                      //     label: Text(status.name),
                      //   ),
                      // )
                      // .toList(),

                  // Chip(
                  //   backgroundColor: AppColors.primaryColorLight,
                  //   labelStyle: TextStyle(color: AppColors.white),
                  //   side: BorderSide(color: AppColors.white),
                  //   label: Text(detailsPersonagensModel.status.toString()),
                  // ),
                ),
                const SizedBox(height: 15),
                Text(
                  DetailsPersonagensModel.overview,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.5,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'Production Companies:',
                  style: TextStyle(fontSize: 12.5, color: AppColors.white),
                ),
                Text(
                  allCompanies,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.5,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


//                 const SizedBox(height: 15.0),
//                 Wrap(
//                   spacing: 10.0, 
//                   runSpacing: 10.0,
//   children: [
//     Chip(
//       label: Text(detailsPersonagensModel.origin.toString()),
//       side: BorderSide(color: AppColors.white),
//     ),
//   ],
//                 ),
//                 const SizedBox(height: 15.0),
//                 Text(
//                   DetailsPersonagensModel.overview,
                  
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: AppColors.white,
//                     fontSize: 12.5,
//                   ),
                  
//                 ),
                
//                 ]
//                 ,
//               ),
//             ),
//           ],
//         ),
//     );
// }
// }


// import 'package:app_rick_and_morty/pages/home_page.dart';
// import 'package:app_rick_and_morty/theme/app_colors.dart';
// import 'package:app_rick_and_morty/theme/app_images.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// PreferredSizeWidget appBarComponent(
//   BuildContext context, {
//   bool isSearchEnabled = false,
// }) {
//   final currentRoute = ModalRoute.of(context)?.settings.name;
//   final bool isSecondPage = currentRoute != HomePage.routeId;

//   return AppBar(
//     toolbarHeight: kToolbarHeight * 2.2,
//     backgroundColor: AppColors.appBarColor,
//     systemOverlayStyle: SystemUiOverlayStyle.dark,
//     leading: Align(
//       alignment: Alignment.topCenter,
//       child: GestureDetector(
//         onTap: () {
//           if (currentRoute == HomePage.routeId) return;
//           Navigator.pop(context);
//         },
//         child: Icon(
//           isSecondPage ? Icons.arrow_back : Icons.menu,
//           color: AppColors.white,
//         ),
//       ),
//     ),
//     actions: [
//       Container(
//         alignment: Alignment.topCenter,
//         margin: const EdgeInsets.only(right: 16.0),
//         child: Icon(
//           Icons.person,
//           color: AppColors.white,
//         ),
//       ),
//     ],
//     flexibleSpace: SafeArea(
//       child: Column(
//         children: [
//           Image.asset(AppImages.logo),
//           Padding(
//             padding: const EdgeInsets.only(top: 10.0),
//             child: Text(
//               'RICK AND MORTY',
//               style: TextStyle(
//                 color: AppColors.white,
//                 fontSize: 24.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }


// import 'package:app_rick_and_morty/models/details_personagens.dart';
// import 'package:app_rick_and_morty/theme/app_colors.dart';
// import 'package:flutter/material.dart';

// class DetailedPersonagemCard extends StatelessWidget {
//   const DetailedPersonagemCard({
//     required this.detailspersonagem,
//     super.key});

//     final DetailsPersonagensModel detailspersonagem;

//     @override
//     Widget build(BuildContext context) {
//       final date = DateTime.parse(detailspersonagem.releaseDate);
//       final companNames = detailspersonagens.productionCompanies.map((compan) => company.name);
//       final allCompanies = companNames.reduce((value, element) => value + ',' + element);
//       return Card(
//         color: AppColors.primaryColorLight,
//         clipBehavior: Clip.antiAlias,
//         margin: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 20.0),
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(10.0)),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.network(detailspersonagem.image),
//             Padding(
//               padding: const EdgeInsets.only(top: 12, left: 16, right: 16, bottom: 20),
//               child: Column(
//                 Text(
//                   "${detailspersonagem.name.toUpperCase()} (${date})",
//                   style: TextStyle(
//                     fontSize: 14.5,
//                     fontWeight: FontWeight.w900,
//                     color: AppColors.white,
//                   ),
//                 ),
              
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//               child: Text(
//                 'Companies: $allCompanies',
//                 style: TextStyle(color: AppColors.white),
//               ),
//             ),
//             const SizedBox(height: 15.0),
//             Wrap(
//               spacing: 10.0,
//               runSpacing: 10.0,
//               children: detailspersonagem.species.map((species)
//               => Chip(
//                 label: Text(species),
//                 backgroundColor: AppColors.primaryColorLight,
//                 labelStyle: TextStyle(color: AppColors.white),
//                 side: BorderSide(color: AppColors.white),
//               ),
//               )
//               .toList(),
//         ),
//         const SizedBox(height: 15.0),
//           Text(
//             detailspersonagem.overview,
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               color: AppColors.white,
//               fontSize: 12.5,
//             ),
//           ),
//           const SizedBox(height: 15.0),
//             Text(
//               'Production Companies:',
//               style: TextStyle(
//                 color: AppColors.white,
//                 fontSize: 12.5,
//               ),
//             ),
//             Text(
//               allCompanies,
//               style: TextStyle(
//                 color: AppColors.white,
//                 fontSize: 12.5,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//         ],
//             ),
//       ),
//           ],

//           ),
//         );
// }*/