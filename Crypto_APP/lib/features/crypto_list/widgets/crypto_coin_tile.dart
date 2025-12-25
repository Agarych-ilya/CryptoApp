import 'package:flutter/material.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({super.key, required this.coinName});

  final String coinName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: Image.asset('assets/Image/bitcoin.png', height: 45, width: 45),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
      onTap: () {
        Navigator.of(context).pushNamed('/coin', arguments: coinName);
      },
      title: Text(coinName, style: theme.textTheme.bodyMedium),
      subtitle: Text('200000\$', style: theme.textTheme.labelSmall),
    );
  }
}
