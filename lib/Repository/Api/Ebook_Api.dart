import 'dart:convert';


import 'package:ebook/Repository/ModelClass/EbookModel.dart';
import 'package:http/http.dart';

import 'Api_Client.dart';




class EbookApi {
  ApiClient apiClient = ApiClient();


  Future<List<EbookModel>> getinsta( ) async {
    String trendingpath ='https://all-books-api.p.rapidapi.com/getBooks';

    var body = {

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return EbookModel.listFromJson(jsonDecode(response.body));
  }
}