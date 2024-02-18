import 'dart:io';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodie/common/logger.dart';
import 'package:foodie/constants/constants.dart';
import 'package:foodie/models/api_error.dart';
import 'package:foodie/models/hook_model.dart/hook_result.dart';
import 'package:foodie/models/restuarant_model.dart';
import 'package:http/http.dart' as http;

FetchHooks useFetchAllRestaurants(String code) {
  final restaurants = useState<List<RestuarantModel>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      final response =
          await http.get(Uri.parse('$appBaseUrl/api/v1/restaurant/all/$code'));
      logger(response.statusCode);
      if (response.statusCode == 200) {
        restaurants.value = restuarantModelFromJson(response.body);
      } else {
        apiError.value = apiErrorFromJson(response.body);
      }
    } catch (e) {
      if (e is SocketException) {
        error.value = Exception('Please Check your netwok');
      }
      error.value = e as Exception?;
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    fetchData();
    return null;
  }, []);

  void refetch() {
    isLoading.value = true;
    fetchData();
  }

  return FetchHooks(
    data: restaurants.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
