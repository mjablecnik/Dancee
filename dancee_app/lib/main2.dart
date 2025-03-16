import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:flutter/widgets.dart';

import 'entities/event.dart';
import 'entities/venue.dart';

final event = Event(
  id: 1,
  title: "Vánoční party s Hanserem a Vilmou",
  description:
      """Srdečně vás zveme na komorní vánoční párty!\nPřijďte si užít pohodový večer s Hanserem a Vilmou v příjemné atmosféře baru  Maracas. Tato akce je nejen pro naše studenty z kurzů, ale i pro  všechny, kdo si chtějí s námi dát drink, popovídat, zatančit a naladit  se na vánoční pohodu.""",
  venue: Venue(
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
  part: [
    EventPart(name: 'Workshop1', type: EventPartType.workshop, dances: ['Salsa'], lectors: [], djs: []),
    EventPart(name: 'Workshop2', type: EventPartType.workshop, dances: ['Bachata'], lectors: [], djs: []),
    EventPart(name: 'Party', type: EventPartType.party, dances: ['Salsa', 'Bachata'], lectors: [], djs: []),
  ],
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Client client =
      Client()
          .setEndpoint('https://cloud.appwrite.io/v1') // Make sure your endpoint is accessible
          .setProject('dancee') // Your project ID
          .setKey(
            'standard_f43f80673068e2a8bcc499a384297617d3baeff88fde1cc58fd8d323b126c0753a162c8253db7b92bbf574bd1e89086ac1b5fb252b6e563c32bd6a8797459815ce538445a30d1de9d36dd2ad7a3885d180ebaa7ba5a47d7b351bd320c8b514f66cab0432682a1b73ed748435a7a12eb11d4b403536381ee4fd6a4207a55f43b1',
          )
          .setSelfSigned(); // Use only on dev mode with a self-signed SSL cert

  final databases = Databases(client);

  try {
    final data = event.venue.toJson();
    print(data);
    final result = await databases.createDocument(
      databaseId: 'danceedb',
      collectionId: 'venue',
      documentId: ID.unique(),
      data: data,
    );

    print(result);
    //for (var part in event.part) {
    //  await databases.createDocument(
    //    databaseId: 'danceedb',
    //    collectionId: 'event_part',
    //    documentId: ID.unique(),
    //    data: part.toJson(),
    //  );
    //}

    //for (var info in event.info) {
    //  await databases.createDocument(
    //    databaseId: 'danceedb',
    //    collectionId: 'event_part',
    //    documentId: ID.unique(),
    //    data: info.toJson(),
    //  );
    //}

    //await databases.createDocument(
    //  databaseId: 'danceedb',
    //  collectionId: 'event',
    //  documentId: ID.unique(),
    //  data: event.toJson(),
    //);
  } on AppwriteException catch (e) {
    print(e);
  }

  //try {
  //  final documents = await databases.listDocuments(
  //    databaseId: 'danceedb',
  //    collectionId: 'venue',
  //    queries: [Query.search('Name', 'Mar')],
  //  );
  //  for (var e in documents.documents) {
  //    print(e.data);
  //  }
  //} on AppwriteException catch (e) {
  //  print(e);
  //}
}
