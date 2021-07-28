import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadMyStore extends StatelessWidget {
  const LoadMyStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: Shimmer.fromColors(
                highlightColor: Colors.grey[300]!,
                baseColor: Colors.grey[100]!,
                child: Container(
                  height: 200,
                  color: Colors.black,
                  width: double.infinity,
                )),
          ),
          Row(
            children: [
              Container(
                width: 300,
                margin: EdgeInsets.all(20),
                child: Shimmer.fromColors(
                    highlightColor: Colors.grey[300]!,
                    baseColor: Colors.grey[100]!,
                    child: Container(
                      height: 400,
                      width: double.infinity,
                      color: Colors.black,
                    )),
              ),
              Expanded(
                  child: Container(
                margin: EdgeInsets.all(20),
                child: Shimmer.fromColors(
                    highlightColor: Colors.grey[300]!,
                    baseColor: Colors.grey[100]!,
                    child: Container(
                      height: 400,
                      width: double.infinity,
                      color: Colors.black,
                    )),
              ))
            ],
          )
        ],
      ),
    );
  }
}
