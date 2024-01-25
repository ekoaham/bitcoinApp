import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];
const String prefixB = 'https://rest.coinapi.io/v1/exchangerate/btc';
const String prefixL = 'https://rest.coinapi.io/v1/exchangerate/ltc';
const String prefixE = 'https://rest.coinapi.io/v1/exchangerate/eth';
const String aKey = '6FB84609-F1EF-4E9B-8D90-FB4C90D227EB';



const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class DataHouse{
  String currency;
  DataHouse(this.currency);

  Future<dynamic> getActualDataBTC() async{
    String cUrl = 'https://rest.coinapi.io/v1/exchangerate/btc/$currency?apikey=6FB84609-F1EF-4E9B-8D90-FB4C90D227EB';
    NetworkingHelper networkingHelper = NetworkingHelper(cUrl);

    var exchangeData = await networkingHelper.getData();
    // print(exchangeData);
    return exchangeData;
  }

  Future<dynamic> getActualDataLTC() async{
    String cUrl = 'https://rest.coinapi.io/v1/exchangerate/ltc/$currency?apikey=6FB84609-F1EF-4E9B-8D90-FB4C90D227EB';
    NetworkingHelper networkingHelper = NetworkingHelper(cUrl);

    var exchangeData = await networkingHelper.getData();

    return exchangeData;
  }

  Future<dynamic> getActualDataETH() async{
    String cUrl = 'https://rest.coinapi.io/v1/exchangerate/eth/$currency?apikey=6FB84609-F1EF-4E9B-8D90-FB4C90D227EB';
    NetworkingHelper networkingHelper = NetworkingHelper(cUrl);

    var exchangeData = await networkingHelper.getData();

    return exchangeData;
  }
}


class NetworkingHelper{
  final String url;

  NetworkingHelper(this.url);

  Future getData() async{
    Response response = await get(Uri.parse(url));
    if(response.statusCode==200){
      String data = response.body;
      var decodedData = jsonDecode(data);

      return decodedData;
    }
    else{
      print(response.statusCode);
    }
  }
}