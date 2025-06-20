import 'dart:developer';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_zone/config/api.dart';
import 'package:food_zone/core/utils/snack_bar.dart';
import 'package:food_zone/features/main/home/data/data_sources/hooks/offers.dart';
import 'package:food_zone/features/main/home/data/models/offers_response.dart';
import 'package:http/http.dart' as http;

/// A custom hook that fetches offers data from the API and provides it to the UI.
///
/// This hook manages the state of the offers data and loading status. It fetches
/// the offers data from the API when the hook is first used and provides a method
/// to re-fetch the data.
///
/// @param limit The maximum number of offers to fetch. Defaults to 4.
/// @returns An instance of [OffersHook] containing the offers data, loading status,
/// and a method to re-fetch the data.
OffersHook? useOffersHook({int limit = 4}) {
  final offers = useState<List<OffersResponse>?>(null);
  final loading = useState<bool>(false);

  /// Fetches the offers data from the API and updates the state.
  ///
  /// This function makes an HTTP GET request to the API to fetch the offers data.
  /// If the request is successful, it updates the [offers] state with the fetched data.
  /// If the request fails, it shows an error snack bar.
  Future<void> fetchOffersData() async {
    loading.value = true;
    final Uri url = Uri.parse('$baseUrl/meal/offers?limit=$limit');
    try {
      final response = await http.get(url);
      if (response.statusCode != 200) {
        showErrorSnackBar('No Offers available.');
        return;
      }
      offers.value = offersResponseFromJson(response.body);
    } catch (error) {
      log(error.toString());
    } finally {
      loading.value = false;
    }
  }

  useEffect(() {
    fetchOffersData();
    return;
  }, []);

  /// Re-fetches the offers data from the API.
  ///
  /// This function can be called to manually re-fetch the offers data.
  void reFetch() {
    fetchOffersData();
  }

  return OffersHook(
    offers: offers.value,
    loading: loading.value,
    reFetch: reFetch,
  );
}
