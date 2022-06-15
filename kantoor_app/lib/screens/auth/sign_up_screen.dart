import 'package:flutter/material.dart';
import 'package:kantoor_app/screens/auth/widgets/auth_button.dart';
import 'package:kantoor_app/screens/auth/widgets/auth_textfield.dart';
import 'package:kantoor_app/utils/theme.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _namaController = TextEditingController();
  final _tanggalLahirController = TextEditingController();
  final _alamatController = TextEditingController();
  final _nomorController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();
  bool isHiddenPassword = true;
  bool isHiddenPasswordConfirm = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _namaController.dispose();
    _tanggalLahirController.dispose();
    _alamatController.dispose();
    _nomorController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          20,
          0,
          20,
          20,
        ),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              textField(
                text: 'Username',
                icon: Icons.person,
                isPasswordType: false,
                controller: _usernameController,
                passwordView: false,
              ),
              const SizedBox(
                height: 8,
              ),
              textField(
                text: 'Nama Lengkap',
                icon: Icons.email,
                isPasswordType: false,
                controller: _namaController,
                passwordView: false,
              ),
              const SizedBox(
                height: 8,
              ),
              textField(
                text: 'Tanggal Lahir',
                icon: Icons.date_range,
                isPasswordType: false,
                controller: _tanggalLahirController,
                passwordView: false,
              ),
              const SizedBox(
                height: 8,
              ),
              textField(
                text: 'Alamat',
                icon: Icons.location_city_outlined,
                isPasswordType: false,
                controller: _alamatController,
                passwordView: false,
              ),
              const SizedBox(
                height: 8,
              ),
              textField(
                text: 'No. Handphone Aktif',
                icon: Icons.phone,
                isPasswordType: false,
                controller: _nomorController,
                passwordView: false,
              ),
              const SizedBox(
                height: 8,
              ),
              textField(
                text: 'Password',
                icon: Icons.key,
                isPasswordType: true,
                controller: _passwordController,
                passwordView: isHiddenPassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isHiddenPassword = !isHiddenPassword;
                    });
                  },
                  icon: isHiddenPassword
                      ? Icon(
                          Icons.visibility,
                          color: colorBlack.withOpacity(0.3),
                        )
                      : Icon(
                          Icons.visibility_off,
                          color: colorBlack.withOpacity(0.3),
                        ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              textField(
                text: 'Konfirmasi Password',
                icon: Icons.key_outlined,
                isPasswordType: true,
                controller: _passwordConfirmController,
                passwordView: isHiddenPasswordConfirm,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isHiddenPasswordConfirm = !isHiddenPasswordConfirm;
                    });
                  },
                  icon: isHiddenPasswordConfirm
                      ? Icon(
                          Icons.visibility,
                          color: colorBlack.withOpacity(0.3),
                        )
                      : Icon(
                          Icons.visibility_off,
                          color: colorBlack.withOpacity(0.3),
                        ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              authButton(
                context: context,
                isLogin: false,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
