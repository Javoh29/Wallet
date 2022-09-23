import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet/config/constants/app_colors.dart';
import 'package:wallet/config/constants/app_decorations.dart';
import 'package:wallet/config/constants/app_text_styles.dart';
import 'package:wallet/config/constants/assets.dart';
import 'package:wallet/presentation/pages/wallet/components/balance_card.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecorations.defDecor.copyWith(
        image: DecorationImage(
          image: AssetImage(Assets.images.bgGrdient),
          alignment: Alignment.topCenter,
        ),
        color: AppColors.bgColor2,
      ),
      padding: const EdgeInsets.only(top: 64, right: 22, left: 22),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              columnText(),
              button_gradient(),
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

  Container button_gradient() {
    return Container(
      width: 132,
      decoration: AppDecorations.defDecor.copyWith(
        gradient: const LinearGradient(
          colors: AppColors.gradientColors,
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.only(right: 21, left: 18, top: 15, bottom: 12),
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
    );
  }
}
