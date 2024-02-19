import 'package:foodie/constants/constants.dart';
import 'package:foodie/models/foods_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SearchFoodController extends GetxController {
  final RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  set setLoading(bool value) {
    _isLoading.value = value;
  }

  List<FoodsModel>? searchResults;

  void searchFoods(String key) async {
    setLoading = true;
    try {
      final response =
          await http.get(Uri.parse('$appBaseUrl/api/v1/foods/search/$key'));
      if (response.statusCode == 200) {
        searchResults = foodsModelFromJson(response.body);
        setLoading = false;
      } else {
        setLoading = false;
      }
    } catch (e) {
      setLoading = false;
    }
  }
}
