
import 'dart:io';

import 'package:serinus/serinus.dart';
import 'package:serinus_service/core/api_response.dart';
import 'package:serinus_service/vader_server.dart';

import 'groups_repository.dart';

class GroupsController extends Controller {
  GroupsController({super.path = '/groups'}) {
    on(Route.get('/'), _getGroups);
    on(Route.post('/'), _addGroup);
  }

  Future<ApiResponse> _getGroups(RequestContext context) async {
    final allGroups = await injector.use<GroupsRepository>().getAllGroups();
    context.res.contentType = ContentType.json;
    return SuccessResponse.ok(data: allGroups);
  }

  Future<ApiResponse> _addGroup(RequestContext context) async {
    final url = context.body.formData!.fields['url'] as String;
    await injector.use<GroupsRepository>().addGroup(url);
    context.res.contentType = ContentType.json;

    return SuccessResponse.ok();
  }
}
