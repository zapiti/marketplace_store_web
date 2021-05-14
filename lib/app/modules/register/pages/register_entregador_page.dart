
import 'package:flutter/material.dart';
import 'package:marketplace_store_web/app/components/empty/empty_view.dart';
import 'package:marketplace_store_web/app/utils/image/image_path.dart';

class RegisterEntregadorPage  extends StatefulWidget {
  @override
  _RegisterEntregadorPageState createState() => _RegisterEntregadorPageState();
}

class _RegisterEntregadorPageState extends State<RegisterEntregadorPage> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: EmptyView(ImagePath.imageEmpty,"Em construção") ,),);
  }
}
