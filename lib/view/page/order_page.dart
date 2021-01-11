import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          color: Colors.green,
          child: Center(
            child: Text('INI SLIDER IMAGE'),
          ),
        ),
        Expanded(
          child: CustomScrollView(
            shrinkWrap: true,
            slivers: [
              SliverGrid.count(
                crossAxisCount: 2,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                childAspectRatio: 1,
                children: [
                  Container(
                    color: Colors.grey,
                    child: Center(
                      child: Text('GRID ITEM 1'),
                    ),
                  ),
                  Container(
                    color: Colors.grey,
                    child: Center(
                      child: Text('GRID ITEM 2'),
                    ),
                  ),
                  Container(
                    color: Colors.grey,
                    child: Center(
                      child: Text('GRID ITEM 3'),
                    ),
                  ),
                  Container(
                    color: Colors.grey,
                    child: Center(
                      child: Text('GRID ITEM 4'),
                    ),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 200,
                  color: Colors.red,
                  child: Center(
                    child: Text('INI CONTAINER DI BAWAH GRID'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
