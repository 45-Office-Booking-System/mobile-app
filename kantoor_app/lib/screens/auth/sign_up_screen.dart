import 'package:flutter/material.dart';
import 'package:kantoor_app/models/register.dart';
import 'package:kantoor_app/screens/auth/auth_screen.dart';
import 'package:kantoor_app/screens/auth/widgets/auth_button.dart';
import 'package:kantoor_app/screens/auth/widgets/auth_textfield.dart';
import 'package:kantoor_app/utils/theme.dart';
import 'package:kantoor_app/viewModels/auth_provider.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _fullnameController = TextEditingController();
  final _alamatController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isHiddenPassword = true;
  bool isHiddenPasswordConfirm = true;

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _fullnameController.dispose();
    _alamatController.dispose();
    _phoneController.dispose();
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
              const SizedBox(
                height: 8,
              ),
              textField(
                text: 'Email',
                icon: Icons.email,
                isPasswordType: false,
                isEmailType: true,
                controller: _emailController,
                passwordView: false,
              ),
              const SizedBox(
                height: 8,
              ),
              textField(
                text: 'Name',
                icon: Icons.person,
                isPasswordType: false,
                isEmailType: false,
                controller: _nameController,
                passwordView: false,
              ),
              const SizedBox(
                height: 8,
              ),
              textField(
                text: 'Fullname',
                icon: Icons.person,
                isPasswordType: false,
                isEmailType: false,
                controller: _fullnameController,
                passwordView: false,
              ),
              const SizedBox(
                height: 8,
              ),
              textField(
                text: 'Alamat',
                icon: Icons.location_city_outlined,
                isPasswordType: false,
                isEmailType: false,
                controller: _alamatController,
                passwordView: false,
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _phoneController,
                cursorColor: Colors.green[300],
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.phone,
                    color: primaryColor500,
                  ),
                  labelText: 'Phone',
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
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Form tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 8,
              ),
              textField(
                text: 'Password',
                icon: Icons.key,
                isPasswordType: true,
                isEmailType: false,
                controller: _passwordController,
                passwordView: isHiddenPassword,
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
              ),
              const SizedBox(
                height: 8,
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
                    isLogin: false,
                    onTap: () async {
                      if (!formKey.currentState!.validate()) return;

                      final Register register = Register(
                        email: _emailController.text.trim(),
                        name: _nameController.text.trim(),
                        fullname: _fullnameController.text.trim(),
                        alamat: _alamatController.text.trim(),
                        phone: _phoneController.text.trim(),
                        password: _passwordController.text.trim(),
                      );

                      final status = await auth.register(register: register);

                      debugPrint(status.toString());

                      if (status != null) {
                        if (status == "Register Successfully") {
                          // ignore: use_build_context_synchronously
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AuthScreen(),
                            ),
                          );
                          Future.delayed(
                            Duration.zero,
                            () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(status)),
                              );
                            },
                          );
                        }
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
