import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketplace_store_web/app/components/tile/base_tile.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';

class AddressWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BaseListTile(
        leading: Icon(
          Icons.location_on,
          color: AppThemeUtils.colorPrimary,
        ),
        title: 'Entrega',
        subtitle: "Av. Gerson Chagas, 60 ,Jd. Cidade Atlantica",
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
