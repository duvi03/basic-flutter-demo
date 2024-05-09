import 'package:flutter/material.dart';
import 'package:flutter_learning_demo/core/constant/int_extension_file.dart';
import 'package:flutter_learning_demo/screen/dashboard/list_of_screen/9_product_get_api/controller/api_home_controller.dart';
import 'package:flutter_learning_demo/screen/dashboard/list_of_screen/9_product_get_api/screen/common_product_item.dart';
import 'package:get/get.dart';

class ApiHomeScreen extends StatelessWidget {
  const ApiHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text("Product List"),
      ),
      body: GetX<ApiHomeController>(
          init: ApiHomeController(),
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 60,
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: controller.categoryModel.length,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          controller.isSelectedIndex.value = index;
                          controller.onCategoryClick(categoryName: controller.categoryModel[index].name ?? "");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: controller.isSelectedIndex.value == index ? Colors.blue : Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Center(
                            child: Text(
                              "${controller.categoryModel[index].name}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: controller.isSelectedIndex.value == index ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return 14.kW;
                    },
                  ),
                ),
                Expanded(
                  child: controller.filterProductModel.isNotEmpty
                      ? ListView.separated(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: controller.filterProductModel.length,
                          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18),
                          separatorBuilder: (context, index) {
                            return 18.kH;
                          },
                          itemBuilder: (context, index) {
                            return ProductItemWidget.commonProductItem(
                              title: controller.filterProductModel[index].title ?? "",
                              price: controller.filterProductModel[index].price.toString() ?? "",
                              category: controller.filterProductModel[index].category?.name ?? "",
                              desc: controller.filterProductModel[index].description ?? "",
                              image: controller.filterProductModel[index].images?.first ?? "",
                            );
                            ;
                          },
                        )
                      : controller.isNameFound.value == true
                          ? Center(
                              child: Container(
                              child: const Text('No Data Found'),
                            ))
                          : Visibility(
                              visible: controller.isNameFound.value == true ? false : true,
                              child: ListView.separated(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemCount: controller.productModel.length,
                                padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18),
                                separatorBuilder: (context, index) {
                                  return 18.kH;
                                },
                                itemBuilder: (context, index) {
                                  return ProductItemWidget.commonProductItem(
                                    title: controller.productModel[index].title ?? "",
                                    price: controller.productModel[index].price.toString() ?? "",
                                    category: controller.productModel[index].category?.name ?? "",
                                    desc: controller.productModel[index].description ?? "",
                                    image: controller.productModel[index].images?.first ?? "",
                                  );
                                },
                              ),
                            ),
                )
              ],
            );
          }),
    );
  }
}
