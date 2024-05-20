
import 'package:flutter/material.dart';

class ButtonScreen extends StatelessWidget {
  const ButtonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 4),
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('Text Button')));
              },
              child: const Text('Text Button'),
            ),
            ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('Elevated Button')));
              },
              child: const Text('Elevated Button'),
            ),
            OutlinedButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all<Color>(Colors.orange),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text('Outlined Button')));
                },
                child: const Text('Outlined Button')),
            CustomButton(
              text: 'My Button',
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('My Button')));
              },
            ),
            CustomButton(
              text: 'Green Button',
              backgroundColor: Colors.green,
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('Green Button')));
              },
            ),
            CustomButton(
              text: 'Purple Button',
              backgroundColor: Colors.purple,
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('Purple Button')));
              },
            ),
            const Spacer(flex: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: CustomButton(text: 'Cancel', onPressed: () {})),
                Expanded(
                    child: CustomButton(
                      text: 'Submit',
                      backgroundColor: Colors.green,
                      onPressed: () {},
                    )),
              ],
            ),
            const Spacer(flex: 4),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    this.backgroundColor = Colors.red,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final Color backgroundColor;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        // alignment: Alignment.center,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  blurRadius: 0.5,
                  spreadRadius: 0.5,
                  offset: Offset.fromDirection(90))
            ]),
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}