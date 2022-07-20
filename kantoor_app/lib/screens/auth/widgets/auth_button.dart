import 'package:flutter/material.dart';
import 'package:kantoor_app/utils/theme.dart';

Widget authButton({required BuildContext context, required bool isLogin, required Function onTap}) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.5,
    height: 50,
    margin: const EdgeInsets.symmetric(vertical: 20.0),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.pressed)) {
              return primaryColor700;
            }
            return primaryColor500;
          },
        ),
      ),
      child: Text(
        isLogin ? 'MASUK' : 'DAFTAR',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
  );
}
