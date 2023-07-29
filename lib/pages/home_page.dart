import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:santander/models/user_model/account.dart';
import 'package:santander/models/user_model/card.dart';
import 'package:santander/models/user_model/user_model.dart';
import 'package:santander/services/api.dart';
import 'package:santander/shared/app.images.dart';
import 'package:santander/shared/app_colors.dart';
import 'package:santander/shared/app_settings.dart';
import 'package:santander/widgets/balance.dart';
import 'package:santander/widgets/card.dart';
import 'package:santander/widgets/features.dart';

import 'package:santander/widgets/header.dart';
import 'package:santander/widgets/info_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserModel? user;

  //valores padroes
  Account contaPadrao = Account();
  CreditCard defaultcard = CreditCard();

  //metodo principal quando executa a classe
  @override
  void initState() {
    super.initState();
    fetch();
  }

  fetch() async {
    user = await ApiApp.fetchUser(1);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //enquanto carrega usuario ele mostra o circula progress
    return user == null
        ? const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          )
        : Scaffold(
            drawer: const Drawer(),
            appBar: AppBar(
              backgroundColor: AppColors.red,
              foregroundColor: AppColors.whiteCuston,
              title: Center(
                child: SvgPicture.asset(
                  AppImages.logo,
                  height: 24,
                ),
              ),
              actions: [
                // ignore: avoid_unnecessary_containers
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: const Icon(Icons.notifications),
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  Column(children: [
                    if (user != null) HeaderWidget(user: user ?? UserModel()),
                    const SizedBox(
                      height: 200,
                    ),
                    FeaturesWidget(features: user?.features ?? []),
                    const SizedBox(
                      height: 10,
                    ),
                    CardWidget(card: user?.card ?? defaultcard),
                    const SizedBox(
                      height: 10,
                    ),
                    InfoCardsWidget(news: user?.news ?? [])
                  ]),
                  //mexendo com posicionamento de widgets
                  Positioned(
                    top: (AppSettings.screenHeight / 6) - 30,
                    child: BalanceWidget(account: user?.account ?? contaPadrao)
                    )
                ],
              ),
            ));
  }
}
