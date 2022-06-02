import 'package:flutter/material.dart';

class IntroPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 29, 34, 52),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.75,
            child: Image.asset('assets/images/rafiki3.png'),
          ),
          Text(
            'Sign in or Sign up on the\n next page to continue inside!',
            style: TextStyle(
                color: Colors.white, fontFamily: 'Poppins', fontSize: 20),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
