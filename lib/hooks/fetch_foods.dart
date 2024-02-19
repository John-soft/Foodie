import 'dart:io';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodie/constants/constants.dart';
import 'package:foodie/models/api_error.dart';
import 'package:foodie/models/foods_model.dart';
import 'package:foodie/models/hook_model.dart/food_hook.dart';
import 'package:http/http.dart' as http;

FetchFoods useFetchFoods(String code) {
  final foods = useState<List<FoodsModel>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      final response =
          await http.get(Uri.parse('$appBaseUrl/api/v1/foods/random/$code'));
      if (response.statusCode == 200) {
        foods.value = foodsModelFromJson(response.body);
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
    Future.delayed(const Duration(seconds: 3));
    fetchData();
    return null;
  }, []);

  void refetch() {
    isLoading.value = true;
    fetchData();
  }

  return FetchFoods(
    data: foods.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
