import 'dart:math';

import 'package:flutter/cupertino.dart';
import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_text_styles.dart';
import '../../../../config/constants/assets.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 26),
      margin: const EdgeInsets.only(top: 31, bottom: 42, right: 22, left: 22),
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            Assets.images.bgDoubleCricle,
          ),
          alignment: Alignment.topRight,
        ),
        color: AppColors.cardBgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Balance (\$VVS)',
                  style: AppTextStyles.b5Regular.copyWith(
                    foreground: Paint()
                      ..shader = LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          AppColors.baseLight.shade20,
                          AppColors.baseLight.shade100,
                        ],
                      ).createShader(
                        const Rect.fromLTWH(0.0, 0.0, 200.0, 100.0),
                      ),
                  ),
                ),
                const SizedBox(
                  height: 31,
                ),
                Text(
                  '0.32213',
                  style: AppTextStyles.h5.copyWith(
                    color: AppColors.baseLight,
                    fontSize: 36,
                    fontFamily: AppTextStyles.fontMonoska,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              gradient: LinearGradient(
                colors: [
                  Color(0xffEFCFC4),
                  Color(0xff9DBEDE),
                ],
                stops: [0.4, 1],
                transform: GradientRotation(pi / 180 * 118),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'In dollars',
                  style: AppTextStyles.b4Regular.copyWith(
                    fontSize: 11,
                    color: AppColors.textColor3,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  '\$281.3',
                  style: AppTextStyles.b6DemiBold.copyWith(
                    color: AppColors.textColor3,
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
