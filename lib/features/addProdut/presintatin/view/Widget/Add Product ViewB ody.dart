import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helpes_function/BuildSnakBar.dart';
import '../../../../../core/widget/Custom_Botton.dart';
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
  late String name, description, code;
  late num price;
  late int expirationMonth, unitAmount, numberOfCaloric;
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
                hinttext: 'Product Name',
                textInputType: TextInputType.text,
                onSaved: (value) {
                  name = value!;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                hinttext: 'Product price',
                textInputType: TextInputType.number,
                onSaved: (value) {
                  price = num.parse(value!);
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                hinttext: 'expirationMonth',
                textInputType: TextInputType.number,
                onSaved: (value) {
                  expirationMonth = int.parse(value!);
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                hinttext: 'numberOfCaloric',
                textInputType: TextInputType.number,
                onSaved: (value) {
                  numberOfCaloric = int.parse(value!);
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                hinttext: 'unitAmount',
                textInputType: TextInputType.number,
                onSaved: (value) {
                  unitAmount = int.parse(value!);
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                hinttext: 'Product code',
                textInputType: TextInputType.number,
                onSaved: (value) {
                  code = value!.toLowerCase();
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                hinttext: 'Product Description',
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
                title: 'Add Product',
                ontap: () {
                  if (fileimage != null) {
                    if (_formkey.currentState!.validate()) {
                      _formkey.currentState!.save();
                      ProductEntity input = ProductEntity(
                          name: name,
                          price: price,
                          code: code,
                          description: description,
                          image: fileimage!,
                          isFeature: isFeature,
                          isOrgnic: isOrganic,
                          expirationMonth: expirationMonth,
                          numberOfCaloric: numberOfCaloric,
                          unitAmount: unitAmount,
                          reviews: []);
                      context.read<AddProductCubit>().addProduct(input);
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  } else {
                    BuildSnakBar(context, 'Please select an image');
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
