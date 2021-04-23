import 'package:ayoo/config/config.dart';
import 'package:ayoo/model/place_model.dart';
import 'package:ayoo/repo/remote/google_place_api.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/distance.dart';
import 'package:google_maps_webservice/geocoding.dart';
import 'package:google_maps_webservice/places.dart';

class GooglePlaceController extends GetxController {
  final GooglePlaceApi _googlePlaceApi = GooglePlaceApi();
  final _places = GoogleMapsPlaces(apiKey: key);
  final _geocoding = GoogleMapsGeocoding(apiKey: key);
  final _distance = GoogleDistanceMatrix(apiKey: key);

  final _placeSearchResult = List<Prediction>().obs;
  final _placeSuggestions = List<PlaceModel>().obs;

  final keyword = "".obs;
  final loading = false.obs;
  final detailLoading = false.obs;

  List<PlaceModel> get places => _placeSuggestions;

  void setPlaceSuggestion(List<PlaceModel> places) {
    _placeSuggestions.assignAll(places);
  }

  void setKeyword(String word) {
    keyword.value = word;
  }

  Future searchPlaceFromGoogle() async {
    loading.value = true;

    await _places
        .autocomplete(
      keyword.value,
      location: Location(-0.495951, 117.135010),
      radius: 10000,
      strictbounds: true,
      language: 'id',
    )
        .then((response) {
      _placeSearchResult.addAll(response.predictions);
      setPlaceSuggestion(response.predictions
          .map((item) => PlaceModel(
                placeId: item.placeId,
                description: item.description,
              ))
          .toList());
      loading.value = false;
    });
  }

  Future searchPlaceFromDb() async {
    loading.value = true;
    await _googlePlaceApi.fetchPlace(keyword.value).then((result) {
      if (result != null) {
        if (result.length > 0) {
          setPlaceSuggestion(result);
          loading.value = false;
        } else {
          searchPlaceFromGoogle();
        }
      }
    });
  }

  Future storePlaces() async {
    if (_placeSearchResult.length > 0)
      await _googlePlaceApi.storePLace(_placeSearchResult
          .map((item) => PlaceModel(
                placeId: item.placeId,
                description: item.description,
              ))
          .toList());
  }

  Future<PlacesDetailsResponse> getDetailsByPlaceId(String placeId) async {
    return await _places.getDetailsByPlaceId(placeId);
  }

  Future<GeocodingResponse> reverseGeocoding(LatLng latLng) async {
    return await _geocoding.searchByLocation(
        Location(latLng.latitude, latLng.longitude),
        language: 'id');
  }

  Future<DistanceResponse> distanceWithLocation(
      List<Location> origin, List<Location> destination) async {
    return await _distance
        .distanceWithLocation(origin, destination,
            travelMode: TravelMode.driving, languageCode: 'id')
        .then((distance) {
      return distance;
    });
  }

  void init() {
    debounce(keyword, (_) {
      if (_.length > 0)
        searchPlaceFromDb();
      else
        setPlaceSuggestion([]);
    });

    debounce(_placeSearchResult, (_) => storePlaces(),
        time: Duration(seconds: 1));
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }
}
