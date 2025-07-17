import 'package:dancee_shared/entities.dart';
import 'package:dancee_shared/utils.dart';
import 'package:google_geocoding_api/google_geocoding_api.dart';
import 'package:serinus/serinus.dart';
import 'package:serinus_service/config.dart';
import 'package:serinus_service/event/repositories/venue_repository.dart';

class VenueService extends Provider {
  const VenueService(this.venueRepository);
  final VenueRepository venueRepository;

  Future<List<Venue>> getVenueList() async {
    return venueRepository.selectAllVenues();
  }
  
  Future<bool> updateVenue(Venue venue) async {
    return venueRepository.updateVenue(venue);
  }

  Future<GoogleGeocodingResponse> _geoSearch(Map<String, dynamic> location) {

    final latitude = location['coordinates']['latitude'];
    final longitude = location['coordinates']['longitude'];

    final api = GoogleGeocodingApi(ServerConfig.googelApiKey, isLogged: false);
    return api.reverse('$latitude,$longitude', language: 'en');
  }

  String _getRegion(GoogleGeocodingResponse reversedSearchResults) {
    String? region;
    for (final component in reversedSearchResults.results.first.addressComponents) {
      if (component.types.contains('administrative_area_level_1')) {
        region = component.shortName;
        break;
      }
    }

    return czechRegions.contains(region) ? region! : "Other";
  }

  Future<Venue> createVenueByLocation(Map<String, dynamic> location) async {
    final reversedSearchResults = await _geoSearch(location);
    final region = _getRegion(reversedSearchResults);

    if (location['name'] != null &&
        location['address'] != null &&
        location['city'] != null &&
        location['countryCode'] != null) {
      return Venue(
        id: Uuid().v7(),
        name: location["name"],
        street: location["address"],
        number: '',
        town: location["city"]["name"],
        country: location["countryCode"],
        postalCode: '',
        region: region,
        coordinates: Coordinates.fromJson(location["coordinates"]),
      );
    } else {
      final address = reversedSearchResults.results.first.formattedAddress.split(', ');

      return Venue(
        id: Uuid().v7(),
        name: location["name"],
        street: address.first,
        number: '',
        town: address[1],
        country: address.last,
        postalCode: '',
        region: region,
        coordinates: Coordinates.fromJson(location["coordinates"]),
      );
    }
  }
}
