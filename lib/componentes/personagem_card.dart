import 'package:app_rick_and_morty/models/personagens_list.dart';
import 'package:app_rick_and_morty/theme/app_colors.dart';
import 'package:flutter/material.dart';

class PersonagemCard extends StatelessWidget {
  const PersonagemCard({
    required this.personagem,
    required this.onTap,
    super.key,
  });

  final Result personagem;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primaryColorLight,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 20.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 7,
              child: Image.network(
                personagem.image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              child: Text(
                personagem.name.toUpperCase(),
                style: TextStyle(
                  fontSize: 14.5,
                  fontWeight: FontWeight.w900,
                  color: AppColors.white,
                  
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
