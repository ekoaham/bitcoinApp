import 'package:flutter/material.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {


  String selectedCurrency = 'INR';
  dynamic rateB = '?';
  dynamic rateE = '?';
  dynamic rateL = '?';

  void getDataB(selectedCurrency) async{
    DataHouse dataHouse = DataHouse(selectedCurrency);
    dynamic exchg = await dataHouse.getActualDataBTC();
    print(exchg);
    double nRate = exchg ['rate'];
    // rateB = nRate.toInt();
    setState(() {
      rateB = nRate.toInt();
    });
  }

  void getDataE(selectedCurrency) async{
    DataHouse dataHouse = DataHouse(selectedCurrency);
    dynamic exchg = await dataHouse.getActualDataETH();
    print(exchg);
    double nRate = exchg ['rate'];
    // rateE = nRate.toInt();
    setState(() {
      rateE = nRate.toInt();
    });
  }

  void getDataL(selectedCurrency) async{
    DataHouse dataHouse = DataHouse(selectedCurrency);
    dynamic exchg = await dataHouse.getActualDataLTC();
    print(exchg);
    double nRate = exchg ['rate'];
    // rateL = nRate.toInt();
    setState(() {
      rateL = nRate.toInt();
    });
  }

  List<DropdownMenuItem<String>> getItems(){
    List<DropdownMenuItem<String>> newItems = [];
    for(String i in currenciesList){
      DropdownMenuItem<String> newL = DropdownMenuItem(
        child: Text(i),
        value: i,
      );

      newItems.add(newL);
    }
    return newItems;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ' '$rateB' '$selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 5.0, 5.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 ETH = ' '$rateE' '$selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 5.0, 5.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 LTC = ' '$rateL' '$selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton<String>(
              value: selectedCurrency,
                items: getItems(),
                onChanged: (value){
              setState(() {
                selectedCurrency = value!;
              });
              getDataB(selectedCurrency);
              getDataE(selectedCurrency);
              getDataL(selectedCurrency);
            },
            ),
          ),
        ],
      ),
    );
  }
}