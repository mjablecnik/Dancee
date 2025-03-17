import 'package:surrealdb/surrealdb.dart';

class SurrealDbClient {
  static Future<SurrealDB> init() async {
    final db = SurrealDB('wss://dancee-06apuo0fo5top8llq2otkquju4.aws-euw1.surreal.cloud/rpc');
    db.connect();
    await db.wait();

    final token = await db.signin(user: 'manager', pass: 'I7gN4wEWKvl3');
    await db.authenticate(token);

    await db.use('Development', 'Dancee');
    return db;
  }
}