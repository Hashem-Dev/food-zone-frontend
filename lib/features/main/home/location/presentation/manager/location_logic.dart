import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:food_zone/config/api.dart';
import 'package:food_zone/core/utils/snack_bar.dart';
import 'package:food_zone/features/main/home/location/data/models/location_request.dart';
import 'package:food_zone/features/main/home/location/presentation/pages/app_map.dart';
import 'package:food_zone/features/main/home/location/presentation/widgets/map/location_setting_popup.dart';
import 'package:food_zone/main.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class LocationLogic extends GetxController {
  final userLocations = prefs.userLocation;
  static const LatLng _initialCenter = LatLng(
    35.05521029290764,
    36.345352842765465,
  );

  final TextEditingController searchController = TextEditingController();
  final TextEditingController userLocationText = TextEditingController();
  final TextEditingController userTitleText = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();

  final RxString _country = ''.obs;
  final RxString _city = ''.obs;
  final RxString _addressName = ''.obs;
  final RxString _locationTitleValue = ''.obs;
  final RxString _groupValue = ''.obs;
  final RxList<dynamic> _searchLocations = <dynamic>[].obs;
  final Rx<LatLng> _selectedLatLng = const LatLng(0, 0).obs;
  final Rx<LatLng> _centerPosition = _initialCenter.obs;
  final Rx<Marker> _centerMarker = const Marker(
    markerId: MarkerId('center'),
    position: _initialCenter,
  ).obs;
  final RxSet<Marker> _markers = <Marker>{}.obs;
  final RxString _mapStyle = ''.obs;
  final RxBool _selectLocationButton = false.obs;
  final RxBool _selectFromMapLoading = false.obs;
  final RxBool _hideBottomSheet = false.obs;
  final RxBool _locationFromMap = false.obs;
  final RxBool _showClearButton = false.obs;
  final RxBool _searchStart = false.obs;
  final RxBool _areButtonsVisible = true.obs;
  final RxBool _saveButtonLoading = false.obs;
  final RxBool _deleteLoading = false.obs;
  final RxBool _setDefaultLoading = false.obs;
  GoogleMapController? googleMapController;

  bool get setDefaultLoading => _setDefaultLoading.value;

  bool get deleteLoading => _deleteLoading.value;

  bool get saveButtonLoading => _saveButtonLoading.value;

  String get groupValue => _groupValue.value;

  LatLng get centerPosition => _centerPosition.value;

  Marker get centerMarker => _centerMarker.value;

  Set<Marker> get markers => _markers.toSet();

  String get mapStyle => _mapStyle.value;

  bool get areButtonsVisible => _areButtonsVisible.value;

  bool get searchStart => _searchStart.value;

  bool get selectLocationButton => _selectLocationButton.value;

  bool get isBottomSheetHidden => _hideBottomSheet.value;

  bool get showClearButton => _showClearButton.value;

  String get locationTitleValue => _locationTitleValue.value;

  List<dynamic> get locationsResult => _searchLocations.toList();

  bool get selectFromMapLoading => _selectFromMapLoading.value;

  set showClearButton(bool value) => _showClearButton.value = value;

  set showSelectedLocation(bool value) => _selectLocationButton.value = value;

  set locationTitleValue(String value) => _locationTitleValue.value = value;

  set locationFromMap(bool value) => _locationFromMap.value = value;

  set areButtonsVisible(bool value) => _areButtonsVisible.value = value;

  set changeBottomSheetView(bool hide) => _hideBottomSheet.value = hide;

  set country(String country) => _country.value = country;

  set city(String city) => _city.value = city;

  set addressName(String addressName) => _addressName.value = addressName;

  set selectedLatLan(LatLng value) {
    _selectedLatLng.value = value;
    _selectLocationButton.value = true;
    _hideBottomSheet.value = false;
    userLocationText.clear();
  }

  void keepMarkerCenter(LatLng target) {
    _markers.removeWhere((m) => m.markerId == _centerMarker.value.markerId);
    _centerMarker.value = _centerMarker.value.copyWith(positionParam: target);
    _markers.add(_centerMarker.value);
    update();
  }

  void addNewMarker(Marker marker) {
    _markers
      ..removeWhere((m) => m.markerId == marker.markerId)
      ..add(marker);
    update();
  }

  void selectLocationValue(String value) => _groupValue.value = value;

  void animateToUserLocation() {
    googleMapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        const CameraPosition(
          target: _initialCenter,
          zoom: 18,
          tilt: 50,
          bearing: 35,
        ),
      ),
    );
    _hideBottomSheet.value = false;
    _selectLocationButton.value = false;
    _markers
        .removeWhere((m) => m.markerId == const MarkerId('selected_marker'));
  }

  void clearResultSearch() {
    _showClearButton.value = false;
    _searchStart.value = false;
    searchController.clear();
    searchFocusNode.unfocus();
    _searchLocations.value = [];
    update();
  }

  Future<Position> getUserLocation(BuildContext context) async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled && context.mounted) {
      showCupertinoModalPopup(
        context: context,
        builder: (_) => const DeviceLocationSettingPopup(),
      );
      throw Exception('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied');
    }

    final position = await Geolocator.getCurrentPosition();
    _centerPosition.value = LatLng(position.latitude, position.longitude);
    return position;
  }

  Future<void> _loadMapStyle() async {
    try {
      const String darkStyle = 'assets/map/dark.json';
      const String lightStyle = 'assets/map/light.json';
      final style = await rootBundle.loadString(
        Get.context!.isDarkMode ? darkStyle : lightStyle,
      );
      _mapStyle.value = style;
    } catch (error, stackTrace) {
      log('Failed to load map style', error: error, stackTrace: stackTrace);
    }
  }

  Future<void> searchForLocation() async {
    _showClearButton.value = true;
    _locationFromMap.value = false;
    final input = searchController.text.trim();

    if (input.isEmpty) {
      clearResultSearch();
      return;
    } else {
      _searchStart.value = true;
      try {
        final response =
            await http.get(Uri.parse('https://photon.komoot.io/api/?q=$input'));
        final data = jsonDecode(response.body) as Map<String, dynamic>;

        if (response.statusCode == 200 && data.containsKey('features')) {
          _searchLocations.value = data['features'] as List;
        }
      } catch (error, stackTrace) {
        log('Search location error', error: error, stackTrace: stackTrace);
        showErrorSnackBar('Failed to search locations');
      } finally {
        _searchStart.value = false;
      }
    }
  }

  Future<void> getLocationDetails(List<dynamic> coordinates) async {
    if (coordinates.length < 2) return;

    final lat = coordinates[1] as double;
    final lng = coordinates[0] as double;
    _selectedLatLng.value = LatLng(lat, lng);

    await googleMapController?.animateCamera(
      CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(lat, lng), zoom: 13.5)),
    );

    _searchLocations.value = [];
    _selectLocationButton.value = true;
  }

  Future<void> addSelectedLocation() async {
    try {
      final latLng = _selectedLatLng.value;
      final newMarker = Marker(
        markerId: const MarkerId('selected_marker'),
        position: latLng,
      );

      addNewMarker(newMarker);

      if (_locationFromMap.value) {
        _selectFromMapLoading.value = true;
        final response = await http.get(Uri.parse(
          'https://photon.komoot.io/reverse?lon=${latLng.longitude}&lat=${latLng.latitude}',
        ));

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body) as Map<String, dynamic>;
          final properties =
              data['features'][0]['properties'] as Map<String, dynamic>;

          _country.value = properties['country']?.toString() ?? '';
          _city.value = properties['city']?.toString() ?? '';
          _addressName.value = properties['name']?.toString() ?? '';

          userLocationText.text =
              '${_country.value} ${_city.value}, ${_addressName.value}';
        }
      }
    } catch (error, stackTrace) {
      log('Add selected location error', error: error, stackTrace: stackTrace);
      showErrorSnackBar('Failed to add location');
    } finally {
      _selectFromMapLoading.value = false;
      _hideBottomSheet.value = true;
      _selectLocationButton.value = false;
      _showClearButton.value = false;
    }
  }

  void clearSelectedLocation() {
    _markers.removeWhere(
      (m) => m.markerId == const MarkerId('selected_marker'),
    );
    _showClearButton.value = false;
    _hideBottomSheet.value = false;
    _selectLocationButton.value = false;
    _saveButtonLoading.value = false;
    userTitleText.clear();
    userLocationText.clear();
  }

  Future<void> saveLocationData() async {
    final title = userTitleText.text.trim();
    if (title.isEmpty) {
      showErrorSnackBar('Please enter location title');
      _saveButtonLoading.value = false;
      return;
    } else {
      final request = LocationRequest(
        country: _country.value,
        city: _city.value,
        location: Location(
          coordinates: [
            _selectedLatLng.value.latitude,
            _selectedLatLng.value.longitude,
          ],
        ),
        additionalInfo: _addressName.value,
        addressTitle: title,
      );

      try {
        final response = await http.post(
          Uri.parse('$baseUrl/address/'),
          body: locationRequestToJson(request),
          headers: prefs.authHeaders,
        );

        if (response.statusCode == 201) {
          addNewMarker(Marker(
            markerId: MarkerId('${_selectedLatLng.value}'),
            position: _selectedLatLng.value,
          ));
          Get.back(result: true);
          showSuccessSnackBar('New location added successfully!');
        }
      } catch (error, stackTrace) {
        log('Save location error', error: error, stackTrace: stackTrace);
        showErrorSnackBar('Failed to save location');
      } finally {
        _saveButtonLoading.value = false;
        userLocationText.clear();
        searchController.clear();
        userTitleText.clear();
        clearResultSearch();
        _hideBottomSheet.value = false;
      }
    }
  }

  Future<void> deleteSpecificAddress(String id) async {
    _deleteLoading.value = true;
    final Uri uri = Uri.parse('$baseUrl/address/$id');
    try {
      final response = await http.delete(uri, headers: prefs.authHeaders);
      final decodedData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        _deleteLoading.value = false;
        showSuccessSnackBar(decodedData['message']);
      } else {
        showErrorSnackBar(decodedData['message']);
      }
    } catch (error) {
      log(error.toString());
    } finally {
      _deleteLoading.value = false;
    }
  }

  Future<void> setDefaultLocation(
    String id,
    String address,
    String title,
    double lat,
    double long,
  ) async {
    Get.back();
    _setDefaultLoading.value = true;
    final Uri uri = Uri.parse('$baseUrl/address/$id/default');
    try {
      final response = await http.patch(uri, headers: prefs.authHeaders);
      final decodedData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        await prefs.saveDefaultLocation({
          'id': id,
          'title': title,
          'address': address,
          'latitude': lat,
          'longitude': long
        });
        preferencesController.updateDeliveryLocation(
          {'id': id, 'title': title, 'address': address},
        );
        Get.back();
        showSuccessSnackBar(decodedData['message']);
      } else {
        showErrorSnackBar(decodedData['message']);
      }
      _setDefaultLoading.value = false;
    } catch (error) {
      log(error.toString());
    } finally {
      _setDefaultLoading.value = false;
    }
  }

  Future<void> viewDeliveryAddress(LatLng coords) async {
    await Get.to(() => const MapPickerScreen());

    Future.delayed(const Duration(seconds: 3), () {
      googleMapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: coords, zoom: 24.4),
        ),
      );
    });
  }

  @override
  void onInit() {
    super.onInit();
    _loadMapStyle();
    if (userLocations.isNotEmpty) {
      for (int i = 0; i < userLocations.length; i++) {
        final location = userLocations[i];
        _markers.add(
          Marker(
            markerId: MarkerId('$i'),
            position: LatLng(
              location.coordinates[0],
              location.coordinates[1],
            ),
          ),
        );
      }
    }
    _markers.add(_centerMarker.value);
  }

  @override
  void onClose() {
    googleMapController?.dispose();
    searchController.dispose();
    userLocationText.dispose();
    userTitleText.dispose();
    super.onClose();
  }
}
