import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:kantoor_app/screens/main/order/loading_review_screen.dart';
import 'package:kantoor_app/utils/theme.dart';
import 'package:image_picker/image_picker.dart';

class ReviewGedung extends StatefulWidget {
  const ReviewGedung({Key? key}) : super(key: key);

  @override
  State<ReviewGedung> createState() => _ReviewGedungState();
}

class _ReviewGedungState extends State<ReviewGedung> {
  TextEditingController comment = TextEditingController();

  File? image;
  Future getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? imagePicked = await _picker.pickImage(source: ImageSource.gallery);
    image = File(imagePicked!.path);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
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
            "Berikan Saran atau Masukan",
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
                    // SmoothStarRating(
                    //   color: Colors.yellow,
                    //   size: 40.0,
                    //   // rating: initialRating[index],
                    //   // onRated: (double value){
                    //   //   debugPrint()
                    //   // },
                    // ),
                    RatingStars(
                      valueLabelVisibility: false,
                      value: 0,
                      onValueChanged: (v) {},
                      starBuilder: (index, color) => Icon(
                        Icons.star,
                        color: color,
                      ),
                      starCount: 5,
                      starSize: 20,
                      maxValue: 5,
                      starSpacing: 2,
                      animationDuration: const Duration(milliseconds: 1000),
                      valueLabelPadding: const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                      valueLabelMargin: const EdgeInsets.only(right: 8),
                      starOffColor: const Color(0xffe7e8ea),
                      starColor: Colors.yellow,
                    ),
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
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintStyle: subtitleTextStyle.copyWith(
                          color: Colors.grey[500],
                          fontSize: 11,
                        ),
                        hintText: "Ketikkan komentar Anda mengenai penyewaan Gedung ini.",
                        hintMaxLines: 5,
                      ),
                      onChanged: (value) {
                        setState(() {});
                      },
                      controller: comment,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(primaryColor500),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoadingReview(),
                      ),
                    );
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
