import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helpes_function/BuildSnakBar.dart';
import '../../../../../core/widget/Custom_Botton.dart';
import '../../../../../core/widget/dropdownTextFormField.dart';
import '../../../domains/entitys/ProductEntity.dart';
import '../maneger/cubit/add_product_cubit.dart';
import 'CustomImageFiled.dart';
import 'CustomTextField.dart';
import 'IsFeatureItem.dart';
import 'Is_Organic.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String name, description, code, catogry;
  late num price;
  late double numberOfCaloric;
  File? fileimage;
  bool isFeature = false;
  bool isOrganic = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              CustomTextFormField(
                labeltext: 'اسم المنتج',
                textInputType: TextInputType.text,
                onSaved: (value) {
                  name = value!;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                labeltext: 'السعر',
                textInputType: TextInputType.number,
                onSaved: (value) {
                  price = num.parse(value!);
                },
              ),
              const SizedBox(
                height: 16,
              ),
              // CustomTextFormField(
              //   hinttext: 'الكميه',
              //   textInputType: TextInputType.number,
              //   onSaved: (value) {
              //     unitAmount = value!;
              //   },
              // ),
              const SizedBox(
                height: 16,
              ),
              DropdownTextFormField(
                items: const [
                  'ساندوتشات',
                  'مشوبات بالوزن',
                  'كريبات',
                  'مشروبات',
                  'وجبات ارز',
                  'المقبلات',
                  'الصواني',
                  'برجر بيف',
                  'برجر تشكن',
                  'ساندوتشات شاورما',
                  'وجبات شاورما',
                  'شاورما بالوزن',
                  'بيتزا',
                ],
                label: 'الصنف',
                onChanged: (val) {
                  catogry = val;
                },
              ),
              const SizedBox(
                height: 16,
              ),

              CustomTextFormField(
                labeltext: 'كود المنتج',
                textInputType: TextInputType.number,
                onSaved: (value) {
                  code = value!.toLowerCase();
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                labeltext: 'وصف المنتج',
                textInputType: TextInputType.text,
                maxLines: 5,
                onSaved: (value) {
                  description = value!;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              IsFeatureCheckBox(changed: (value) {
                isFeature = value;
              }),
              const SizedBox(
                height: 16,
              ),
              IsOrganicCheckBox(changed: (value) {
                isOrganic = value;
              }),
              const SizedBox(
                height: 16,
              ),
              CustomImageFiled(
                onValueChange: (value) {
                  fileimage = value;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CustomBotton(
                title: 'اضافة منتج',
                ontap: () {
                  if (fileimage != null) {
                    if (_formkey.currentState!.validate()) {
                      _formkey.currentState!.save();
                      ProductEntity input = ProductEntity(
                          name: name,
                          price: price,
                          code: code,
                          description: description,
                          catogry: catogry,
                          image: fileimage!,
                          isFeature: isFeature,
                          isOrgnic: isOrganic,
                          reviews: []);
                      context.read<AddProductCubit>().addProduct(input);
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  } else {
                    BuildSnakBar(context, 'حدد الصوره',
                        type: SnackbarType.warning);
                  }
                },
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
