import 'package:flutter/material.dart';
import 'package:kantoor_app/screens/auth/widgets/auth_button.dart';
import 'package:kantoor_app/screens/auth/widgets/auth_textfield.dart';
import 'package:kantoor_app/utils/theme.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isHiddenPassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
              textField(
                text: 'Username',
                icon: Icons.person,
                isPasswordType: false,
                controller: _emailController,
                passwordView: false,
              ),
              const SizedBox(
                height: 8.0,
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
                height: 8.0,
              ),
              Container(
                alignment: Alignment.bottomRight,
                margin: const EdgeInsets.only(right: 16.0),
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    'Lupa password?',
                    style: subtitleTextStyle.copyWith(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              authButton(
                context: context,
                isLogin: true,
                onTap: () {},
              ),
              const SizedBox(
                height: 8.0,
              ),
              _registerOption(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _registerOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Belum memiliki akun? ',
          style: subtitleTextStyle.copyWith(
            fontSize: 16,
            color: primaryColor700,
            fontWeight: FontWeight.w500,
          ),
        ),
        InkWell(
          onTap: () {},
          child: Text(
            'Mendaftar',
            style: titleTextStyle.copyWith(
              color: primaryColor700,
              fontSize: 16,
            ),
          ),
        )
      ],
    );
  }
}
