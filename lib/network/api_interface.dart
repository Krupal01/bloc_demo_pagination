import 'package:http/http.dart' as Http;

import '../model/user_list.dart';
import '../model/user_model.dart';

class ApiInterface {
  var BASE_URL = 'https://jsonplaceholder.typicode.com/';

  Future<List<User>> getAllUser(int page) async {
    final uri = Uri.parse('${BASE_URL}posts?userId=$page');
    final response = await Http.get(uri);

    if (response.statusCode == 200) {
      final result = userListFromJson(response.body);
      return result;
    } else {
      throw "something went wrong with status code ${response.statusCode}";
    }
  }
}
