import 'package:flutter/material.dart';

class IntroPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 29, 34, 52),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.75,
            child: Image.asset('assets/images/rafiki.png'),
          ),
          Text(
            'Welcome to Planet Pets!,\n take a quick stroll to get\n familiar with our app',
            style: TextStyle(
                color: Colors.white, fontFamily: 'Poppins', fontSize: 20),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
