import 'package:http/http.dart';

abstract class AuthenticationRemoteDataSource {}

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  final Client client;

  AuthenticationRemoteDataSourceImpl({required this.client});
}
