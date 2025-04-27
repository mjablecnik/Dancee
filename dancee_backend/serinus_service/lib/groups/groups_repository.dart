import 'package:dancee_shared/clients/surrealdb_client.dart';
import 'package:serinus/serinus.dart';

class GroupsRepository extends Provider {
  const GroupsRepository(this.surrealDB);

  final SurrealDB surrealDB;

  Future<List<String>> getAllGroups() async {
    final groups = await surrealDB.query(r'SELECT * FROM groups ORDER BY updated_at ASC') as List;
    return (groups.first['result'] as List<dynamic>).map((e) => e['url'] as String).toList();
  }

  Future<bool> existsGroup(String url) async {
    final groups = (await surrealDB.query(
      r'SELECT * FROM groups WHERE url = $url',
      {'url': url},
    ) as List).first['result'] as List<dynamic>;

    return groups.length > 0;
  }


  Future<bool> updateGroup(String url) async {
    final groups = (await surrealDB.query(
      r'UPDATE groups SET updated_at = time::now() WHERE url = $url',
      {'url': url},
    ) as List).first['result'] as List<dynamic>;

    return groups.length > 0;
  }

  Future<bool> addGroup(String url) async {
    try {
      if (!await existsGroup(url)) {
        await surrealDB.create('groups', {'url': url, 'type': 'facebook'});
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
