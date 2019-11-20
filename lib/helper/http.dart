import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Network {
  final String url = 'http://beta.economistdubai.com/api/';

  Future<dynamic> getAllNews() async {
    var responses = await http.get(url);

    if (responses.statusCode == 200) {
      var jsonDecodeResponse = convert.jsonDecode(responses.body);
      return jsonDecodeResponse;
    } else {
      throw 'Network error!';
    }
  }

  Future<dynamic> getAllNewsByLimit(int limit) async {
    var responses = await http.get("$url?limit=$limit");

    if (responses.statusCode == 200) {
      var jsonDecodeResponse = convert.jsonDecode(responses.body);
      return jsonDecodeResponse;
    } else {
      throw 'Network error!';
    }
  }

  Future<dynamic> getFeaturedNews() async {
    var responses =
        await http.get("$url/index.php/Welcome/getFeaturesPost?id=1");
    if (responses.statusCode == 200) {
      var jsonDecodeResponse = convert.jsonDecode(responses.body);
      return jsonDecodeResponse;
    } else {
      throw 'Network error!';
    }
  }

  Future<dynamic> getNewDetail(id) async {
    var responses = await http.get("$url/index.php/Welcome/getNewsByID?id=$id");
    if (responses.statusCode == 200) {
      var jsonDecodeResponse = convert.jsonDecode(responses.body);
      return jsonDecodeResponse;
    } else {
      throw 'Network error!';
    }
  }
}
