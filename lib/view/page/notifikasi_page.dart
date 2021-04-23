import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotifikasiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Notif> notifs = [
      Notif(
        title: 'Pembayaran Berhasil',
        status: true,
        time: '1 menit yang lalu',
        content:
            'Pembayaran untuk order dengan no #16022021000003, metode pembayaran E-WALLET DANA berhasil di bayarkan',
      ),
      Notif(
        title: 'Pembayaran Berhasil',
        status: false,
        time: '4 jam yang lalu',
        content:
            'Pembayaran untuk order dengan no #16022021000001, metode pembayaran E-WALLET OVO berhasil di bayarkan',
      ),
      Notif(
        title: 'Pembayaran Gagal',
        status: false,
        time: '5 jam yang lalu',
        content:
            'Pembayaran untuk order dengan no #16022021000003, metode pembayaran E-WALLET DANA gagal, klik untuk detail',
      ),
      Notif(
        title: 'Order Batal',
        status: false,
        time: '2 hari yang lalu',
        content: 'Order dengan no order #16022021000003 di batalkan oleh anda',
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'Notifikasi',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      body: ListView.separated(
        itemCount: notifs.length,
        separatorBuilder: (context, index) => Divider(height: 1),
        itemBuilder: (context, index) {
          return Ink(
            color: (notifs[index].status) ? Colors.grey[100] : Colors.white,
            child: ListTile(
              onTap: () {},
              isThreeLine: true,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              title: Text(
                notifs[index].title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notifs[index].content,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.clock,
                        color: Colors.grey[600],
                        size: 12,
                      ),
                      SizedBox(width: 6),
                      Text(
                        notifs[index].time,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              trailing: (notifs[index].status)
                  ? ClipOval(
                      child: Container(
                        height: 10,
                        width: 10,
                        color: Colors.red,
                      ),
                    )
                  : SizedBox.shrink(),
            ),
          );
        },
      ),
    );
  }
}

class Notif {
  String title;
  String content;
  bool status;
  String time;

  Notif({
    this.title,
    this.content,
    this.status,
    this.time,
  });
}
