import 'package:ayoo/controller/register_page_controller.dart';
import 'package:ayoo/view/widget/ayo_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class RegisterPage extends GetView<RegisterPageController> {
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
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/register_other.svg',
                width: 200,
              ),
              SizedBox(height: 20),
              Text(
                'Daftar Baru',
                textAlign: TextAlign.center,
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
                      controller: controller.nameField,
                      hintText: 'Nama',
                      textInputType: TextInputType.name,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Field tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    AyoTextFormField(
                      controller: controller.phoneField,
                      hintText: 'No Telp',
                      textInputType: TextInputType.phone,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Field tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    AyoTextFormField(
                      controller: controller.passwordField,
                      hintText: 'Password',
                      obscureText: true,
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
                        controller.register();
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Get.theme.primaryColor,
                      child: SizedBox(
                        height: 45,
                        child: Center(
                          child: Text(
                            'Daftar',
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
