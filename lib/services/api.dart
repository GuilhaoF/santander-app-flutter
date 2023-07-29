import '../models/user_model/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; 

class ApiApp {
  static Future<UserModel> fetchUser(int id) async {
    var result = await http.get(Uri.parse(
        "https://digitalinnovationone.github.io/santander-dev-week-2023-api/mocks/find_one.json"));

    if (result.statusCode == 200) {
      // Converta o JSON (String) para um mapa (Map<String, dynamic>)
      Map<String, dynamic> jsonMap = json.decode(result.body);
      
      // Agora você pode usar o método fromJson diretamente
      return UserModel.fromJson(jsonMap);
    } else {
      throw Exception('Falha ao carregar dados do usuário');
    }
  }
}