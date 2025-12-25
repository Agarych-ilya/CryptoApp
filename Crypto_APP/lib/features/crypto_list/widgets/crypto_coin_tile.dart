import 'package:flutter/material.dart';
import 'package:flutter_application_1/repositories/crypto_coins/models/crypto_coin.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    Key? key,
    required this.coin,
    }) : super(key: key);

  final CryptoCoin coin;
  

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: Image.network(coin.imageUrl, height: 38, width: 38),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
      onTap: () {
        Navigator.of(context).pushNamed('/coin', arguments: coin);
      },
      title: Text(coin.name, style: theme.textTheme.bodyMedium),
      subtitle: Text('${coin.priceUSD.toStringAsFixed(2)} \$', style: theme.textTheme.labelSmall),
    );
  }
}
