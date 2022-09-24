import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet/config/constants/app_colors.dart';
import 'package:wallet/config/constants/app_decorations.dart';
import 'package:wallet/config/constants/app_text_styles.dart';
import 'package:wallet/config/constants/assets.dart';
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
      padding: const EdgeInsets.only(top: 64, right: 22, left: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              columnText(),
              buttonGradient(context),
            ],
          ),
          const BalanceCard(),
          Text(
            'Frequent Transactions',
            style: AppTextStyles.h8.copyWith(
              fontSize: 14,
              color: AppColors.textColor2,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 21),
            height: 85,
            alignment: Alignment.center,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 25),
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
                  width: 0.5,
                  margin:
                      const EdgeInsets.only(right: 26, top: 13.5, bottom: 36.5),
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                      Color(0xff3E3E4F),
                      Color(0xff464659),
                      Color(0xff3E3E4F),
                    ],
                  )),
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
      padding: const EdgeInsets.only(right: 25),
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
            style: AppTextStyles.h5.copyWith(fontSize: 24.48),
            children: [
              TextSpan(
                text: 'Bradly',
                style: AppTextStyles.h1.copyWith(fontSize: 24.48),
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
            style: AppTextStyles.b5Regular.copyWith(
              fontSize: 9,
              color: AppColors.textColor2,
            ),
            children: [
              TextSpan(
                text: ' \$892.20 ',
                style: AppTextStyles.h6.copyWith(
                  fontSize: 9,
                  color: AppColors.textColor2,
                ),
              ),
              TextSpan(
                text: 'for this month',
                style: AppTextStyles.h1.copyWith(
                  fontSize: 9,
                  color: AppColors.textColor2,
                ),
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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const BuyPage(),
          ),
        );
      },
      child: Container(
        width: 132,
        decoration: AppDecorations.defDecor.copyWith(
          gradient: const LinearGradient(
            colors: AppColors.gradientColors,
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        padding:
            const EdgeInsets.only(right: 21, left: 18, top: 15, bottom: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$VVs',
              style: AppTextStyles.b5Regular.copyWith(
                color: AppColors.baseLight.shade100,
                fontSize: 14,
              ),
            ),
            SvgPicture.asset(Assets.icons.exchange),
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
