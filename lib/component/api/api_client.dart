import 'package:dio/dio.dart';
import '../api/models/friends_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('?results=200')
  Future<FriendsResponse> getListData();
}
