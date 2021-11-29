import 'package:dio/dio.dart';
class ApiCalls{

  Future<Map> getDataFromServer() async {
    Dio dio = Dio();
    Response response = await dio.get('https://api.bottomstreet.com/forex/technical?forex_name=USDINR');
    Map serverData = response.data;

    // print(serverData['1min']['pivot_points']['classic'].forEach((k,v) => print(k)));
    return serverData;
}
}