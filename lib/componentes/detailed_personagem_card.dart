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
    return Card(
      color: AppColors.primaryColorLight,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            detailsPersonagensModel.image,
            width: 320,
            height: 160,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 378,
            left: 36,
            child: Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color:
                        detailsPersonagensModel.status.toLowerCase() == "alive"
                        ? Colors.green
                        : Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  "${detailsPersonagensModel.status} - ${detailsPersonagensModel.species}",
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
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
                    fontWeight: FontWeight.w900,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  "${detailsPersonagensModel.status} - ${detailsPersonagensModel.species}",
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.5,
                  ),
                ),

                if (detailsPersonagensModel.type.isNotEmpty)
                  Text(
                    "Tipo: ${detailsPersonagensModel.type}",
                    style: TextStyle(color: AppColors.white, fontSize: 12.5),
                  ),

                const SizedBox(height: 12),
                Text(
                  "Last know location:",
                  style: TextStyle(color: AppColors.white, fontSize: 12.5),
                ),
                Text(
                  "${detailsPersonagensModel.origin.name} (${detailsPersonagensModel.location.name})",
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.5,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "Firt seen in:",
                  style: TextStyle(fontSize: 12.5, color: AppColors.white),
                ),
                Text(
                  detailsEpisodeModel.name,
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
