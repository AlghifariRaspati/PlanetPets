import 'package:flutter/material.dart';

class IntroPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 29, 34, 52),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.75,
            child: Image.asset('assets/images/rafiki2.png'),
          ),
          Text(
            'Planet Pets is a catalog app\n that makes shopping for\n your pet needs more efficient!',
            style: TextStyle(
                color: Colors.white, fontFamily: 'Poppins', fontSize: 20),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
