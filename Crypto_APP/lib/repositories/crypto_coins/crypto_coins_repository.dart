import 'package:dio/dio.dart';
import 'package:flutter_application_1/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:flutter_application_1/repositories/crypto_coins/models/crypto_coin.dart';

class CryptoCoinsRepository implements AbstractCoinsRepository{
  CryptoCoinsRepository({
    required this.dio,
  });
  final Dio dio;
 

  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await dio.get(
    'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,SOL,USDT,DOGE&tsyms=USD');
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final cryptoCoinList = dataRaw.entries
      .map((e) {
        final usdData = (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
        final price = usdData['PRICE'];
        final imageUrl = usdData['IMAGEURL'];
        return CryptoCoin(
          name: e.key,
          priceUSD: price,
          imageUrl: 'https://www.cryptocompare.com/$imageUrl',
        );
      }).toList();
    return cryptoCoinList;
  }
}