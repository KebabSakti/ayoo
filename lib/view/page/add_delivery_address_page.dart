import 'package:ayoo/controller/add_delivery_address_page_controller.dart';
import 'package:ayoo/view/widget/ayo_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AddDeliveryAddressPage extends GetView<AddDeliveryAddressPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.grey[800], //change your color here
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/sign.svg',
                height: 70,
              ),
              SizedBox(height: 20),
              Text(
                'Alamat Pengantaran',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 20),
              Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AyoTextFormField(
                      controller: controller.title,
                      hintText: 'Nama Alamat',
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Field tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    AyoTextFormField(
                      controller: controller.name,
                      hintText: 'Nama Penerima',
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Field tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    AyoTextFormField(
                      controller: controller.phone,
                      hintText: 'No telpon',
                      textInputType: TextInputType.number,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Field tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    AyoTextFormField(
                      controller: controller.address,
                      hintText: 'Alamat',
                      maxLines: 4,
                      textInputAction: TextInputAction.newline,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Field tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    FlatButton(
                      onPressed: () {
                        controller.submitForm();
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Get.theme.primaryColor,
                      child: SizedBox(
                        height: 45,
                        child: Center(
                          child: Text(
                            'Simpan',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
