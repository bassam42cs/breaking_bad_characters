
import 'package:breaking_bad/constants/strings.dart';
import 'package:dio/dio.dart';

import '../models/character.dart';
class CharactersWebServices{
  late Dio dio;

  CharactersWebServices(){
    BaseOptions options=BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 1),
      receiveTimeout: const Duration(seconds: 1),
      receiveDataWhenStatusError: true,
    );

     dio =Dio(options);
  }


Future<List<dynamic>>getAllCharacters()async{
  try{
    Response response = await dio.get("character");
    return response.data;
  }catch(e){
    print(e.toString());
    return [];
  }
}

}