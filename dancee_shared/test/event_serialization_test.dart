import 'package:test/test.dart';
import 'package:dancee_shared/entities/venue.dart';
import 'package:dancee_shared/entities/event.dart';
import 'package:date_time/date_time.dart';

void main() {
  group('Event serialization only', () {
    final venue = Venue(
      id: '123e4567-e89b-12d3-a456-426614174000',
      name: 'Kongresové centrum',
      street: '5. května',
      number: '65',
      town: 'Praha',
      country: 'Česká republika',
      postalCode: '14000',
    );

    final eventPart = EventPart(
      name: 'Páteční party',
      description: 'Hraje DJ Latino',
      type: EventPartType.party,
      dances: ['Salsa', 'Bachata'],
      dateTimeRange: DateTimeRange(
        start: DateTime.utc(2025, 5, 16, 21, 0),
        end: DateTime.utc(2025, 5, 17, 2, 0),
      ),
      djs: ['DJ Latino'],
    );

    final eventInfo = EventInfo(
      type: EventInfoType.text,
      key: 'dresscode',
      value: 'Casual',
    );

    final event = Event(
      id: 'e123e4567-e89b-12d3-a456-426614174999',
      title: 'Tanec Praha',
      description: 'Velký taneční festival v srdci Evropy.',
      originalDescription: 'Big dance festival in the heart of Europe.',
      originalUrl: 'https://example.com/tanec-praha',
      organizer: 'Tanec Praha z.s.',
      venue: venue,
      dateTimeRange: DateTimeRange(
        start: DateTime.utc(2025, 5, 16, 18, 0),
        end: DateTime.utc(2025, 5, 18, 23, 59),
      ),
      info: [eventInfo],
      parts: [eventPart],
    );

    test('Event toJson contains expected keys', () {
      final json = event.toJson();
      expect(json, containsPair('title', event.title));
      expect(json, contains('venue'));
      expect(json['event_parts'], isA<List>());
      expect(json['date_time_range'], isA<Map>());
      expect(json['date_time_range']['start'], isA<String>());
      expect(json['date_time_range']['end'], isA<String>());
    });

    test('Venue toJson contains expected structure', () {
      final json = venue.toJson();
      expect(json['name'], equals('Kongresové centrum'));
      expect(json['postal_code'], equals('14000'));
    });

    test('EventInfo toJson contains expected values', () {
      final json = eventInfo.toJson();
      expect(json['type'], equals('text'));
      expect(json['key'], equals('dresscode'));
    });

    test('EventPart toJson includes nested date_time_range', () {
      final json = eventPart.toJson();
      expect(json['name'], equals('Páteční party'));
      expect(json['date_time_range'], isA<Map>());
      expect(json['date_time_range']['start'], isA<String>());
      expect(json['date_time_range']['end'], isA<String>());
    });

    test('Event toSurrealQl serializes id and venue correctly', () {
      final surreal = event.toSurrealQl();
      expect(surreal['id'], equals("u'${event.id}'"));
      expect(surreal['venue'], equals("venues:u'${venue.id}'"));
    });
  });
}
