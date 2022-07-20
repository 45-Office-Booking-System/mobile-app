import 'package:carousel_slider/carousel_slider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:kantoor_app/models/gedung.dart';
import 'package:kantoor_app/screens/main/home/detail_screen.dart';
import 'package:kantoor_app/screens/main/home/history_chat_screen.dart';
import 'package:kantoor_app/utils/theme.dart';
import 'package:kantoor_app/viewModels/gedung_provider.dart';
import 'package:kantoor_app/viewModels/location_selected_value.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> locationItems = [
    'Jakarta Pusat',
    'Jakarta Barat',
    'Jakarta Timur',
    'Jakarta Selatan',
    'Jakarta Utara',
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final gedung = Provider.of<GedungProvider>(context, listen: false);
      gedung.getAllGedung();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Rekomendasi untuk Anda',
                style: titleTextStyle.copyWith(
                  color: colorBlack,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            _buildCarouselSlider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Jenis Gedung',
                style: titleTextStyle.copyWith(
                  color: colorBlack,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            _buildJenisGedungButtonList(),
            const SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Semua Gedung',
                style: titleTextStyle.copyWith(
                  color: colorBlack,
                  fontSize: 16,
                ),
              ),
            ),
            _buildCarouselListView(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.33,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: primaryColor500,
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.33,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg_auth.png'),
              opacity: 0.15,
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 60.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Selamat Datang!',
                          style: titleTextStyle.copyWith(
                            fontSize: 24.0,
                            color: colorWhite,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        Text(
                          'Di Kantoor App',
                          style: titleTextStyle.copyWith(
                            fontSize: 16.0,
                            color: colorWhite,
                          ),
                        ),
                      ],
                    ),
                    // Image.asset(
                    //   "assets/icons/message.png",
                    //   width: 45,
                    //   height: 45,
                    // ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HistoryChat(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.message_rounded,
                        color: colorWhite,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: InkWell(
                  onTap: () {
                    // Navigator.of(context).push(
                    //   PageRouteBuilder(
                    //     pageBuilder: (context, animation, secondaryAnimation) {
                    //       return const SearchScreen();
                    //     },
                    //   ),
                    // );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Cari Gedung, Kantor, Penyewaan Tempat lainnya',
                            style: subtitleTextStyle.copyWith(
                              fontSize: 12,
                              color: primaryColor500,
                            ),
                          ),
                          const Icon(
                            Icons.search,
                            color: primaryColor500,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.27),
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          width: MediaQuery.of(context).size.width,
          height: 80,
          decoration: BoxDecoration(
            color: colorWhite,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Consumer<LocationSelectedProvider>(
            builder: (context, provider, _) {
              return DropdownButtonFormField2(
                isExpanded: true,
                hint: Text(
                  'Pilih Lokasi Anda',
                  style: subtitleTextStyle.copyWith(
                    fontSize: 14,
                    color: colorBlack.withOpacity(0.7),
                  ),
                ),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(width: 0.0, style: BorderStyle.none),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 0.0, style: BorderStyle.none),
                  ),
                  disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 0.0, style: BorderStyle.none),
                  ),
                ),
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black45,
                ),
                iconSize: 30,
                buttonElevation: 2,
                buttonHeight: 80,
                buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                buttonDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: primaryColor500,
                  ),
                  color: colorWhite,
                ),
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                items: locationItems
                    .map(
                      (item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: subtitleTextStyle.copyWith(
                            fontSize: 14,
                            color: colorBlack.withOpacity(0.7),
                          ),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  provider.setLocationSelected(value.toString());
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCarouselSlider() {
    return Consumer<GedungProvider>(
      builder: (context, manager, _) {
        final isLoading = manager.state == GedungState.loading;
        final isError = manager.state == GedungState.error;
        final gedungs = manager.gedungs?.data;

        if (isLoading) {
          return const Padding(
            padding: EdgeInsets.all(27.0),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (isError) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 275,
            child: Center(
              child: Text(
                'Tidak dapat memuat data',
                style: subtitleTextStyle,
              ),
            ),
          );
        }

        if (gedungs != null) {
          if (gedungs.isNotEmpty) {
            if (gedungs.length <= 5) {
              return SizedBox(
                height: 300,
                child: CarouselSlider(
                  items: gedungs.map((item) {
                    final index = gedungs.indexOf(item);

                    return Builder(
                      builder: (BuildContext context) {
                        final reviews = item.reviews;
                        double rating = 0.0;
                        double temp = 0.0;

                        if (reviews != null) {
                          if (reviews.isNotEmpty) {
                            final jumlah = reviews.length;
                            temp = reviews
                                .map((e) => e.rating)
                                .fold(0, (previousValue, element) => previousValue + element!);
                            rating = temp / jumlah;
                            rating = double.parse(rating.toStringAsFixed(1));
                          } else {
                            rating = 0.0;
                          }
                        } else {
                          rating = 0.0;
                        }
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) {
                                  return DetailScreen(
                                    id: item.id!,
                                    index: index,
                                  );
                                },
                                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                  const begin = Offset(0.0, 1.0);
                                  const end = Offset.zero;
                                  final tween = Tween(begin: begin, end: end);
                                  final offsetAnimation = animation.drive(tween);
                                  return SlideTransition(
                                    position: offsetAnimation,
                                    child: child,
                                  );
                                },
                                transitionDuration: const Duration(milliseconds: 500),
                              ),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 160,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  image: DecorationImage(
                                    image: NetworkImage(listImage[index][0]),
                                    fit: BoxFit.cover,
                                  ),
                                  color: primaryColor500,
                                ),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                children: [
                                  RatingStars(
                                    valueLabelVisibility: false,
                                    value: rating,
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
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0, top: 6.0),
                                    child: Text(
                                      rating.toString(),
                                      style: subtitleTextStyle.copyWith(
                                        color: colorBlack,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(
                                  item.name!,
                                  style: titleTextStyle.copyWith(
                                    color: colorBlack,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 4.0),
                                  child: Text(
                                    item.location!,
                                    style: subtitleTextStyle.copyWith(
                                      color: colorBlack,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  }).toList(),

                  //Slider Container properties
                  options: CarouselOptions(
                    height: 300.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    enableInfiniteScroll: false,
                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                    viewportFraction: 0.85,
                  ),
                ),
              );
            } else {
              List<Data> result = [];
              for (int i = 0; i < 4; i++) {
                result.add(gedungs[i]);
              }
              return SizedBox(
                height: 300,
                child: CarouselSlider(
                  items: result.map((item) {
                    final index = gedungs.indexOf(item);
                    return Builder(
                      builder: (BuildContext context) {
                        final reviews = item.reviews;
                        double rating = 0.0;
                        double temp = 0.0;

                        if (reviews != null) {
                          if (reviews.isNotEmpty) {
                            final jumlah = reviews.length;
                            temp = reviews
                                .map((e) => e.rating)
                                .fold(0, (previousValue, element) => previousValue + element!);
                            rating = temp / jumlah;
                            rating = double.parse(rating.toStringAsFixed(1));
                          } else {
                            rating = 0.0;
                          }
                        } else {
                          rating = 0.0;
                        }
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) {
                                  return DetailScreen(
                                    id: item.id!,
                                    index: index,
                                  );
                                },
                                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                  const begin = Offset(0.0, 1.0);
                                  const end = Offset.zero;
                                  final tween = Tween(begin: begin, end: end);
                                  final offsetAnimation = animation.drive(tween);
                                  return SlideTransition(
                                    position: offsetAnimation,
                                    child: child,
                                  );
                                },
                                transitionDuration: const Duration(milliseconds: 500),
                              ),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 160,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  image: DecorationImage(
                                    image: NetworkImage(listImage[index][0]),
                                    fit: BoxFit.cover,
                                  ),
                                  color: primaryColor500,
                                ),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                children: [
                                  RatingStars(
                                    valueLabelVisibility: false,
                                    value: rating,
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
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0, top: 6.0),
                                    child: Text(
                                      rating.toString(),
                                      style: subtitleTextStyle.copyWith(
                                        color: colorBlack,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(
                                  item.name!,
                                  style: titleTextStyle.copyWith(
                                    color: colorBlack,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 4.0),
                                  child: Text(
                                    item.location!,
                                    style: subtitleTextStyle.copyWith(
                                      color: colorBlack,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  }).toList(),

                  //Slider Container properties
                  options: CarouselOptions(
                    height: 300.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    enableInfiniteScroll: false,
                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                    viewportFraction: 0.85,
                  ),
                ),
              );
            }
          } else {
            return SizedBox();
          }
        } else {
          return SizedBox();
        }
      },
    );
  }

  Widget _buildJenisGedungButtonList() {
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: ['Auditorium', 'Gedung Serbaguna', 'Hotel', 'Convention Hall', 'Kantor'].map((item) {
          return Builder(builder: (BuildContext context) {
            return Container(
              margin: const EdgeInsets.only(left: 12.0),
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              decoration: BoxDecoration(
                color: colorWhite,
                border: Border.all(color: primaryColor500),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Center(
                child: Text(
                  item,
                  style: titleTextStyle.copyWith(
                    color: primaryColor500,
                    fontSize: 16,
                  ),
                ),
              ),
            );
          });
        }).toList(),
      ),
    );
  }

  _buildCarouselListView() {
    return Consumer<GedungProvider>(builder: (context, manager, _) {
      final isLoading = manager.state == GedungState.loading;
      final isError = manager.state == GedungState.error;
      final gedungs = manager.gedungs?.data;

      if (isLoading) {
        return const Padding(
          padding: EdgeInsets.all(27.0),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }

      if (isError) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 275,
          child: Center(
            child: Text(
              'Tidak dapat memuat data',
              style: subtitleTextStyle,
            ),
          ),
        );
      }

      if (gedungs != null) {
        if (gedungs.length > 5) {
        } else {}
        return Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: gedungs.map((item) {
              final index = gedungs.indexOf(item);
              final reviews = item.reviews;
              double rating = 0.0;
              double temp = 0.0;

              if (reviews != null) {
                if (reviews.isNotEmpty) {
                  final jumlah = reviews.length;
                  temp = reviews.map((e) => e.rating).fold(0, (previousValue, element) => previousValue + element!);
                  rating = temp / jumlah;
                  rating = double.parse(rating.toStringAsFixed(1));
                } else {
                  rating = 0.0;
                }
              } else {
                rating = 0.0;
              }

              if (index < 4) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return DetailScreen(
                            id: item.id!,
                            index: index,
                          );
                        },
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          const begin = Offset(0.0, 1.0);
                          const end = Offset.zero;
                          final tween = Tween(begin: begin, end: end);
                          final offsetAnimation = animation.drive(tween);
                          return SlideTransition(
                            position: offsetAnimation,
                            child: child,
                          );
                        },
                        transitionDuration: const Duration(milliseconds: 500),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            image: DecorationImage(
                              image: NetworkImage(listImage[index][0]),
                              fit: BoxFit.cover,
                            ),
                            color: primaryColor500,
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            RatingStars(
                              valueLabelVisibility: false,
                              value: rating,
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
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0, top: 6.0),
                              child: Text(
                                rating.toString(),
                                style: subtitleTextStyle.copyWith(
                                  color: colorBlack,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                            item.name!,
                            style: titleTextStyle.copyWith(
                              color: colorBlack,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                            item.location!,
                            style: subtitleTextStyle.copyWith(
                              color: colorBlack,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return DetailScreen(
                            id: item.id!,
                            index: index,
                          );
                        },
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          const begin = Offset(0.0, 1.0);
                          const end = Offset.zero;
                          final tween = Tween(begin: begin, end: end);
                          final offsetAnimation = animation.drive(tween);
                          return SlideTransition(
                            position: offsetAnimation,
                            child: child,
                          );
                        },
                        transitionDuration: const Duration(milliseconds: 500),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            // image: DecorationImage(
                            //   image: NetworkImage(item.imageUrl[0]),
                            //   fit: BoxFit.cover,
                            // ),
                            color: primaryColor500,
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            RatingStars(
                              valueLabelVisibility: false,
                              value: rating,
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
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0, top: 6.0),
                              child: Text(
                                rating.toString(),
                                style: subtitleTextStyle.copyWith(
                                  color: colorBlack,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                            item.name!,
                            style: titleTextStyle.copyWith(
                              color: colorBlack,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                            item.location!,
                            style: subtitleTextStyle.copyWith(
                              color: colorBlack,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            }).toList(),
          ),
        );
      } else {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 275,
          child: Center(
            child: Text(
              'Tidak ada data',
              style: subtitleTextStyle,
            ),
          ),
        );
      }
    });
  }
}
