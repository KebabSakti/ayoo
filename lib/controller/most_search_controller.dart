import 'package:ayoo/model/most_search_model.dart';
import 'package:get/get.dart';

class MostSearchController extends GetxController {
  var mostSearchModel = List<MostSearchModel>().obs;
  var loading = false.obs;
  var error = false.obs;

  Future setMostSearchModel(List<MostSearchModel> mostSearches) async {
    mostSearchModel.assignAll(mostSearches);
  }
}
