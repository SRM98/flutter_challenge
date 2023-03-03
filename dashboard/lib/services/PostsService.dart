import 'package:http/http.dart';

Uri buildUri(String url, String route, {Map<String, dynamic> queryParameters}) {
  return Uri.https(url, route, queryParameters);
}

Future<Response> getPosts() async {

  Map<String, String> headers = {
    "Content-type": "application/json",
  };

  String url = "jsonplaceholder.typicode.com";
  String route = "/posts";
  Uri uri = buildUri(url, route);

  Response response = await get(uri, headers: headers);
  return response;
}

Future<Response> getPostsByUserId(String id) async {

  Map<String, String> headers = {
    "Content-type": "application/json",
  };

  String url = "jsonplaceholder.typicode.com";
  String route = "/users/${id}/posts";
  Uri uri = buildUri(url, route);

  Response response = await get(uri, headers: headers);
  return response;
}

Future<Response> getCommentsByPostId(String id) async {

  Map<String, String> headers = {
    "Content-type": "application/json",
  };

  String url = "jsonplaceholder.typicode.com";
  String route = "/posts/${id}/comments";
  Uri uri = buildUri(url, route);

  Response response = await get(uri, headers: headers);
  return response;
}


