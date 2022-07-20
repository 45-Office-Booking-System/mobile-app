import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:kantoor_app/models/post_review.dart';
import 'package:kantoor_app/services/review_api.dart';

enum ReviewState { none, loading, error }

class PostReviewProvider extends ChangeNotifier {
  final ReviewApi reviewApi = ReviewApi();

  ReviewState _reviewState = ReviewState.none;
  ReviewState get state => _reviewState;

  changeState(ReviewState reviewState) {
    _reviewState = reviewState;
    notifyListeners();
  }

  String? _message;
  String? get message => _message;

  Future<String> postReview(PostReview review) async {
    String status = '';
    try {
      changeState(ReviewState.loading);
      final result = await reviewApi.postReview(review);
      if (result) {
        status = 'Review successfully';
      }
    } catch (e) {
      if (e is DioError) {
        _message = e.response!.statusMessage;
        changeState(ReviewState.error);
        debugPrint('bossss ${e.response!.statusCode.toString()}');
        debugPrint('bossss ${e.response!.data['message'].toString()}');
      } else {
        _message = 'Something went wrong';
        changeState(ReviewState.error);
        debugPrint('bossss ${e.toString()}');
      }
    }
    return status;
  }
}
