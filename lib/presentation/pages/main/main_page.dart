import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallet/config/constants/app_colors.dart';
import 'package:wallet/config/constants/assets.dart';
import 'package:wallet/presentation/pages/home/home_page.dart';
import 'package:wallet/presentation/pages/wallet/wallet_page.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final List<Widget> pages = [const HomePage(), const WalletPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: pages,
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Transform.translate(
                offset: const Offset(0, 73),
                child: Container(
                  height: 146,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                    gradient: LinearGradient(
                        colors: [Colors.black, Colors.black.withOpacity(0)], transform: const GradientRotation(pi / 2)),
                  ),
                ),
              )),
          Positioned(
            bottom: 30,
            left: 30,
            right: 30,
            child: Container(
              padding: const EdgeInsets.all(0.5),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: AppColors.borderGr, transform: const GradientRotation(20)),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: ColoredBox(
                  color: AppColors.bottomPanelBg.withOpacity(.6),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.primaryLight.shade3.withOpacity(.7),
                          AppColors.primaryLight.shade5.withOpacity(.7)
                        ],
                      ),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 82, sigmaY: 82),
                      child: SizedBox(
                        height: 67,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset(
                                  Assets.icons.home,
                                  height: 25.6,
                                  width: 32,
                                ),
                                SvgPicture.asset(
                                  Assets.icons.wallet,
                                  height: 25.6,
                                  width: 32,
                                ),
                                SvgPicture.asset(
                                  Assets.icons.chat,
                                  height: 25.6,
                                  width: 32,
                                ),
                                Container(
                                  height: 32,
                                  width: 32,
                                  margin: const EdgeInsets.symmetric(horizontal: 4),
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(13),
                                    border: Border.all(width: .73, color: AppColors.baseLight),
                                  ),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(9.86),
                                      child: Image.asset(
                                        Assets.images.user,
                                      )),
                                )
                              ],
                            ),
                            Align(
                              alignment: const Alignment(-0.28, 1),
                              child: Container(
                                height: 5,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: AppColors.primaryLight.line,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
