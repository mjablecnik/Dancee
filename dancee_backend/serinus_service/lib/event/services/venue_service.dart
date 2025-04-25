import 'package:dancee_shared/entities.dart';
import 'package:google_geocoding_api/google_geocoding_api.dart';
import 'package:serinus/serinus.dart';
import 'package:serinus_service/config.dart';
import 'package:serinus_service/event/repositories/venue_repository.dart';

class VenueService extends Provider {
  const VenueService(this.venueRepository);
  final VenueRepository venueRepository;

  Future<Venue> createVenueByLocation(Map<String, dynamic> location) async {
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
        coordinates: Coordinates.fromJson(location["coordinates"]),
      );
    } else {
      final latitude = location['coordinates']['latitude'];
      final longitude = location['coordinates']['longitude'];

      final api = GoogleGeocodingApi(ServerConfig.googelApiKey, isLogged: false);
      final reversedSearchResults = await api.reverse('$latitude,$longitude', language: 'en');
      final address = reversedSearchResults.results.first.formattedAddress.split(', ');

      return Venue(
        id: Uuid().v7(),
        name: location["name"],
        street: address.first,
        number: '',
        town: address[1],
        country: address.last,
        postalCode: '',
        coordinates: Coordinates.fromJson(location["coordinates"]),
      );
    }
  }
}
