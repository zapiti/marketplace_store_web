import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketplace_store_web/app/components/tile/base_tile.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';

class PaymentMethodWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BaseListTile(
        leading: Icon(
          Icons.credit_card,
          color: AppThemeUtils.colorPrimary,
        ),
        title: 'Pagamento',
        subtitle: "**** 0521",
        trailing: GestureDetector(
          child: Text(
            'Alterar',
            style: TextStyle(
              color: AppThemeUtils.colorPrimary,
              fontSize: 12,
            ),
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
