import 'package:ayoo/model/product_model.dart';
import 'package:flutter/material.dart';

class AyoProductDetailStatistic extends StatelessWidget {
  final ProductModel productModel;

  AyoProductDetailStatistic({@required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.only(
            right: 5,
          ),
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(
                color: Colors.grey[200],
              ),
            ),
          ),
          child: Row(
            children: [
              Icon(
                Icons.star,
                color: (productModel.ratingWeightModel != null)
                    ? Colors.amberAccent
                    : Colors.grey[400],
                size: 20,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                (productModel.ratingWeightModel != null)
                    ? productModel.ratingWeightModel.rating.toString()
                    : '0',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                (productModel.ratingWeightModel != null)
                    ? '(${productModel.ratingWeightModel.totalVote})'
                    : '(0)',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            left: 5,
            right: 5,
          ),
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(
                color: Colors.grey[200],
              ),
            ),
          ),
          child: Row(
            children: [
              Text(
                'Dilihat',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                (productModel.viewModel != null)
                    ? '(${productModel.viewModel.totalView})'
                    : '(0)',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            left: 5,
            right: 5,
          ),
          child: Row(
            children: [
              Text(
                'Terjual',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                (productModel.productSaleModel != null)
                    ? "(${productModel.productSaleModel.qtyTotal})"
                    : '(0)',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
