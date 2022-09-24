import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet/config/constants/app_colors.dart';
import 'package:wallet/config/constants/app_decorations.dart';
import 'package:wallet/config/constants/app_text_styles.dart';
import 'package:wallet/config/constants/assets.dart';
import 'package:wallet/presentation/pages/buy/buy_page.dart';
import 'package:wallet/presentation/pages/buy/buy_page.dart';
import 'package:wallet/presentation/pages/wallet/components/balance_card.dart';

import '../../../config/constants/local_data.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecorations.defDecor.copyWith(
        image: DecorationImage(
          image: AssetImage(Assets.images.bgGrdient),
          alignment: Alignment.topRight,
        ),
        color: AppColors.bgColor2,
      ),
      padding: const EdgeInsets.only(top: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                columnText(),
                buttonGradient(context),
              ],
            ),
          ),
          const BalanceCard(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Text(
              'Frequent Transactions',
              style: AppTextStyles.h8.copyWith(
                fontSize: 14,
                color: AppColors.textColor2,
                letterSpacing: .3,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 21),
            height: 84,
            alignment: Alignment.center,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 22),
              physics: const BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: Column(
                    children: [
                      Container(
                        width: 54,
                        height: 54,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(17),
                        margin: const EdgeInsets.only(bottom: 13),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff623BFF),
                        ),
                        child: SvgPicture.asset(Assets.icons.send),
                      ),
                      Text(
                        'Send',
                        style: AppTextStyles.b4Regular
                            .copyWith(fontSize: 14, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 1,
                  height: 45,
                  margin: const EdgeInsets.only(right: 26, top: 10, bottom: 33.5),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        const Color(0xff3E3E4F).withOpacity(0),
                        const Color(0xff464659),
                        const Color(0xff3E3E4F).withOpacity(0),
                      ],
                    ),
                  ),
                ),
                ...List.generate(
                    9,
                    (index) => transactionItem(profileImages[index],
                        index.isEven ? 'Mathey' : 'Bradly')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget transactionItem(String avatarImage, String receiverName) {
    return Padding(
      padding: const EdgeInsets.only(right: 24),
      child: Column(
        children: [
          Container(
            width: 54,
            height: 54,
            margin: const EdgeInsets.only(bottom: 13),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage(avatarImage), fit: BoxFit.cover),
            ),
          ),
          Text(
            receiverName,
            style: AppTextStyles.b4Regular
                .copyWith(fontSize: 14, color: Colors.white30),
          ),
        ],
      ),
    );
  }

  Column columnText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: 'Hello ',
            style: AppTextStyles.h5.copyWith(
              fontSize: 24.48,
              letterSpacing: .59,
            ),
            children: [
              TextSpan(
                text: 'Bradly',
                style: AppTextStyles.h1.copyWith(fontSize: 24.48, letterSpacing: .59),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        RichText(
          text: TextSpan(
            text: 'You earned',
            style: AppTextStyles.b5Regular.copyWith(fontSize: 9, color: AppColors.textColor2, letterSpacing: .2),
            children: [
              TextSpan(
                text: ' \$892.20 ',
                style: AppTextStyles.h6.copyWith(
                  fontSize: 9,
                  color: AppColors.textColor2,
                ),
              ),
              const TextSpan(
                text: 'for this month',
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget buttonGradient(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => BuyPage()));
      },
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: AppColors.gradientColors,
            transform: GradientRotation(-pi / 36),
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.only(right: 21, left: 18, top: 15, bottom: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$VVS',
              style: AppTextStyles.b5Regular.copyWith(
                color: AppColors.baseLight.shade100,
                fontSize: 14,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: SvgPicture.asset(Assets.icons.exchange),
            ),
            Text(
              '\$',
              style: AppTextStyles.b5Regular.copyWith(
                color: AppColors.baseLight.shade100,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
