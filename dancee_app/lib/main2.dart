import 'dart:io';

import 'package:surrealdb/surrealdb.dart';
import 'package:uuid/uuid.dart';

import 'entities/event.dart';
import 'entities/venue.dart';

final event = Event(
  id: Uuid().v7(),
  title: "Vánoční party s Hanserem a Vilmou",
  description:
      """Srdečně vás zveme na komorní vánoční párty!\nPřijďte si užít pohodový večer s Hanserem a Vilmou v příjemné atmosféře baru  Maracas. Tato akce je nejen pro naše studenty z kurzů, ale i pro  všechny, kdo si chtějí s námi dát drink, popovídat, zatančit a naladit  se na vánoční pohodu.""",
  venue: Venue(
    id: Uuid().v7(),
    name: "Café Bar Maracas123",
    street: "Nekázanka",
    number: "883/89",
    postalCode: "110 00",
    town: "Praha",
    country: "Česko",
  ),
  since: DateTime(2025, 12, 10, 20, 0, 0),
  until: DateTime(2025, 12, 11, 1, 0, 0),
  info: [
    EventInfo(type: EventInfoType.text, key: "Vstup", value: "Zdarma"),
    EventInfo(type: EventInfoType.text, key: "Šatna", value: "Zdarma"),
    EventInfo(type: EventInfoType.url, key: "Klub", value: "www.facebook.com/cafebar.maracas"),
    EventInfo(type: EventInfoType.url, key: "Odkaz", value: "https://fb.me/e/41aDcOTep"),
  ],
  organizer: "Salsaholics",
  parts: [
    EventPart(name: 'Workshop1', type: EventPartType.workshop, dances: ['Salsa'], lectors: [], djs: []),
    EventPart(name: 'Workshop2', type: EventPartType.workshop, dances: ['Bachata'], lectors: [], djs: []),
    EventPart(name: 'Party', type: EventPartType.party, dances: ['Salsa', 'Bachata'], lectors: [], djs: []),
  ],
);

void main() async {
  final db = SurrealDB('wss://dancee-06apuo0fo5top8llq2otkquju4.aws-euw1.surreal.cloud/rpc');

  db.connect();

  await db.wait();

  final token = await db.signin(user: 'manager', pass: 'I7gN4wEWKvl3');
  await db.authenticate(token);
  await db.use('Development', 'Dancee');

  var result = await db.query("SELECT *, venues.* FROM events");
  print(result);

  // print(event.toJson());
  // await db.create('venues', event.venue.toJson());
  // await db.create('events', event.toJson());

  db.close();
  exit(0);
}
