import 'package:app_rick_and_morty/models/details_episode.dart';
import 'package:flutter/material.dart';
import 'package:app_rick_and_morty/models/details_personagens.dart';
import 'package:app_rick_and_morty/theme/app_colors.dart';

class DetailedPersonagemCard extends StatelessWidget {
  final DetailsPersonagensModel detailsPersonagensModel;
  final DetailsEpisodeModel detailsEpisodeModel;

  const DetailedPersonagemCard({
    super.key,
    required this.detailsPersonagensModel,
    required this.detailsEpisodeModel,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: AppColors.primaryColorLight,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: SizedBox(
          width: 378,//tamanho indicado no figma
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 378,
                height: 160,
                child: Image.network(
                  detailsPersonagensModel.image,
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
                        fontSize: 14.5,
                        fontFamily: 'Lato ',
                        fontWeight: FontWeight.w900,
                        color: AppColors.white,
                      ),
                    ),

                    const SizedBox(height: 35),
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color:
                                detailsPersonagensModel.status.toLowerCase() ==
                                    "alive"
                                ? Colors.green
                                : Colors.red,
                            border: Border.all(
                              color: AppColors.white,
                              width: 1,
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          "${detailsPersonagensModel.status} - ${detailsPersonagensModel.species} -  ${detailsPersonagensModel.gender}",
                          style: TextStyle(
                            fontFamily: 'Lato ',
                            fontSize: 12.5,

                            color: AppColors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    Text(
                      "Last know location:",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 12.5,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Lato ',
                      ),
                    ),
                    Text(
                      "${detailsPersonagensModel.origin.name} (${detailsPersonagensModel.location.name})",
                      style: TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Lato ',
                        color: AppColors.white,
                      ),
                    ),

                    const SizedBox(height: 16),

                    Text(
                      "First seen in:",
                      style: TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Lato ',
                        color: AppColors.white,
                      ),
                    ),
                    Text(
                      detailsEpisodeModel.name,
                      style: TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Lato ',
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
