import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_learning_demo/core/constant/int_extension_file.dart';
import 'package:flutter_learning_demo/screen/dashboard/list_of_screen/3_product_get_api/controller/api_home_controller.dart';
import 'package:flutter_learning_demo/screen/dashboard/list_of_screen/3_product_get_api/screen/common_product_item.dart';
import 'package:get/get.dart';

class ApiHomeScreen extends StatelessWidget {
  const ApiHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<ApiHomeController>(
        init: ApiHomeController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              surfaceTintColor: Colors.transparent,
              automaticallyImplyLeading: false,
              centerTitle: false,
              title: controller.isVisible.value == false
                  ? const Text("Product List")
                  : Stack(
                      children: [
                        AnimatedAlign(
                          duration: Duration(seconds: 1), // Animation duration
                          alignment: controller.isAlignedRight.value ? Alignment.centerLeft : Alignment.centerRight,
                          child: TextField(
                            controller: controller.textEditingController.value,
                            onChanged: (value) {
                              controller.searchProductList(value);
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                              hintText: "Search Here",
                              border: InputBorder.none,
                              prefixIcon: controller.isVisible.value
                                  ? GestureDetector(
                                      onTap: () {
                                        controller.isVisible.value = !controller.isVisible.value;
                                      },
                                      child: Icon(
                                        Icons.search,
                                      ),
                                    )
                                  : null,
                            ),
                          ),
                        ),
                      ],
                    ),
              actions: [
                Visibility(
                  visible: !controller.isVisible.value,
                  child: GestureDetector(
                    onTap: () {
                      controller.isVisible.value = !controller.isVisible.value;
                      controller.textEditingController.value.clear();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 18.0),
                      child: Icon(Icons.search),
                    ),
                  ),
                ),
              ],
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 60,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: controller.categoryModel.length,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          controller.isSelectedIndex.value = index;
                          controller.categoryName.value = controller.categoryModel[index].name;
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
                            String input = controller.productModel[index].images?.first ?? "";
                            String result1;
                            if(input.startsWith('[\"')){
                              result1 = input.substring(2, input.length - 2).toString();
                            }else{
                              result1 = input;
                            }
                            return ProductItemWidget.commonProductItem(
                              title: controller.filterProductModel[index].title ?? "",
                              price: controller.filterProductModel[index].price.toString() ?? "",
                              category: controller.filterProductModel[index].category?.name ?? "",
                              desc: controller.filterProductModel[index].description ?? "",
                              image: result1,
                            );
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
                                  String input = controller.productModel[index].images?.first ?? "";
                                  String result1;
                                  if(input.startsWith('[\"')){
                                    result1 = input.substring(2, input.length - 2).toString();
                                  }else{
                                     result1 = input;
                                  }
                                  // Using substring method

                                  //print(result1);
                                  return ProductItemWidget.commonProductItem(
                                    title: controller.productModel[index].title ?? "",
                                    price: controller.productModel[index].price.toString() ?? "",
                                    category: controller.productModel[index].category?.name ?? "",
                                    desc: controller.productModel[index].description ?? "",
                                    image: result1,
                                  );
                                },
                              ),
                            ),
                )
              ],
            ),
          );
        });
  }
}
