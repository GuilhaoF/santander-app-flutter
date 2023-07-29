import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../models/user_model/card.dart';
import '../shared/app_colors.dart';
import '../shared/app.images.dart';
import '../shared/app_settings.dart';

class CardWidget extends StatelessWidget {
  final CreditCard card;
  const CardWidget({super.key, required this.card}); //props

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        width: AppSettings.screenWidth - 24,
        decoration: BoxDecoration(
            color: AppColors.red,
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Cartão final: ${card.number?.split(' ')[3] ?? 'N/A'}",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            SvgPicture.asset(
              AppImages.down,
              semanticsLabel: 'Seta para cima', //ajuda para leitores de telas
              height: 14,
            )
          ],
        ));
  }
}