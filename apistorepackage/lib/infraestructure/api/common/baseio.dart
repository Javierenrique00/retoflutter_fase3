import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

import 'paths.dart';

class Baseio<T> {

  final Function (dynamic) serializer;

  Baseio({required this.urlpath, required this.serializer});

  final String urlpath;

  Future<Either<String, List<T>>> getAll() async {
    try{
      var url = Uri.https(Paths.urlEndpoint, urlpath, {'q': '{https}'});
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponseList = convert.jsonDecode(response.body) as List<dynamic>;
        final List<T> resultList = [];
        for(final element in jsonResponseList){
            final conv = serializer(element);
            resultList.add(conv);
        }
        return right(resultList);
      } else {
        return left(response.statusCode.toString());
      }
    }catch(error){
      return left(error.toString());
    }
  }

  Future<Either<String, T>> getSingle(int id) async {
    try{
      var url = Uri.https(Paths.urlEndpoint, '$urlpath/$id', {'q': '{https}'});
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
        final conv = serializer(jsonResponse);
        return right(conv);
      } else {
        return left(response.statusCode.toString());
      }
    }catch(error){
        return left(error.toString());
    }
  }

}