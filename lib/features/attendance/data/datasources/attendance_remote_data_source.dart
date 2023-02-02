import 'package:http/http.dart';

abstract class AttendanceRemoteDataSource {}

class AttendanceRemoteDataSourceImpl implements AttendanceRemoteDataSource {
  final Client client;

  AttendanceRemoteDataSourceImpl({required this.client});
}
