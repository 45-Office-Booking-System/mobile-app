import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
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
    final XFile? imagePicked =
        await _picker.pickImage(source: ImageSource.gallery);
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
              )),
          title: Text(
            "Give Feedback or Review",
            style: titleTextStyle.copyWith(fontSize: 18),
          ),
          backgroundColor: colorWhite,
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Berikan pengalaman anda saat menggunakan ruangan',
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
                    valueLabelPadding:
                        const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
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
              TextButton(
                style: TextButton.styleFrom(backgroundColor: colorWhite),
                onPressed: () async {
                  await getImage();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      Icons.camera_alt_rounded,
                      color: primaryColor500,
                    ),
                    Text(
                      'Tambahkan Foto',
                      style: subtitleTextStyle.copyWith(
                        color: primaryColor500,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              image != null
                  ? Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      child: Image.file(
                        image!,
                        fit: BoxFit.cover,
                      ))
                  : Container(),
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
                      hintText:
                          "Ketikkan komentar anda mengenai penyewaan gedung",
                      hintMaxLines: 5,
                      // border: const OutlineInputBorder(
                      //     borderSide: BorderSide(
                      //         color: Color.fromARGB(255, 255, 255, 255))),
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
                style: TextButton.styleFrom(backgroundColor: primaryColor500),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Kirimkan Review',
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
    );
  }
}
