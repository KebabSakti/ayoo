import 'package:flutter/material.dart';

class AyoWrapPoductFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Urutkan',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          Wrap(
            direction: Axis.horizontal,
            crossAxisAlignment: WrapCrossAlignment.start,
            spacing: 7,
            runSpacing: -10,
            children: [
              ChoiceChip(
                label: Text(
                  'Harga Terendah',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                selected: false,
                selectedColor: Colors.green.withOpacity(0.5),
                onSelected: (value) {},
              ),
              ChoiceChip(
                label: Text(
                  'Harga Tertinggi',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                selected: false,
                selectedColor: Colors.green.withOpacity(0.5),
                onSelected: (value) {},
              ),
              ChoiceChip(
                label: Text(
                  'Terbaru',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                selectedColor: Colors.green.withOpacity(0.5),
                selected: true,
                onSelected: (value) {},
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Filter',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          Wrap(
            direction: Axis.horizontal,
            crossAxisAlignment: WrapCrossAlignment.start,
            spacing: 7,
            runSpacing: -10,
            children: [
              FilterChip(
                label: Text(
                  'Paling Laku',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                selected: true,
                selectedColor: Colors.green.withOpacity(0.5),
                checkmarkColor: Colors.green,
                onSelected: (value) {},
              ),
              FilterChip(
                label: Text(
                  'Lagi Diskon',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                selected: true,
                selectedColor: Colors.green.withOpacity(0.5),
                checkmarkColor: Colors.green,
                onSelected: (value) {},
              ),
              FilterChip(
                label: Text(
                  'Paling di Cari',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                selected: false,
                selectedColor: Colors.green.withOpacity(0.5),
                checkmarkColor: Colors.green,
                onSelected: (value) {},
              ),
              FilterChip(
                label: Text(
                  'Trending',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                selected: false,
                selectedColor: Colors.green.withOpacity(0.5),
                checkmarkColor: Colors.green,
                onSelected: (value) {},
              ),
              FilterChip(
                label: Text(
                  '4 ke atas',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                avatar: Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 18,
                ),
                selected: false,
                selectedColor: Colors.green.withOpacity(0.5),
                checkmarkColor: Colors.green,
                onSelected: (value) {},
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            'Jenis Pengiriman',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          Wrap(
            direction: Axis.horizontal,
            crossAxisAlignment: WrapCrossAlignment.start,
            spacing: 7,
            runSpacing: -10,
            children: [
              ChoiceChip(
                label: Text(
                  'Instant',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                selected: false,
                selectedColor: Colors.green.withOpacity(0.5),
                onSelected: (value) {},
              ),
              ChoiceChip(
                label: Text(
                  'Terjadwal',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                selected: false,
                selectedColor: Colors.green.withOpacity(0.5),
                onSelected: (value) {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
