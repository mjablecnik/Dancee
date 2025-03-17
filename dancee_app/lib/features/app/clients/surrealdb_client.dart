import 'package:dancee_app/config.dart';
import 'package:surrealdb/surrealdb.dart';

class SurrealDbClient {
  static Future<SurrealDB> init(SurrealDbConfig config) async {
    final db = SurrealDB(config.address);
    db.connect();
    await db.wait();

    final token = await db.signin(user: config.user, pass: config.password);
    await db.authenticate(token);

    await db.use(config.namespace, config.database);
    return db;
  }
}