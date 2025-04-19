import 'package:dancee_shared/entities.dart';
import 'package:dancee_shared/utils.dart';
import 'package:test/test.dart';

void main() {
  group('Event', () {
    late Event exampleEvent;

    setUp(() {
      exampleEvent = Event(
        id: '123e4567-e89b-12d3-a456-426614174000',
        title: 'Salsa Night Fever',
        description: 'A night of salsa dancing and workshops',
        originalDescription: 'Join us for the hottest salsa night in town with workshops and party!',
        originalUrl: 'https://example.com/events/salsa-night',
        organizer: 'Dance Studio XYZ',
        venue: Venue(
          id: '789e4567-e89b-12d3-a456-426614174001',
          name: 'Grand Ballroom',
          street: '123 Dance Street',
          number: '1',
          town: 'City',
          country: 'Czech Republic',
          postalCode: '12345',
        ),
        dateTimeRange: DateTimeRange(
          start: DateTime(2023, 10, 15, 18, 0),
          end: DateTime(2023, 10, 15, 23, 0),
        ),
        info: [
          EventInfo(type: EventInfoType.price, key: 'entry', value: '15€'),
          EventInfo(type: EventInfoType.url, key: 'tickets', value: 'https://example.com/tickets/salsa-night'),
          EventInfo(type: EventInfoType.text, key: 'dress code', value: 'Casual elegant'),
          EventInfo(type: EventInfoType.text, key: 'email', value: 'info@dancestudioxyz.com'),
        ],
        parts: [
          EventPart(
            name: 'Beginner Salsa Workshop',
            description: 'Learn the basics of salsa dancing',
            type: EventPartType.workshop,
            dances: ['salsa'],
            dateTimeRange: DateTimeRange(start: DateTime(2023, 10, 15, 18, 0), end: DateTime(2023, 10, 15, 19, 30)),
            lectors: ['John Doe', 'Jane Smith'],
            djs: null,
          ),
          EventPart(
            name: 'Salsa Party',
            description: 'Dance the night away with the best salsa music',
            type: EventPartType.party,
            dances: ['salsa', 'bachata'],
            dateTimeRange: DateTimeRange(start: DateTime(2023, 10, 15, 20, 0), end: DateTime(2023, 10, 15, 23, 0)),
            lectors: null,
            djs: ['DJ Salsa King'],
          ),
        ],
      );
    });

    test('toJson() should return valid JSON representation', () {
      final json = exampleEvent.toJson();

      expect(json, isA<Map<String, dynamic>>());
      expect(json['id'], equals('123e4567-e89b-12d3-a456-426614174000'));
      expect(json['title'], equals('Salsa Night Fever'));
      expect(json['venue'].name, equals('Grand Ballroom'));
      expect(json['event_parts'].length, equals(2));
      expect(json['date_time_range']['start'], equals(DateTime(2023, 10, 15, 18, 0).toUtc().toIso8601String()));
      expect(json['date_time_range']['end'], equals(DateTime(2023, 10, 15, 23, 0).toUtc().toIso8601String()));
    });

    test('toSurrealQl() should return valid SurrealQL string', () {
      final surrealQl = exampleEvent.toSurrealQl();

      expect(surrealQl, isA<Map<String, dynamic>>());
      expect(surrealQl['id'], equals("u'123e4567-e89b-12d3-a456-426614174000'"));
      expect(surrealQl['title'], equals('Salsa Night Fever'));
      expect(surrealQl['venue'], equals("venues:u'789e4567-e89b-12d3-a456-426614174001'"));
      expect(surrealQl['event_parts'].length, equals(2));
      expect(surrealQl['date_time_range']['start'], equals(DateTime(2023, 10, 15, 18, 0).toUtc().toIso8601String()));
      expect(surrealQl['date_time_range']['end'], equals(DateTime(2023, 10, 15, 23, 0).toUtc().toIso8601String()));
    });

    test('Event parts should have correct types and data', () {
      expect(exampleEvent.parts.length, equals(2));

      final workshop = exampleEvent.parts[0];
      expect(workshop.type, equals(EventPartType.workshop));
      expect(workshop.name, equals('Beginner Salsa Workshop'));
      expect(workshop.lectors, contains('John Doe'));
      expect(workshop.djs, isNull);

      final party = exampleEvent.parts[1];
      expect(party.type, equals(EventPartType.party));
      expect(party.dances, contains('bachata'));
      expect(party.djs, contains('DJ Salsa King'));
      expect(party.lectors, isNull);
    });

    test('Event info should have correct types and values', () {
      expect(exampleEvent.info.length, equals(4));

      final expectedInfos = [
        {'type': EventInfoType.price, 'key': 'entry', 'value': '15€'},
        {'type': EventInfoType.url, 'key': 'tickets', 'value': 'https://example.com/tickets/salsa-night'},
        {'type': EventInfoType.text, 'key': 'dress code', 'value': 'Casual elegant'},
        {'type': EventInfoType.text, 'key': 'email', 'value': 'info@dancestudioxyz.com'},
      ];

      for (final expected in expectedInfos) {
        final info = exampleEvent.info.firstWhere(
          (info) => info.key == expected['key'] && info.type == expected['type'],
        );
        expect(info.value, equals(expected['value']));
      }
    });

    test('Venue should format address correctly', () {
      final venue = exampleEvent.venue;
      expect(venue.format(), equals('123 Dance Street\u00A01, 12345\u00A0City'));
      expect(venue.format(' - '), equals('123 Dance Street\u00A01 - 12345\u00A0City'));
    });

    test('Venue toSurrealQl() should return valid SurrealQL representation', () {
      final venue = exampleEvent.venue;
      final surrealQl = venue.toSurrealQl();

      expect(surrealQl, isA<Map<String, dynamic>>());
      expect(surrealQl['id'], equals("u'789e4567-e89b-12d3-a456-426614174001'"));
      expect(surrealQl['name'], equals('Grand Ballroom'));
      expect(surrealQl['postal_code'], equals('12345'));
    });
  });
}
