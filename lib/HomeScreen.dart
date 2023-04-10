import 'dart:convert';

import 'package:coin_list/WSConstants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'HttpRequest.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> _cryptos = [];



  Future<void> _loadCryptoData() async {
    final response = await HttpRequestA(WSConstants.URL_BASE).get('coins/markets?vs_currency=usd&order=market_cap_desc&per_page=30&page=1&sparkline=false');
      setState(() {
        _cryptos = response;
      });

  }

  @override
  void initState() {
    super.initState();
    _loadCryptoData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("Bitcoin"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Minha Carteira',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("0.00",style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                      ) )
                    ],
                  ),
                )
                ),

                SizedBox(width: 8,),

                Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.orangeAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Meus Bitcoins',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("0.0082",style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                          )
                          )
                        ],
                      ),
                    )
                ),
              ],
            ),

            SizedBox(width: 16,),

            Expanded(child: SingleChildScrollView(
              child: _cryptos.isNotEmpty
                  ? ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _cryptos.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Image.network(_cryptos[index]['image']),
                    title: Text(_cryptos[index]['name']),
                    subtitle: Text('\$${_cryptos[index]['current_price']}'),
                    onTap: (){},
                  );
                },
              )
                  : Center(
                  child: CircularProgressIndicator(
                color: Colors.deepOrange,
              )
              ),
            ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.deepOrange ,
        unselectedItemColor: Colors.black54,
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.deepOrange ,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Estáticas ',
            backgroundColor: Colors.deepOrange ,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Pesquisa',
            backgroundColor: Colors.deepOrange ,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
            backgroundColor: Colors.deepOrange ,
          ),
        ],
      ),
    );
  }
}
