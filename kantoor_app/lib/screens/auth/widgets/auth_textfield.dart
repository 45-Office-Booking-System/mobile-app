import 'package:flutter/material.dart';
import 'package:kantoor_app/utils/theme.dart';

Widget textField({
  required String text,
  required IconData icon,
  required bool isEmailType,
  required bool isPasswordType,
  required TextEditingController controller,
  required bool passwordView,
  IconButton? suffixIcon,
}) {
  return TextFormField(
    controller: controller,
    obscureText: passwordView,
    cursorColor: Colors.green[300],
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: primaryColor500,
      ),
      suffixIcon: suffixIcon,
      labelText: text,
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(
          width: 0,
          style: BorderStyle.none,
        ),
      ),
    ),
    keyboardType: isPasswordType ? TextInputType.visiblePassword : TextInputType.emailAddress,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Form tidak boleh kosong';
      } else if (!RegExp(r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$").hasMatch(value) &&
          isEmailType) {
        return 'Please Enter Valid Email (ex: kantoor@gmail.com)';
      } else if (isPasswordType && value.length < 6) {
        return 'Password minimal 6 karakter';
      }
      return null;
    },
  );
}
