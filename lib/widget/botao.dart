import 'package:flutter/material.dart';
import 'package:projetoepi/style/colors.dart';

Widget customButton({
  VoidCallback? tap,
  String? text,
  BuildContext? context,
}) {
  return SizedBox(
    width: MediaQuery.of(context!).size.width,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        onPressed: tap,
        style: TextButton.styleFrom(
          backgroundColor: amarelo,
          padding: const EdgeInsets.all(16.0)
        ),
        child: Text(
          text!,
          style: TextStyle(
            fontSize: 20.0,
            color: preto,
          ),
        )
      ),
    ),
  );
  }