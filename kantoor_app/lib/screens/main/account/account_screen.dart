import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'package:kantoor_app/models/user.dart';
import 'package:kantoor_app/screens/main/account/edit_account_screen.dart';
import 'package:kantoor_app/screens/main/account/kebijakan_privasi_screen.dart';
import 'package:kantoor_app/utils/theme.dart';
import 'package:kantoor_app/viewModels/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../auth/auth_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final user = UserPreferences.myUser;

  File? image;
  Future getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imagePicked = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      image = File(imagePicked!.path);
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final userId = prefs.getInt('idUser') ?? 0;
      // ignore: use_build_context_synchronously
      final user = Provider.of<UserProvider>(context, listen: false);
      user.getUser(userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            const SizedBox(
              height: 12.0,
            ),
            _buildProfile(Icons.people, "Nama", user.name),
            _buildProfile(Icons.email, "Email", user.email),
            _buildProfile(Icons.smartphone, "Handphone", user.phone),
            _buildProfile(Icons.location_on, "Alamat", user.alamat),
            const SizedBox(
              height: 15.0,
            ),
            Container(
              height: 5.0,
              color: Colors.grey[300],
            ),
            const SizedBox(
              height: 15.0,
            ),
            _buildCardSetting(Icons.perm_device_info_rounded, "Syarat dan Ketentuan", const KebijakanPrivasi()),
            _buildCardSetting(Icons.privacy_tip_outlined, "Kebijakan Privasi", const KebijakanPrivasi()),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 3.5,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(primaryColor500.withOpacity(0.5), BlendMode.dstATop),
              image: const AssetImage("assets/images/kantor2.jpg"),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 75.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    image != null
                        ? Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: colorWhite, width: 2.0),
                              image: DecorationImage(
                                image: FileImage(
                                  image!,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: primaryColor700,
                              shape: BoxShape.circle,
                              border: Border.all(color: colorWhite, width: 2.0),
                              image: const DecorationImage(
                                image: NetworkImage(
                                  'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: InkWell(
                        onTap: () async {
                          await getImage();
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 2,
                                color: Theme.of(context).scaffoldBackgroundColor,
                              ),
                              color: primaryColor500),
                          child: const Icon(
                            Icons.edit,
                            color: colorWhite,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Consumer<UserProvider>(builder: (context, manager, _) {
                  final isLoading = manager.userState == UserState.loading;
                  final isError = manager.userState == UserState.error;
                  final value = manager.user;

                  if (isLoading) {
                    return const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: JumpingDots(
                        innerPadding: 1,
                        radius: 8,
                        color: colorWhite,
                        numberOfDots: 3,
                        animationDuration: Duration(milliseconds: 200),
                      ),
                    );
                  }

                  if (isError) {
                    return Text(
                      'No internet',
                      style: titleTextStyle.copyWith(
                        fontSize: 24,
                        color: colorWhite,
                      ),
                    );
                  }

                  if (value != null) {
                    return Text(
                      value.name,
                      style: titleTextStyle.copyWith(
                        fontSize: 24,
                        color: colorWhite,
                      ),
                    );
                  } else {
                    return Text(
                      'Null',
                      style: titleTextStyle.copyWith(
                        fontSize: 24,
                        color: colorWhite,
                      ),
                    );
                  }
                }),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 195),
          child: Center(
            child: Container(
              height: 70,
              width: MediaQuery.of(context).size.width * 0.9,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20.0), color: Colors.grey[50], boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 0.3),
                  blurRadius: 5.0,
                ),
              ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Profil Akun',
                    style: titleTextStyle.copyWith(fontSize: 16),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final user = Provider.of<UserProvider>(context, listen: false).user;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditAccount(
                            user: user!,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor500,
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Edit Profil',
                          style: subtitleTextStyle.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorWhite,
                          ),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        const Icon(
                          Icons.edit,
                          size: 15,
                          color: colorWhite,
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AuthScreen(),
                        ),
                        (route) => false,
                      );
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.remove('idUser');
                      prefs.remove('token');
                      prefs.remove('expiryDate');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Logout',
                          style: subtitleTextStyle.copyWith(
                            color: colorWhite,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        const Icon(
                          Icons.logout,
                          color: colorWhite,
                          size: 15,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  _buildProfile(icon, key, value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: primaryColor900,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 50,
          ),
          Consumer<UserProvider>(builder: (context, manager, _) {
            final isLoading = manager.userState == UserState.loading;
            final isError = manager.userState == UserState.error;
            final value = manager.user;

            if (isLoading) {
              return const JumpingDots(
                color: primaryColor500,
                radius: 7,
                numberOfDots: 3,
                innerPadding: 2,
                animationDuration: Duration(milliseconds: 200),
              );
            }

            if (isError) {
              return Text(
                'Null',
                style: titleTextStyle.copyWith(
                  fontSize: 24,
                  color: colorWhite,
                ),
              );
            }

            if (value != null) {
              if (key == "Nama") {
                return Text(
                  value.name,
                  style: subtitleTextStyle.copyWith(
                    fontSize: 12,
                    color: colorBlack,
                  ),
                );
              } else if (key == "Email") {
                return Text(
                  value.email,
                  style: subtitleTextStyle.copyWith(
                    fontSize: 12,
                    color: colorBlack,
                  ),
                );
              } else if (key == "Handphone") {
                return Text(
                  value.phone,
                  style: subtitleTextStyle.copyWith(
                    fontSize: 12,
                    color: colorBlack,
                  ),
                );
              } else {
                return Expanded(
                  child: Text(
                    value.alamat,
                    style: subtitleTextStyle.copyWith(
                      fontSize: 12,
                      color: colorBlack,
                    ),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                  ),
                );
              }
            } else {
              return Text(
                'Null',
                style: titleTextStyle.copyWith(
                  fontSize: 24,
                  color: colorWhite,
                ),
              );
            }
          }),
        ],
      ),
    );
  }

  _buildCardSetting(icon, key, func) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: primaryColor900,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => func));
            },
            child: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: primaryColor900,
            ),
          ),
        ],
      ),
    );
  }
}
