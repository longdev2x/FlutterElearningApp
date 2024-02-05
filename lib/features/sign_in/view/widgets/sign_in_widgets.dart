import 'package:flutter/material.dart';


class ThirdPartyLogin extends StatelessWidget {
  const ThirdPartyLogin({super.key});
  @override
  Widget build(context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 80),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _loginButton('assets/icons/google.png'),
            _loginButton('assets/icons/apple.png'),
            _loginButton('assets/icons/facebook.png'),
          ],
        ),
      ),
    );
  }
}

Widget _loginButton(
  String imagePath,
) {
  return SizedBox(
    height: 40,
    width: 40,
    child: Image.asset(imagePath),
  );
}

