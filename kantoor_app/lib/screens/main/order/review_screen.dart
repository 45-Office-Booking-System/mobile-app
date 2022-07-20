import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'package:kantoor_app/models/post_review.dart';
import 'package:kantoor_app/screens/main/main_screen.dart';
import 'package:kantoor_app/utils/theme.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kantoor_app/viewModels/review_provider.dart';
import 'package:provider/provider.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ReviewGedung extends StatefulWidget {
  final int idGedung;
  ReviewGedung({Key? key, required this.idGedung}) : super(key: key);

  @override
  State<ReviewGedung> createState() => _ReviewGedungState();
}

class _ReviewGedungState extends State<ReviewGedung> {
  TextEditingController comment = TextEditingController();
  final formKey = GlobalKey<FormState>();
  double rating = 0.0;

  File? image;
  Future getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? imagePicked = await _picker.pickImage(source: ImageSource.gallery);
    image = File(imagePicked!.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back,
              color: colorBlack,
            ),
          ),
          title: Text(
            "Review",
            style: titleTextStyle.copyWith(fontSize: 16),
          ),
          backgroundColor: colorWhite,
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Image(
                  alignment: Alignment.center,
                  image: AssetImage("assets/images/review_sent.png"),
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Berikan pengalaman Anda saat menggunakan Gedung ini',
                  style: subtitleTextStyle.copyWith(
                    color: colorBlack,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmoothStarRating(
                      color: Colors.yellow,
                      borderColor: primaryColor500,
                      size: 28.0,
                      rating: 0.0,
                      onRated: (double value) {
                        setState(() {
                          rating = value;
                        });
                      },
                    ),
                    // RatingStars(
                    //   valueLabelVisibility: false,
                    //   value: 0,
                    //   onValueChanged: (v) {},
                    //   starBuilder: (index, color) => Icon(
                    //     Icons.star,
                    //     color: color,
                    //   ),
                    //   starCount: 5,
                    //   starSize: 20,
                    //   maxValue: 5,
                    //   starSpacing: 2,
                    //   animationDuration: const Duration(milliseconds: 1000),
                    //   valueLabelPadding: const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                    //   valueLabelMargin: const EdgeInsets.only(right: 8),
                    //   starOffColor: const Color(0xffe7e8ea),
                    //   starColor: Colors.yellow,
                    // ),
                    Text(
                      'Berikan Rating Anda',
                      style: subtitleTextStyle.copyWith(
                        color: colorBlack,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintStyle: subtitleTextStyle.copyWith(
                            color: Colors.grey[500],
                            fontSize: 11,
                          ),
                          hintText: "Ketikkan komentar Anda mengenai penyewaan Gedung ini.",
                          hintMaxLines: 5,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Deskripsi tidak boleh kosong';
                          }
                        },
                        controller: comment,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Consumer<PostReviewProvider>(builder: (context, value, _) {
                  final isLoading = value.state == ReviewState.loading;
                  final isError = value.state == ReviewState.error;

                  if (isLoading) {
                    return const Center(
                      child: JumpingDots(
                        color: primaryColor500,
                        radius: 8,
                        innerPadding: 1.8,
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
                          SnackBar(content: Text("${value.message}")),
                        );
                        value.changeState(ReviewState.none);
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

                      final review = PostReview(
                        rating: rating,
                        description: comment.text,
                        idGedung: widget.idGedung,
                      );

                      debugPrint(comment.text);

                      final status = await value.postReview(review);

                      if (status == 'Review successfully') {
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
                              SnackBar(
                                content: Text(status),
                              ),
                            );
                            value.changeState(ReviewState.none);
                          },
                        );
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Kirim Review',
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
      ),
    );
  }
}
