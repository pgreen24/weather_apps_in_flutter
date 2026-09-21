import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:weather_apps_in_flutter/module/home/widgets/weather_add_list.dart';
import '../../../utils/asset_constant.dart';
import '../../provider/api_services.dart';
import 'data_model/weather_data_model.dart';

class HomeLogic extends GetxController {
  RxBool isLoading = true.obs, isSearchLoading = false.obs, isDarkMode = false.obs;
  var isAddedToList = false.obs, currentPageIndex = 1.obs;

  final PageController pageController = PageController(initialPage: 1);
  final TextEditingController searchController = TextEditingController();

  var weatherList = <WeatherDataModel>[].obs, searchHistory = <String>[].obs;
  var searchedCity = ''.obs, temperature = ''.obs, weatherIconPath = ''.obs;
  var homeCity = ''.obs, homeTemp = ''.obs, homeIcon = ''.obs;
  var addedCitiesList = <Map<String, String>>[].obs;
  RxString cityName = 'dhaka'.obs;

  List<Map<String, dynamic>> allApiDistricts = [];
  var apiDropdownSuggestions = <Map<String, dynamic>>[].obs;
  RxBool isDropdownLoading = false.obs;



  @override
  void onInit() {
    super.onInit();
    isDarkMode.value = Get.isDarkMode;
    fetchWeatherData();
    fetchAllDistrictsFromApi();
  }

  Future<void> fetchWeatherData() async {
    isLoading.value = true;
    final dio.Response? response = await ApiServices().apiGetCall(cityName: cityName.value);

    if (response != null && response.statusCode == 200 && response.data != null) {
      weatherList.assignAll(WeatherDataModel.fromJsonList(response.data));
      if (weatherList.isNotEmpty) {
        homeTemp.value = "${response.data['main']['temp'].round()}°";
        homeCity.value = response.data['name'] ?? 'Dhaka';
        String iconCode = '';
        if (response.data['weather'] != null && (response.data['weather'] as List).isNotEmpty) {
          iconCode = response.data['weather'][0]['icon'] ?? '';
        }
        homeIcon.value = getWeatherIcon(iconCode);

        addedCitiesList.assignAll([{'city': homeCity.value, 'temp': homeTemp.value, 'icon': homeIcon.value}]);
      }
    }
    isLoading.value = false;
  }


  Future<void> fetchAllDistrictsFromApi() async {
    try {
      isDropdownLoading.value = true;
      final response = await ApiServices().getCityById(id: 1);

      if (response != null && response.statusCode == 200 && response.data != null) {
        List<dynamic> dataList = [];
        if (response.data is Map) {
          dataList = response.data['data'] ?? response.data['result'] ?? [];
        } else if (response.data is List) {
          dataList = response.data;
        }

        allApiDistricts = dataList.map((item) => {
          'id': item['id'] ?? 0,
          'text': item['text'] ?? item['name'] ?? ''
        }).toList();

        debugPrint("Successfully loaded ${allApiDistricts.length} districts dynamically from API.");
      }
    } catch (e) {
      debugPrint("Dynamic Dropdown API Error: $e");
    } finally {
      isDropdownLoading.value = false;
    }
  }


  void onSearchTextChanged(String query) {
    if (query.trim().isEmpty) {
      apiDropdownSuggestions.clear();
      return;
    }

    String lowerQuery = query.trim().toLowerCase();


    var filtered = allApiDistricts.where((item) {
      final String name = item['text'].toString().toLowerCase();
      return name.contains(lowerQuery);
    }).toList();

    apiDropdownSuggestions.assignAll(filtered);
  }


  Future<void> performSearch(String query) async {
    if (query.trim().isEmpty) return;
    String formattedQuery = query.trim();
    isSearchLoading.value = true;

    final dio.Response? response = await ApiServices().apiGetCall(cityName: formattedQuery);

    if (response != null && response.statusCode == 200) {
      searchedCity.value = response.data['name'] ?? formattedQuery;
      temperature.value = "${response.data['main']['temp'].round()}°";

      searchHistory.remove(searchedCity.value);
      searchHistory.insert(0, searchedCity.value);
      if (searchHistory.length > 5) searchHistory.removeLast();

      apiDropdownSuggestions.clear();
      searchController.clear();

      if (response.data['weather'] != null && (response.data['weather'] as List).isNotEmpty) {
        String iconCode = response.data['weather'][0]['icon'] ?? '';
        weatherIconPath.value = getWeatherIcon(iconCode);
      }

      checkIfAdded(searchedCity.value);
    } else {
      Get.snackbar(
          "City Not Found",
          "Check name and try again.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.8),
          colorText: Colors.white
      );
    }
    isSearchLoading.value = false;
  }

  String getWeatherIcon(String iconCode) {
    if (['01d', '01n'].contains(iconCode)) return AssetConstants.sunny;
    if (['02d', '02n', '03d', '03n'].contains(iconCode)) return AssetConstants.partyCloudy;
    if (['04d', '04n'].contains(iconCode)) return AssetConstants.cloudy;
    if (['09d', '09n', '10d', '10n', '11d', '11n'].contains(iconCode)) return AssetConstants.Rain;
    return AssetConstants.sunny;
  }

  void checkIfAdded(String city) {
    isAddedToList.value = addedCitiesList.any((e) => e['city']!.toLowerCase() == city.toLowerCase());
  }

  void toggleCityInList() {
    if (searchedCity.value.isEmpty) return;
    isAddedToList.value = !isAddedToList.value;

    if (isAddedToList.value) {
      if (!addedCitiesList.any((e) => e['city']!.toLowerCase() == searchedCity.value.toLowerCase())) {
        addedCitiesList.add({
          'city': searchedCity.value,
          'temp': temperature.value.isEmpty ? 'N/A' : temperature.value,
          'icon': weatherIconPath.value.isEmpty ? AssetConstants.sunny : weatherIconPath.value
        });
      }
    } else {
      addedCitiesList.removeWhere((e) => e['city']!.toLowerCase() == searchedCity.value.toLowerCase());
    }
  }

  void updateHomeWeatherData(String city, String temp, String icon) {
    homeCity.value = city; homeTemp.value = temp; homeIcon.value = icon;
    int index = addedCitiesList.indexWhere((e) => e['city']!.toLowerCase() == city.toLowerCase());
    if (index != -1) {
      addedCitiesList[index] = {'city': city, 'temp': temp, 'icon': icon};
      addedCitiesList.refresh();
    }
  }

  void removeFromHistory(String city) => searchHistory.remove(city);
  void updatePageIndex(int index) => currentPageIndex.value = index;

  Future<void> openWeatherAddList(String city) async {
    await performSearch(city);
    Get.to(() => const WeatherAddList());
  }

  @override
  void onClose() {
    searchController.dispose();
    pageController.dispose();
    super.onClose();
  }
}
