import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wallet/config/constants/app_colors.dart';
import 'package:wallet/config/constants/app_decorations.dart';
import 'package:wallet/config/constants/app_text_styles.dart';
import 'package:wallet/config/constants/assets.dart';

import 'components/payment_method_card.dart';

class SPage extends StatefulWidget {
  const SPage({super.key});

  @override
  State<SPage> createState() => _SPageState();
}

class _SPageState extends State<SPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff19191C),
      body: Column(
        children: [
          const SizedBox(
            height: 62,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18, right: 18, bottom: 48),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      Assets.icons.back,
                      color: Colors.white,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Center(
                    child: Text(
                      'Buy \$VVS',
                      style: AppTextStyles.b6DemiBold.copyWith(
                        color: AppColors.baseLight.shade100,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 39),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payment method',
                  style: AppTextStyles.b3Medium.copyWith(
                    color: AppColors.textColor1,
                  ),
                ),
                const PaymentMethodCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
