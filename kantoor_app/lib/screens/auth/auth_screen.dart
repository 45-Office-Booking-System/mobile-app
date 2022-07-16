import 'package:flutter/material.dart';
import 'package:kantoor_app/screens/auth/sign_in_screen.dart';
import 'package:kantoor_app/screens/auth/sign_up_screen.dart';
import 'package:kantoor_app/utils/theme.dart';
import 'package:kantoor_app/viewModels/auth_provider.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with SingleTickerProviderStateMixin {
  late TabController tabController;
  List<String> labels = ['Sign In', 'Sign Up'];

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthProvider>(builder: (context, auth, _) {
        return Column(
          children: [
            _buildHeader(),
            Container(
              margin: const EdgeInsets.all(24.0),
              width: MediaQuery.of(context).size.width,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(30),
              ),
              child: TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: primaryColor500,
                indicatorColor: primaryColor500,
                indicatorWeight: 2,
                indicator: BoxDecoration(
                  color: primaryColor500,
                  borderRadius: BorderRadius.circular(30),
                ),
                controller: tabController,
                tabs: const [
                  Tab(
                    text: 'Sign In',
                  ),
                  Tab(
                    text: 'Sign Up',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  SignInScreen(
                    setTabController: () {
                      tabController.animateTo((tabController.index + 1) % 2);
                    },
                  ),
                  const SignUpScreen(),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildHeader() {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.33,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg_auth.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.33,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: primaryColor500.withOpacity(0.8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(image: AssetImage('assets/images/logo.png')),
              const SizedBox(
                height: 30.0,
              ),
              Text(
                'Kantoor',
                style: titleTextStyle.copyWith(color: colorWhite),
              ),
              Text(
                'Platform penyewaan gedung mudah dan aman',
                style: subtitleTextStyle.copyWith(color: colorWhite, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
