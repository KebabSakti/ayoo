import 'package:ayoo/view/widget/ayo_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            Expanded(
              child: AyoSearchBar(),
            ),
            ClipOval(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Icon(
                        FontAwesomeIcons.shoppingBag,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: Container(
        child: Center(
          child: Text('proudct page'),
        ),
      ),
    );
  }
}
