import 'package:dancee_app/entities/event_part.dart';
import 'package:dancee_app/entities/venue.dart';
import 'package:dancee_app/entities/event.dart';
import 'package:vader_app/vader_app.dart';

import '../../entities/event_info.dart';

class EventRepository extends Repository {
  EventRepository({required super.httpClient, required super.storageClient});

  Future<List<Event>> getEvents() async {
    // final response = await httpClient.request(
    //   path: '/events',
    //   method: HttpMethod.get,
    // );
    // return [...response.data["events"].map((e) => Event.fromJson(e))];
    return Future.value([
      Event(
        id: 1,
        title: "Vánoční party s Hanserem a Vilmou",
        description:
            """Srdečně vás zveme na komorní vánoční párty!\nPřijďte si užít pohodový večer s Hanserem a Vilmou v příjemné atmosféře baru  Maracas. Tato akce je nejen pro naše studenty z kurzů, ale i pro  všechny, kdo si chtějí s námi dát drink, popovídat, zatančit a naladit  se na vánoční pohodu.""",
        venue: Venue(
          name: "Café Bar Maracas",
          street: "Nekázanka",
          number: "883/8",
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
      ),
      Event(
        id: 2,
        title: "Party at Tresor",
        description: """
Začněme nový rok tancem a zábavou! 🎶
Účast úžasných umělců a DJů – nenechte si ujít tuto speciální předehru pravidelné mega párty! 🌟
Dvě taneční zóny:
- Salsa a Bachata v horním patře 💃🕺
- Kizomba v dolním patře 💃
Program:
- 19:30 Workshop: BachaZouk s Carlosem a Fernandou 🕺💃
- 20:30 Začátek párty 🎶
DJs noci:
- DJ Lole: Bachta + Salsa🎧
- DJ Dani: Kizomba + UrbanKiz 🎧
- DJ Marian: Bachta + Salsa🎧
Speciální nabídka:
- Máte narozeniny tento měsíc? Vstup zdarma! 🎂
          """,
        venue: Venue(
          name: "Tresor Club",
          street: "Vinohradská 25",
          number: "1067/25",
          postalCode: "120 00",
          town: "Praha",
          country: "Česko",
        ),
        since: DateTime(2025, 2, 23, 19, 30, 0),
        until: DateTime(2025, 2, 23, 22, 0, 0),
        info: [
          EventInfo(type: EventInfoType.text, key: "Vstup", value: "150 Kč"),
          EventInfo(type: EventInfoType.text, key: "Pouze party", value: "200Kč"),
          EventInfo(type: EventInfoType.url, key: "Odkaz akce", value: "https://fb.me/e/5jGIhoRKE"),
        ],
        organizer: "Salsaholics",
        part: [
          EventPart(name: 'Workshop1', type: EventPartType.workshop, dances: ['Salsa'], lectors: [], djs: []),
          EventPart(name: 'Workshop2', type: EventPartType.workshop, dances: ['Bachata'], lectors: [], djs: []),
          EventPart(name: 'Party', type: EventPartType.party, dances: ['Salsa', 'Bachata'], lectors: [], djs: []),
        ],
      ),
      Event(
        id: 3,
        title: "Latin party in Černá Labuť",
        description:
            """Připravte se na další taneční party na Černá Labuť Party Edition! Připojte se k nám v neděli 23. února na noc plnou přátel, skvělé hudby a DJ Lusithana. Nenechte si to ujít!
          
🔥 16:45 - 18:00 WORKSHOPY
➡ Bachata Dominicana (Tom a Jolly): Open Level (bez úplných začátečníků—musíte znát základní kroky bachaty, základní otočky a základní změny směru).
➡ UrbanKiz (Vali a Kačul): Open Level (bez úplných začátečníků—musíte znát základní kroky a saidu).

🎶 18:00 - 22:00 PARTY
Salsa + Bachata místnost: DJ Lusithano
UrbanKiz + Zouk místnost: DJ PLAYLIST 😉 Playlist vytvořený ve spolupráci s učiteli UrbanKiz a Zouk a nadšenci z ČR (Míla Rabová, Radim Honcha, Lucia Kubašová, Jakub Bureš, Vališ Stojčev, Eva Hrnciarová a další).
          """,
        venue: Venue(
          name: "Černá labuť Art & Event Gallery",
          street: "Na Poříčí",
          number: "1067/25",
          postalCode: "110 00",
          town: "Praha 1 - Nové Město",
          country: "Česko",
        ),
        since: DateTime(2025, 2, 23, 18, 0, 0),
        until: DateTime(2025, 2, 23, 22, 0, 0),
        info: [
          EventInfo(type: EventInfoType.text, key: "Workshop a party", value: "300Kč"),
          EventInfo(type: EventInfoType.text, key: "Pouze party", value: "200Kč"),
          EventInfo(type: EventInfoType.url, key: "Registrace", value: "https://dd.isportsystem.cz/"),
          EventInfo(type: EventInfoType.url, key: "Odkaz akce", value: "https://fb.me/e/7Hv1DaKDT"),
        ],
        organizer: "Salsaholics",
        part: [
          EventPart(name: 'Workshop1', type: EventPartType.workshop, dances: ['Salsa'], lectors: [], djs: []),
          EventPart(name: 'Workshop2', type: EventPartType.workshop, dances: ['Bachata'], lectors: [], djs: []),
          EventPart(name: 'Party', type: EventPartType.party, dances: ['Salsa', 'Bachata'], lectors: [], djs: []),
        ],
      ),
      Event(
        id: 4,
        title: "Latin party in Černá Labuť",
        description: """
Social Dance Practice
Get ready to move, groove, and vibe with us! The right time has come! We’re turning up the heat with Caribbean beats and good vibes. 🤩
From the passionate steps of Dominican Bachata to the lively energy of Merengue, the classic elegance of Son, the playful Cha-cha, and the romantic flow of Bolero—this is your chance to jump into the heart and soul of these iconic dances. PS: If you have any other ROOTS wishes, we’re happy to make them come true! 😉
          """,
        venue: Venue(
          name: "Studio DanceDifferent",
          street: "Fügnerovo nám.",
          number: "5",
          postalCode: "120 00",
          town: "Praha - Nové město",
          country: "Česko",
        ),
        since: DateTime(2025, 2, 18, 19, 0, 0),
        until: DateTime(2025, 2, 18, 21, 0, 0),
        info: [
          EventInfo(type: EventInfoType.text, key: "Vstupné", value: "Dobrovolné"),
          EventInfo(type: EventInfoType.text, key: "Pouze party", value: "200Kč"),
          EventInfo(type: EventInfoType.url, key: "Odkaz akce", value: "https://fb.me/e/5hp2XV6GA"),
        ],
        organizer: "Salsaholics",
        part: [
          EventPart(name: 'Workshop1', type: EventPartType.workshop, dances: ['Salsa'], lectors: [], djs: []),
          EventPart(name: 'Workshop2', type: EventPartType.workshop, dances: ['Bachata'], lectors: [], djs: []),
          EventPart(name: 'Party', type: EventPartType.party, dances: ['Salsa', 'Bachata'], lectors: [], djs: []),
        ],
      ),
      Event(
        id: 6,
        title: "UNITED Bachata Party",
        description: """
Join us for the first UNITED Bachata Party in 2025 on International Singles Awareness Day 💘 15.02.2025
Single or in couple, everyone is welcome!! 

Party Theme 💘 Singles Day
Dress code:
🤍 Sigles - White
🖤 Married/Taken - Black
❤ It's complicated - Red
💛 Polyamory

Bachata & Salsa party starts at 22:00 right after the workshops 🥳
What to expect? 🤩
💘 UNITED atmosphere
💘 2 Floors of dancing
💘 100% bachata music in the main room
💘 100% Salsa in the second room 🎶
💘 2 Bachata workshops and 1 Salsa workshop
💘 Air-conditioned dance floors
💘 Cloak room free of charge
💘 Awesome dancers United in one spot 💃🕺
💘 Fresh drinks and cocktails 🍹
💘 Many special guests and amazing advance dancers
💘 Festival Vibes

Workshops Schedule 💣💥
20:15 - 21:00 Bachata Deep Technique by Jorge y Mónica
21:00 - 21:45 Bachata Fusion by Yatin y Nikol
21:00 - 21:45 Salsa Fusion On 1 by Jesús Escobar (Not recomended for beginners)
We will also have our amazing International DJ Momolatino ready to play the bachata hits you love the most in the bachata room 🥳
And of course, the great and only Dj Lole in the salsa room 🎵💥
          """,
        venue: Venue(
          name: "Vavruška Dance School",
          street: "Karlovo nám.",
          number: "317/5",
          postalCode: "110 00",
          town: "Praha",
          country: "Česko",
        ),
        since: DateTime(2025, 2, 23, 20, 15, 0),
        until: DateTime(2025, 2, 24, 3, 0, 0),
        info: [
          EventInfo(type: EventInfoType.text, key: "Workshop a party", value: "300Kč"),
          EventInfo(type: EventInfoType.url, key: "Odkaz akce", value: "https://fb.me/e/2I1kgITdO"),
        ],
        organizer: "Salsaholics",
        part: [
          EventPart(name: 'Workshop1', type: EventPartType.workshop, dances: ['Salsa'], lectors: [], djs: []),
          EventPart(name: 'Workshop2', type: EventPartType.workshop, dances: ['Bachata'], lectors: [], djs: []),
          EventPart(name: 'Party', type: EventPartType.party, dances: ['Salsa', 'Bachata'], lectors: [], djs: []),
        ],
      ),

      Event(
        id: 7,
        title: "100% Salsa party",
        description: """
Program ✨
🕔18:00-19:00 ➡️ Otevřená lekce salsy se Kseniou Chkalovou 💃🕺
https://www.facebook.com/kseniamotion

🕖19:00-22:00: 100% salsa party 🎹🪇🪘
🔊 Dj Lole + Dj Vicky 🎧
https://www.facebook.com/DjLolePrague
https://www.facebook.com/viktoriq.markova.7
          """,
        venue: Venue(
          name: "Bowlers Karlín",
          street: "Sokolovská",
          number: "713/111c",
          postalCode: "186 00",
          town: "Praha 8 - Invalidovna",
          country: "Česko",
        ),
        since: DateTime(2025, 2, 23, 18, 0, 0),
        until: DateTime(2025, 2, 23, 22, 0, 0),
        info: [
          EventInfo(type: EventInfoType.text, key: "Lekce", value: "150Kč"),
          EventInfo(type: EventInfoType.text, key: "Party", value: "150Kč"),
          EventInfo(type: EventInfoType.text, key: "Lekce + party", value: "250Kč"),
          EventInfo(type: EventInfoType.url, key: "Odkaz akce", value: "https://fb.me/e/5oPUd3GER"),
        ],
        organizer: "Salsaholics",
        part: [
          EventPart(name: 'Workshop123', type: EventPartType.workshop, dances: ['Salsa'], lectors: [], djs: []),
        ],
      ),
    ]);
  }
}
