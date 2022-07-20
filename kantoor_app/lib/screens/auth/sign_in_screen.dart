import 'package:flutter/material.dart';
import 'package:kantoor_app/screens/auth/widgets/auth_button.dart';
import 'package:kantoor_app/screens/main/main_screen.dart';
import 'package:kantoor_app/utils/theme.dart';
import 'package:kantoor_app/viewModels/auth_provider.dart';
import 'package:kantoor_app/viewModels/screen_index_value.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatefulWidget {
  final VoidCallback setTabController;
  const SignInScreen({
    Key? key,
    required this.setTabController,
  }) : super(key: key);

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
          20,
          20,
          20,
        ),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: const Icon(
                    Icons.email,
                    color: primaryColor500,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  fillColor: colorWhite,
                  filled: true,
                ),
                cursorColor: Colors.green[300],
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email tidak boleh kosong';
                  } else if (!RegExp(r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$").hasMatch(value)) {
                    return 'Please Enter Valid Email (ex: kantoor@gmail.com)';
                  }
                  return null;
                },
              ),
              // textField(
              //   text: 'Email',
              //   icon: Icons.email,
              //   isPasswordType: false,
              //   isEmailType: true,
              //   controller: _emailController,
              //   passwordView: false,
              // ),
              const SizedBox(
                height: 8.0,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: primaryColor500,
                  ),
                  suffixIcon: IconButton(
                    splashRadius: 0.1,
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
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  fillColor: colorWhite,
                  filled: true,
                ),
                obscureText: isHiddenPassword,
                cursorColor: Colors.green[300],
                keyboardType: TextInputType.visiblePassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password tidak boleh kosong';
                  } else if (value.length < 8) {
                    return 'Password minimal 8 karakter';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 8.0,
              ),
              Consumer<AuthProvider>(
                builder: (context, auth, _) {
                  final isLoading = auth.state == AuthState.loading;
                  final isError = auth.state == AuthState.error;

                  if (isLoading) {
                    return const Padding(
                      padding: EdgeInsets.all(27.0),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  if (isError) {
                    Future.delayed(
                      Duration.zero,
                      () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("${auth.errorMessage}")),
                        );
                        auth.changeState(AuthState.none);
                      },
                    );
                  }

                  return authButton(
                    context: context,
                    isLogin: true,
                    onTap: () async {
                      if (!formKey.currentState!.validate()) return;

                      final String email = _emailController.text.trim();
                      final String password = _passwordController.text.trim();
                      await auth.login(email: email, password: password);

                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      final token = prefs.getString('token') ?? "";

                      if (token.isNotEmpty) {
                        // ignore: use_build_context_synchronously
                        Provider.of<ScreenIndexProvider>(context, listen: false).setCurrentIndex(0);
                        // ignore: use_build_context_synchronously
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainScreen(),
                          ),
                        );
                      }
                    },
                  );
                },
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
          onTap: widget.setTabController,
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
