import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'package:kantoor_app/models/user.dart';
import 'package:kantoor_app/screens/main/main_screen.dart';
import 'package:kantoor_app/utils/theme.dart';
import 'package:kantoor_app/viewModels/user_provider.dart';
import 'package:provider/provider.dart';

class EditAccount extends StatefulWidget {
  final User user;
  const EditAccount({Key? key, required this.user}) : super(key: key);

  @override
  State<EditAccount> createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    setState(() {
      _emailController.text = widget.user.email;
      _namaController.text = widget.user.name;
      _phoneController.text = widget.user.phone;
    });
  }

  final user = UserPreferences.myUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back,
            color: colorBlack,
          ),
        ),
        title: Text(
          "Edit Profil",
          style: titleTextStyle.copyWith(fontSize: 16, color: colorBlack),
        ),
        backgroundColor: colorWhite,
        elevation: 0.0,
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
          child: Column(
            children: [
              _buildKeyField(Icons.person, "Nama", widget.user.name, "Nama", _namaController),
              _buildKeyField(Icons.email, "Email", widget.user.email, "Email", _emailController),
              _buildKeyField(Icons.smartphone, "No. Handphone", widget.user.phone, "No.Handpone", _phoneController),
              Consumer<UserProvider>(builder: (context, value, _) {
                final isLoading = value.userState == UserState.loading;
                final isError = value.userState == UserState.error;

                if (isLoading) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: JumpingDots(
                      color: primaryColor500,
                      numberOfDots: 3,
                      animationDuration: Duration(milliseconds: 200),
                    ),
                  );
                }

                if (isError) {
                  Future.delayed(
                    Duration.zero,
                    () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Something went wrong"),
                        ),
                      );
                      value.changeState(UserState.none);
                    },
                  );
                }

                return TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(primaryColor500),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    if (!formKey.currentState!.validate()) return;

                    final id = widget.user.id;
                    final user = User(
                      id: id,
                      email: _emailController.text.trim(),
                      password: widget.user.password,
                      name: _namaController.text.trim(),
                      fullname: widget.user.fullname,
                      alamat: widget.user.alamat,
                      phone: _phoneController.text.trim(),
                    );

                    final status = await value.editProfile(id, user);
                    if (!status) {
                      Future.delayed(
                        Duration.zero,
                        () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Something went wrong"),
                            ),
                          );
                          value.changeState(UserState.none);
                        },
                      );
                      return;
                    }

                    // ignore: use_build_context_synchronously
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainScreen(),
                      ),
                      (Route<dynamic> route) => false,
                    );

                    Future.delayed(
                      Duration.zero,
                      () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Edit Profile Successfully'),
                          ),
                        );
                        value.changeState(UserState.none);
                      },
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Simpan Perubahan',
                        style: subtitleTextStyle.copyWith(
                          color: colorWhite,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  _buildKeyField(icon, key, initial, hintText, controller) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: primaryColor900,
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              key,
              style: titleTextStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: primaryColor900,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 3.0,
        ),
        TextFormField(
          controller: controller,
          style: subtitleTextStyle.copyWith(
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: hintText,
            hintStyle: subtitleTextStyle,
            contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
          ),
          onChanged: (value) => setState(() => initial = value),
          validator: (value) {
            if (value!.isEmpty) {
              return "Form tidak boleh kosong";
            }
          },
        ),
        const SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
