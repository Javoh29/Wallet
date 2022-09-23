import 'package:flutter/material.dart';
import 'package:slider_button/slider_button.dart';
import 'package:wallet/config/constants/app_text_styles.dart';

import '../../../config/constants/app_colors.dart';
import '../../../config/constants/assets.dart';
import 'components/payment_method_card.dart';

class BuyPage extends StatefulWidget {
  const BuyPage({super.key});
  static const id = "buy_page";

  @override
  State<BuyPage> createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  List<String> keyboardNumbers = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '.', '0', '⌫'];
  late TextEditingController txtCtrOne = TextEditingController(text: '0');
  late TextEditingController txtCtrTwo = TextEditingController(text: '0');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff19191C),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18, right: 18, bottom: 48, top: 62),
                  child: Stack(
                    children: [
                      Transform.translate(
                        offset: const Offset(0, -10),
                        child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Image.asset(
                            Assets.icons.back,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Buy \$VVS',
                          style: AppTextStyles.b6DemiBold.copyWith(
                            color: AppColors.baseLight.shade100,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 39, right: 39, bottom: 35),
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
                // #first textfield
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      txtCtrOne.text,
                      style: AppTextStyles.h5.copyWith(
                        fontSize: 64,
                        color: txtCtrOne.text == '0' ? const Color(0xff727272) : Colors.white,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '\$vvs',
                      style: AppTextStyles.h5.copyWith(
                        fontSize: 32,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                // #Second textfield
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 70),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        txtCtrTwo.text,
                        style: AppTextStyles.h2.copyWith(
                          color: const Color(0xffBBBBBB),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'USD',
                        style: AppTextStyles.h2.copyWith(
                          color: const Color(0xffBBBBBB),
                        ),
                      ),
                    ],
                  ),
                ),
                // #keyboard
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: keyboardNumbers.length,
                    padding: const EdgeInsets.symmetric(horizontal: 78),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 29),
                    itemBuilder: (BuildContext context, int index) {
                      return TextButton(
                        onPressed: () => addAmount(keyboardNumbers[index]),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(const CircleBorder()),
                        ),
                        child: Text(
                          keyboardNumbers[index],
                          style: AppTextStyles.h2.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 233,
            height: 56,
            margin: const EdgeInsets.only(bottom: 46),
            child: SliderButton(
              action: () {
                Navigator.pushNamed(context, BuyPage.id);
              },
              label: Text(
                'Slide to buy',
                style: AppTextStyles.b4Regular,
              ),
              alignLabel: Alignment.center,
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff957AF7),
                ),
                padding: const EdgeInsets.all(20),
                child: Image.asset('assets/icons/slider.png'),
              ),
            ),
          )
        ],
      ),
    );
  }

  addAmount(String amount) {
    if (amount == '⌫') {
      if (txtCtrOne.text != "0") {
        if (txtCtrOne.text.length != 1) {
          txtCtrOne.text = txtCtrOne.text.substring(0, txtCtrOne.text.length - 1);
          txtCtrTwo.text = txtCtrTwo.text.substring(0, txtCtrTwo.text.length - 1);
        } else {
          txtCtrOne.text = "0";
          txtCtrTwo.text = "0";
        }
      }
    } else if (amount == ".") {
      if (txtCtrOne.text.isNotEmpty && !txtCtrOne.text.contains(".")) {
        txtCtrOne.text = txtCtrOne.text + amount;
        txtCtrTwo.text = txtCtrTwo.text + amount;
      }
    } else if (txtCtrOne.text.length < 5) {
      if (txtCtrOne.text == "0") {
        txtCtrOne.text = "";
        txtCtrTwo.text = "";
      }
      txtCtrOne.text = txtCtrOne.text + amount;
      txtCtrTwo.text = txtCtrTwo.text + amount;
    }
    setState(() {});
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      leadingWidth: 75,
      // #back button
      leading: IconButton(
        onPressed: () {},
        splashRadius: 28,
        icon: Image.asset(
          Assets.icons.back,
          color: Colors.white,
          width: 28,
          height: 8,
        ),
      ),
      // #center title
      title: Row(
        children: [
          Text(
            'Buy \$VVS',
            style: AppTextStyles.b6DemiBold.copyWith(
              color: AppColors.baseLight.shade100,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(84);
}
