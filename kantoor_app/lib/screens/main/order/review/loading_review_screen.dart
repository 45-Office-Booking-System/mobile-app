import 'package:flutter/material.dart';
import 'package:kantoor_app/utils/theme.dart';

class LoadingReview extends StatefulWidget {
  const LoadingReview({Key? key}) : super(key: key);

  @override
  State<LoadingReview> createState() => _LoadingReviewState();
}

class _LoadingReviewState extends State<LoadingReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage("assets/images/waiting.png"),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                "Tunggu Sebentar ...",
                style: titleTextStyle.copyWith(
                    color: primaryColor500, fontSize: 18),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                "Review Anda sedang dikirim",
                style: subtitleTextStyle.copyWith(color: primaryColor500),
              )
            ],
          ),
        ),
      ),
    );
  }
}
