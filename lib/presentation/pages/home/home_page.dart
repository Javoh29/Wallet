import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:wallet/config/constants/app_colors.dart';
import 'package:wallet/config/constants/app_text_styles.dart';

import '../../../config/constants/assets.dart';
import '../wallet/wallet_page.dart';
import 'components/transaction_history.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController scrollController = ScrollController();
  late PanelController panelController = PanelController();
  bool isOpened = false;
  double? mHeight;

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        controller: panelController,
        minHeight: MediaQuery.of(context).size.height - 530,
        boxShadow: List.empty(),
        maxHeight: MediaQuery.of(context).size.height * 0.95,
        color: Colors.transparent,
        onPanelOpened: () {
          setState(() {
            isOpened = true;
          });
        },
        onPanelClosed: () {
          setState(() {
            isOpened = false;
          });
        },
        panel: Column(
          children: [
            // #sliding panel divider
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: AppColors.dividerColor,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 27.8, right: 37.68, top: 30, bottom: 5),
              decoration: BoxDecoration(
                color: AppColors.defHistoryColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // #history label
                  Text(
                    'TRANSACTION HISTORY',
                    style: AppTextStyles.h1.copyWith(fontSize: 14, color: AppColors.labelColor),
                  ),
                  // #sort
                  InkWell(
                    onTap: () {},
                    child: SvgPicture.asset(
                      Assets.icons.filter,
                      width: 22.61,
                      height: 22.61,
                    ),
                  ),
                ],
              ),
            ),
            // #history list
            Expanded(
              child: NotificationListener(
                onNotification: (notification) {
                  if (notification is ScrollEndNotification && scrollController.position.pixels == 0) {
                    panelController.close();
                    return true;
                  } else {
                    return false;
                  }
                },
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  controller: scrollController,
                  physics: isOpened ? const ClampingScrollPhysics() : const NeverScrollableScrollPhysics(),
                  children: [
                    TransactionHistory(
                      bgColor: AppColors.defHistoryColor,
                      bgBehindColor: AppColors.defHistoryColor,
                      clientName: 'Transfer',
                      clientProfile: Assets.images.profileOne,
                      transactionDate: '15 september',
                      transactionAmount: '+ 3 ',
                      transactionCurrency: '\$VVS',
                    ),
                    ...List.generate(
                      20,
                      (index) => TransactionHistory(
                        bgBehindColor: index.isEven ? AppColors.defHistoryColor : AppColors.defHistoryBgColor,
                        bgColor: index.isEven ? AppColors.defHistoryBgColor : AppColors.defHistoryColor,
                        clientName: index.isEven ? 'Invited' : 'Transfer',
                        clientProfile: index.isEven ? Assets.images.profileTwo : Assets.images.profileOne,
                        transactionDate: '4 march',
                        transactionAmount: '+ 1 ',
                        transactionCurrency: '\$VVS',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        body: const WalletPage(),
      ),
    );
  }
}
