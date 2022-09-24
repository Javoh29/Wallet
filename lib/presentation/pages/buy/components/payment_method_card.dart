import 'package:flutter/cupertino.dart';
import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_decorations.dart';
import '../../../../config/constants/app_text_styles.dart';
import '../../../../config/constants/assets.dart';

class PaymentMethodCard extends StatelessWidget {
  const PaymentMethodCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.only(left: 11, right: 22, top: 15, bottom: 14),
      decoration: AppDecorations.defDecor.copyWith(
        borderRadius: BorderRadius.circular(17),
        color: AppColors.cardBgColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            Assets.images.fingerPrint,
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '8600 **** **** 1234',
                style: AppTextStyles.h6.copyWith(
                  color: AppColors.baseLight.shade100.withOpacity(.29),
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                '06/24',
                style: AppTextStyles.h6.copyWith(
                  color: AppColors.baseLight.shade100,
                ),
              ),
            ],
          ),
          Text(
            'change',
            style: AppTextStyles.b4Regular.copyWith(
              fontSize: 11.3,
              color: AppColors.textColor1,
            ),
          ),
        ],
      ),
    );
  }
}
