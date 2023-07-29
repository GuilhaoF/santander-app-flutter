import 'package:flutter/material.dart';
import 'package:santander/shared/app_settings.dart';
import 'package:santander/shared/app_colors.dart';
import 'package:santander/models/user_model/user_model.dart';

class HeaderWidget extends StatelessWidget {
  final UserModel user;
  const HeaderWidget({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      height: AppSettings.screenHeight / 5,
      width: AppSettings.screenWidth,
      color: AppColors.red,
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Olá, ${user.name}",
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          Text(
            "Ag ${user.account!.agency!} Cc ${user.account!.number!}",
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
          )
        ],
      ),
    );
  }
}