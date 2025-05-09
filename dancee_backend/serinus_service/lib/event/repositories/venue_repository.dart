import 'dart:convert';

import 'package:dancee_shared/clients/surrealdb_client.dart';
import 'package:dancee_shared/entities.dart';
import 'package:serinus/serinus.dart';
import 'package:serinus_service/config.dart';
import 'package:serinus_service/event/enums.dart';
import 'package:serinus_service/core/client_factory.dart';
import 'package:vader_core/clients/logger.dart';
import 'package:google_geocoding_api/google_geocoding_api.dart';

import '../event_queries.dart';

class VenueRepository extends Provider {
  const VenueRepository({required this.aiClient, required this.surrealDB});

  final AiClient aiClient;
  final SurrealDB surrealDB;

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
}
