import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/icons/ic_back.png',
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: Center(
                      child: Text(
                        'Buy \$VVS',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 42),
              child: Column(
                children: [
                  const Text(
                    'Payment method',
                    style: TextStyle(
                        color: Color(0xff9D9898),
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                  ListTile(
                    
                    leading: Image.asset('assets/icons/ic_finger_print.png'),
                    title: Text(
                      '8600 **** **** 1234',
                      style: TextStyle(
                          color: Colors.white.withOpacity(.29),
                          fontWeight: FontWeight.bold,
                          fontSize: 11.3),
                    ),
                    subtitle: const Text(
                      '06/24',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11.3,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: const Text(
                      'change',
                      style: TextStyle(
                        color: Color(0xff9D9898),
                        fontWeight: FontWeight.w400,
                        fontSize: 11.3,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        )
    );
  }
}