import 'package:dancee_shared/clients/surrealdb_client.dart';
import 'package:dancee_shared/entities.dart';
import 'package:serinus/serinus.dart';
import 'package:serinus_service/core/client_factory.dart';

class VenueRepository extends Provider {
  const VenueRepository({required this.aiClient, required this.surrealDB});

  final AiClient aiClient;
  final SurrealDB surrealDB;

  Future<List<Venue>> selectAllVenues() async {
    final venues = (await surrealDB.query(
      r'SELECT * FROM venues ORDER BY name ASC',
    ) as List).first['result'] as List<dynamic>;

    return venues.map((v) => Venue.fromSurrealQl(v)).toList();
  }

  Future<Venue?> selectVenue(Venue venue) async {
    final venues = (await surrealDB.query(
      r'SELECT * FROM venues WHERE name = $name AND street = $street AND town = $town',
      {'name': venue.name, 'street': venue.street, 'town': venue.town},
    ) as List).first['result'] as List<dynamic>;

    if (venues.length > 0) {
      return Venue.fromSurrealQl(venues.first);
    } else {
      return null;
    }
  }

  Future<bool> existsVenue(Venue venue) async {
    final result = await selectVenue(venue);
    return result != null;
  }

  Future<bool> saveVenue(Venue venue) async {
    try {
      await surrealDB.create('venues', venue.toSurrealQl());
      return true;
    } catch (e) {
      return false;
    }
  }
  
  Future<bool> updateVenue(Venue venue) async {
    try {
      await surrealDB.update('venues:u\'${venue.id}\'', venue.toSurrealQl());
      return true;
    } catch (e) {
      return false;
    }
  }
}
