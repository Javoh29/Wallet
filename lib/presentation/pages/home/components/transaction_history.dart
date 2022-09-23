import 'package:flutter/material.dart';

import '../../../../config/constants/app_text_styles.dart';

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({
    Key? key,
    this.bgColor = Colors.transparent,
    required this.bgBehindColor,
    required this.clientName,
    required this.clientProfile,
    required this.transactionDate,
    required this.transactionAmount,
    required this.transactionCurrency,
  }) : super(key: key);

  final Color bgColor;
  final Color bgBehindColor;
  final String clientName;
  final String clientProfile;
  final String transactionDate;
  final String transactionAmount;
  final String transactionCurrency;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgBehindColor,
      child: Container(
        padding: const EdgeInsets.only(left: 28, right: 28, top: 20, bottom: 17),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(36),
            topRight: Radius.circular(36),
          ),
          color: bgColor,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: AssetImage(clientProfile), fit: BoxFit.cover),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        clientName,
                        style: AppTextStyles.b2DemiBold.copyWith(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        transactionDate,
                        style: AppTextStyles.b4Regular.copyWith(fontSize: 12, color: const Color(0xffB8BABD)),
                      ),
                    ],
                  ),
                ),
                Text(
                  transactionAmount,
                  style: AppTextStyles.h8.copyWith(fontSize: 17, color: Colors.white),
                ),
                Text(
                  transactionCurrency,
                  style: AppTextStyles.b1Regular.copyWith(fontSize: 17, color: Colors.white60),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
