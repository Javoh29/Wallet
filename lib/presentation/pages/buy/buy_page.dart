import 'package:flutter/material.dart';
import 'package:slider_button/slider_button.dart';
import 'package:wallet/config/constants/app_text_styles.dart';

class BuyPage extends StatefulWidget {
  const BuyPage({super.key});

  @override
  State<BuyPage> createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  List<String> keyboardNumbers = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '.', '0', '⌫'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff19191C),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GridView.builder(
            shrinkWrap: true,
            itemCount: keyboardNumbers.length,
            padding: const EdgeInsets.symmetric(horizontal: 88),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (BuildContext context, int index) {
              return TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(const CircleBorder()),
                ),
                child: Text(
                  keyboardNumbers[index],
                  style: const TextStyle(fontSize: 26, color: Colors.white),
                ),
              );
            },
          ),
          Container(
            width: 233,
            height: 56,
            margin: const EdgeInsets.only(bottom: 46, top: 87),
            child: SliderButton(
              action: () {
                setState(() {});
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
          ),
        ],
      ),
    );
  }
}
