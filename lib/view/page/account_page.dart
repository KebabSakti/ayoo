import 'package:ayoo/controller/account_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AccountPage extends GetView<AccountPageCountroller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () {
          return (controller.customerController.customer.type == 'customer')
              ? CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      title: Text(
                        'Profil',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[800],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Julian Aryo',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  '+6281254982664',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.grey[800],
                                  ),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  'julian.aryo1989@gmail.com',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.grey[800],
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                FontAwesomeIcons.pencilAlt,
                                color: Colors.grey[800],
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 40,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              'Akun',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          MediaQuery.removePadding(
                            context: context,
                            removeLeft: true,
                            removeBottom: true,
                            removeTop: true,
                            removeRight: true,
                            child: ListView(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              children: [
                                ListTile(
                                  onTap: () {},
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 15),
                                  title: Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.cog,
                                        size: 20,
                                        color: Colors.grey[800],
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'Setting',
                                        style: TextStyle(
                                          color: Colors.grey[800],
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  trailing: Icon(
                                    FontAwesomeIcons.angleRight,
                                    size: 16,
                                    color: Colors.grey[800],
                                  ),
                                ),
                                Divider(
                                  height: 1,
                                  color: Colors.grey[400],
                                ),
                                ListTile(
                                  onTap: () {},
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 15),
                                  title: Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.solidBookmark,
                                        size: 20,
                                        color: Colors.grey[800],
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'Alamat Favorit',
                                        style: TextStyle(
                                          color: Colors.grey[800],
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  trailing: Icon(
                                    FontAwesomeIcons.angleRight,
                                    size: 16,
                                    color: Colors.grey[800],
                                  ),
                                ),
                                Divider(
                                  height: 1,
                                  color: Colors.grey[400],
                                ),
                                ListTile(
                                  onTap: () {},
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 15),
                                  title: Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.solidHeart,
                                        size: 20,
                                        color: Colors.grey[800],
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'Produk Favorit',
                                        style: TextStyle(
                                          color: Colors.grey[800],
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  trailing: Icon(
                                    FontAwesomeIcons.angleRight,
                                    size: 16,
                                    color: Colors.grey[800],
                                  ),
                                ),
                                Divider(
                                  height: 1,
                                  color: Colors.grey[400],
                                ),
                                ListTile(
                                  onTap: () {},
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 15),
                                  title: Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.shareAlt,
                                        size: 20,
                                        color: Colors.grey[800],
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'Ajak teman pakai Ayo',
                                        style: TextStyle(
                                          color: Colors.grey[800],
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  trailing: Icon(
                                    FontAwesomeIcons.angleRight,
                                    size: 16,
                                    color: Colors.grey[800],
                                  ),
                                ),
                                Divider(
                                  height: 1,
                                  color: Colors.grey[400],
                                ),
                                ListTile(
                                  onTap: () {},
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 15),
                                  title: Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.solidQuestionCircle,
                                        size: 20,
                                        color: Colors.grey[800],
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'Bantuan',
                                        style: TextStyle(
                                          color: Colors.grey[800],
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  trailing: Icon(
                                    FontAwesomeIcons.angleRight,
                                    size: 16,
                                    color: Colors.grey[800],
                                  ),
                                ),
                                Divider(
                                  height: 1,
                                  color: Colors.grey[400],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 20,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              'Info Lainnya',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          MediaQuery.removePadding(
                            context: context,
                            removeLeft: true,
                            removeBottom: true,
                            removeTop: true,
                            removeRight: true,
                            child: ListView(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              children: [
                                ListTile(
                                  onTap: () {},
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 15),
                                  title: Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.shieldVirus,
                                        size: 20,
                                        color: Colors.grey[800],
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'Kebijakan Privasi',
                                        style: TextStyle(
                                          color: Colors.grey[800],
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  trailing: Icon(
                                    FontAwesomeIcons.angleRight,
                                    size: 16,
                                    color: Colors.grey[800],
                                  ),
                                ),
                                Divider(
                                  height: 1,
                                  color: Colors.grey[400],
                                ),
                                ListTile(
                                  onTap: () {},
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 15),
                                  title: Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.solidListAlt,
                                        size: 20,
                                        color: Colors.grey[800],
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'Ketentuan Layanan',
                                        style: TextStyle(
                                          color: Colors.grey[800],
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  trailing: Icon(
                                    FontAwesomeIcons.angleRight,
                                    size: 16,
                                    color: Colors.grey[800],
                                  ),
                                ),
                                Divider(
                                  height: 1,
                                  color: Colors.grey[400],
                                ),
                                ListTile(
                                  onTap: () {},
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 15),
                                  title: Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.solidStar,
                                        size: 20,
                                        color: Colors.grey[800],
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'Beri Rating',
                                        style: TextStyle(
                                          color: Colors.grey[800],
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  trailing: Icon(
                                    FontAwesomeIcons.angleRight,
                                    size: 16,
                                    color: Colors.grey[800],
                                  ),
                                ),
                                Divider(
                                  height: 1,
                                  color: Colors.grey[400],
                                ),
                                ListTile(
                                  onTap: () {
                                    controller.logout();
                                  },
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 15),
                                  title: Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.signOutAlt,
                                        size: 20,
                                        color: Colors.grey[800],
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'Keluar akun',
                                        style: TextStyle(
                                          color: Colors.grey[800],
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  trailing: Text(
                                    'v 1.0.0',
                                    style: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Divider(
                                  height: 1,
                                  color: Colors.grey[400],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 40,
                      ),
                    ),
                  ],
                )
              : Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/register.svg',
                        width: 300,
                      ),
                      SizedBox(height: 40),
                      Text(
                        'Silahkan login atau daftar untuk akses halaman ini',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FlatButton(
                            onPressed: () {
                              Get.toNamed('/login');
                            },
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            color: Get.theme.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          FlatButton(
                            onPressed: () {
                              Get.toNamed('/register');
                            },
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            color: Get.theme.colorScheme.secondary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'Daftar',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
