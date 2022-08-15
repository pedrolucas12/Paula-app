import 'package:flutter/material.dart';
import 'package:paula/app/views/components/DIalogTextBox.dart';

import 'components/paulaTitle.dart';

class WelcomePage_part3 extends StatelessWidget {
  const WelcomePage_part3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(200, 100, 171, 226),
              Color.fromARGB(255, 41, 171, 226),
            ],
          ),
        ),
        child: Column(children: [
          const Expanded(
            flex: 3,
            child: PaulaTitleComponent(),
          ),
          Expanded(
              flex: 8,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/Avatar-Maker(2).png',
                      width: MediaQuery.of(context).size.width - 150,
                    ),
                    const DialogTextBox(
                      TextContent:
                          "Para começar vamos precisar de algumas informações suas, \ntudo bem?",
                      audioUrl: 'paula02.ogg',
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: 140,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/singup_part1");
                        },
                        onHover: (hover) {},
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide.none)),
                        ),
                        child: const Text("Vamos lá!",
                            style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  ],
                ),
              ))
        ]),
      ),
    );
  }
}
