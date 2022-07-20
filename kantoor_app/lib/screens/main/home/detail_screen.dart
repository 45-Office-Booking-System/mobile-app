import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kantoor_app/models/gedung.dart';
import 'package:kantoor_app/screens/main/home/live_chat_screen.dart';
import 'package:kantoor_app/utils/theme.dart';
import 'package:kantoor_app/viewModels/gedung_provider.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  final int id;
  final int index;
  const DetailScreen({
    Key? key,
    required this.id,
    required this.index,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> with AutomaticKeepAliveClientMixin {
  Completer<GoogleMapController> _controller = Completer();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final gedung = Provider.of<GedungProvider>(context, listen: false);
      gedung.getGedungById(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Consumer<GedungProvider>(
        builder: (context, manager, _) {
          final isLoading = manager.state == GedungState.loading;
          final isError = manager.state == GedungState.error;
          final gedung = manager.gedungById?.data?[0];

          if (isLoading) {
            return const Padding(
              padding: EdgeInsets.all(27.0),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          if (isError) {
            return Center(
              child: Text(
                'Tidak dapat memuat data',
                style: subtitleTextStyle,
              ),
            );
          }

          if (gedung != null) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(gedung),
                  _buildHargaText(gedung),
                  _buildTitleText(gedung),
                  const Divider(
                    color: primaryColor100,
                    thickness: 8,
                  ),
                  _buildLokasiText(gedung),
                  const Divider(
                    color: primaryColor100,
                    thickness: 8,
                  ),
                  _buildDeskripsiText(gedung),
                  const Divider(
                    color: primaryColor100,
                    thickness: 8,
                  ),
                  _buildPeta(gedung),
                  const Divider(
                    color: primaryColor100,
                    thickness: 8,
                  ),
                  _buildNearby(gedung),
                  const Divider(
                    color: primaryColor100,
                    thickness: 8,
                  ),
                  _buildReviewText(gedung),
                ],
              ),
            );
          } else {
            return Center(
              child: Text(
                'Tidak dapat memuat data',
                style: subtitleTextStyle,
              ),
            );
          }
        },
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          final gedung = Provider.of<GedungProvider>(context, listen: false).gedungById?.data?[0];
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return LiveChatScreen(
                  gedung: gedung!,
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
        child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: primaryColor500,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.message,
                color: colorWhite,
                size: 30,
              ),
              const SizedBox(
                width: 8.0,
              ),
              Text(
                'Tanyakan Ketersediaan',
                style: titleTextStyle.copyWith(
                  color: colorWhite,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(Data? gedung) {
    final reviews = gedung?.reviews;
    double rating = 0.0;
    double temp = 0.0;
    bool isReviewed = true;

    if (reviews != null) {
      if (reviews.isNotEmpty) {
        final jumlah = reviews.length;
        temp = reviews.map((e) => e.rating).fold(0, (previousValue, element) => previousValue + element!);
        rating = temp / jumlah;
        rating = double.parse(rating.toStringAsFixed(1));
      } else {
        isReviewed = false;
      }
    } else {
      rating = 0.0;
      isReviewed = false;
    }

    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 1000),
            autoPlayCurve: Curves.easeInOutQuad,
            pauseAutoPlayOnTouch: true,
            viewportFraction: 1,
          ),
          items: listImage.map((item) {
            final index = listImage.indexOf(item);
            return itemCard(item, index);
          }).toList(),
        ),
        SafeArea(
          child: InkWell(
            onTap: () {
              Provider.of<GedungProvider>(context, listen: false).clearData();
              Navigator.pop(context);
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 12.0, top: 12.0),
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                color: colorWhite,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.arrow_back),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 200),
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          width: MediaQuery.of(context).size.width,
          height: 50,
          decoration: BoxDecoration(
            color: colorWhite,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
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
                padding: const EdgeInsets.only(left: 8.0, top: 4.0),
                child: Text(
                  isReviewed ? '$rating/5' : 'No rating yet',
                  style: subtitleTextStyle.copyWith(
                    color: colorBlack,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget itemCard(List<String> list, int index) {
    if (widget.index < 4) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: 250,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(list[index]),
            fit: BoxFit.cover,
          ),
          color: primaryColor500,
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.4), blurRadius: 2),
          ],
        ),
      );
    } else {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: 250,
        decoration: BoxDecoration(
          // image: DecorationImage(
          //   image: NetworkImage(imageUrl),
          //   fit: BoxFit.cover,
          // ),
          color: primaryColor500,
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.4), blurRadius: 2),
          ],
        ),
      );
    }
  }

  Widget _buildHargaText(Data? gedung) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Text(
        'Rp. ${gedung!.price!},-',
        style: titleTextStyle.copyWith(
          fontSize: 20.0,
          color: primaryColor500,
        ),
      ),
    );
  }

  Widget _buildTitleText(Data gedung) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 8,
            child: Text(
              gedung.name!,
              style: titleTextStyle.copyWith(
                fontSize: 24,
                color: colorBlack,
              ),
              overflow: TextOverflow.clip,
            ),
          ),
          Flexible(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.bookmark_outline,
                  size: 30,
                ),
                Text(
                  'Add to Wishlist',
                  style: subtitleTextStyle.copyWith(
                    color: colorBlack,
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLokasiText(Data gedung) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lokasi',
            style: titleTextStyle.copyWith(
              fontSize: 18.0,
              color: colorBlack,
            ),
          ),
          Text(
            gedung.location!,
            style: subtitleTextStyle.copyWith(
              fontSize: 16,
              color: colorBlack,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeskripsiText(Data gedung) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Deskripsi',
            style: titleTextStyle.copyWith(
              fontSize: 18.0,
              color: colorBlack,
            ),
          ),
          Text(
            gedung.description!,
            style: subtitleTextStyle.copyWith(
              fontSize: 14,
              color: colorBlack,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPeta(Data gedung) {
    final lat = double.parse(gedung.latitude ?? '37.43296265331129');
    final lng = double.parse(gedung.longitude ?? '-122.08832357078792');

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Peta',
            style: titleTextStyle.copyWith(
              fontSize: 18.0,
              color: colorBlack,
            ),
          ),
          SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: SizedBox(
              width: 350,
              height: 240,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(lat, lng),
                  zoom: 17.0,
                ),
                markers: {
                  Marker(
                    markerId: const MarkerId('Gedung'),
                    infoWindow: InfoWindow(title: gedung.name),
                    icon: BitmapDescriptor.defaultMarker,
                    position: LatLng(lat, lng),
                  ),
                },
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNearby(Data gedung) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Fasilitas Terdekat',
            style: titleTextStyle.copyWith(
              fontSize: 18.0,
              color: colorBlack,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ..._itemNearby(gedung),
            ],
          ),
        ],
      ),
    );
  }

  _itemNearby(Data gedung) {
    final nearby = gedung.nearby!;

    if (nearby.isNotEmpty) {
      return nearby.map((item) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.place_outlined,
                size: 25,
              ),
              const SizedBox(
                width: 12.0,
              ),
              Expanded(
                child: Text(
                  item.namefacilities!,
                  style: subtitleTextStyle.copyWith(fontSize: 14),
                ),
              ),
              Text(
                item.jarak.toString(),
                style: subtitleTextStyle.copyWith(fontSize: 14),
              ),
            ],
          ),
        );
      });
    } else {
      return [0].map(
        (e) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Center(
            child: Text(
              'Belum ada fasilitas terdekat',
              style: subtitleTextStyle.copyWith(color: primaryColor500),
            ),
          ),
        ),
      );
    }
  }

  Widget _buildReviewText(Data gedung) {
    final review = gedung.reviews!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Review',
            style: titleTextStyle.copyWith(
              fontSize: 18.0,
              color: colorBlack,
            ),
          ),
          Builder(builder: (context) {
            if (review.isNotEmpty) {
              return SizedBox(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: review.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text(index.toString()),
                      ),
                      title: Row(
                        children: [
                          RatingStars(
                            valueLabelVisibility: false,
                            value: review[index].rating!,
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
                            padding: const EdgeInsets.only(left: 8.0, top: 4.0),
                            child: Text(
                              '${review[index].rating}',
                              style: subtitleTextStyle.copyWith(
                                color: colorBlack,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      subtitle: Text(
                        '${review[index].description}',
                        style: subtitleTextStyle.copyWith(
                          fontSize: 14,
                          color: colorBlack,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    );
                  },
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Center(
                  child: Text(
                    'Belum ada review',
                    style: subtitleTextStyle.copyWith(color: primaryColor500),
                  ),
                ),
              );
            }
          }),
        ],
      ),
    );
  }
}
