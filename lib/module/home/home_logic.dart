import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_apps_in_flutter/module/home/widgets/weather_add_list.dart';
import '../../../utils/asset_constant.dart';

class HomeLogic extends GetxController {
  RxBool isLoading = true.obs;
  RxBool isDarkMode = false.obs;
  var isAddedToList = false.obs;

  var currentPageIndex = 1.obs;

  final PageController pageController = PageController(initialPage: 1);
  final TextEditingController searchController = TextEditingController();

  var searchHistory = <String>['Dhaka','Rajshahi', 'sylhet'].obs;

  var searchedCity = ''.obs;
  var temperature = ''.obs;
  var weatherIconPath = ''.obs;


  var homeCity = 'Dhaka'.obs;
  var homeTemp = '31°'.obs;
  var homeIcon = AssetConstants.partyCloudy.obs;


  var addedCitiesList = <Map<String, String>>[
    {'city': 'Dhaka', 'temp': '31°', 'icon': AssetConstants.partyCloudy}
  ].obs;

  @override
  void onInit() {
    super.onInit();
    isDarkMode.value = Get.isDarkMode;
    Future.delayed(const Duration(seconds: 3), () {
      isLoading.value = false;
    });
  }

  void performSearch(String query) {
    if (query.trim().isEmpty) return;

    String formattedQuery = query.trim();
    searchedCity.value = formattedQuery;

    searchHistory.remove(formattedQuery);
    searchHistory.insert(0, formattedQuery);
    if (searchHistory.length > 3) {
      searchHistory.removeLast();
    }


    if (formattedQuery.toLowerCase() == 'dhaka') {
      temperature.value = '31°';
      weatherIconPath.value = AssetConstants.partyCloudy;
    } else if (formattedQuery.toLowerCase() == 'rajshahi') {
      temperature.value = '20°';
      weatherIconPath.value = AssetConstants.cloudy;
    } else {
      temperature.value = '28°';
      weatherIconPath.value = AssetConstants.sunny;
    }


    isAddedToList.value = addedCitiesList.any(
            (element) => element['city']!.toLowerCase() == formattedQuery.toLowerCase()
    );
  }


  void toggleCityInList() {
    isAddedToList.value = !isAddedToList.value;

    if (isAddedToList.value) {
      bool alreadyExists = addedCitiesList.any(
              (element) => element['city']!.toLowerCase() == searchedCity.value.toLowerCase()
      );

      if (!alreadyExists) {
        addedCitiesList.add({
          'city': searchedCity.value,
          'temp': temperature.value,
          'icon': weatherIconPath.value.isEmpty ? AssetConstants.sunny : weatherIconPath.value,
        });
      }
    } else {
      addedCitiesList.removeWhere(
              (element) => element['city']!.toLowerCase() == searchedCity.value.toLowerCase()
      );
    }
  }


  void updateHomeWeatherData(String city, String temp, String icon) {
    homeCity.value = city;
    homeTemp.value = temp;
    homeIcon.value = icon;
  }

  void removeFromHistory(String city) {
    searchHistory.remove(city);
  }

  void updatePageIndex(int index) {
    currentPageIndex.value = index;
  }

  void openWeatherAddList(String city) {
    performSearch(city);

    isAddedToList.value = addedCitiesList.any(
            (element) => element['city']!.toLowerCase() == city.toLowerCase()
    );
    Get.to(() => const WeatherAddList());
  }

  @override
  void onClose() {
    searchController.dispose();
    pageController.dispose();
    super.onClose();
  }
}

