import 'package:flutter/material.dart';
import 'package:flutter_learning_demo/core/constant/int_extension_file.dart';

class ProductItemWidget {
  static commonProductItem({required String title, required String price, required String category, required String desc, required String image,}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 200,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 180.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(0.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 20.0,
                        spreadRadius: 4.0,
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Container(
                      height: 200,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade500,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 14),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              maxLines: 2,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              desc,
                              maxLines: 3,
                              style: const TextStyle(
                                fontSize: 10,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            10.kH,
                            Text(
                              "Category: $category",
                              style:  TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.grey.shade500,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                           const Spacer(),
                            Text(
                              "₹ $price",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // Align(
              //   alignment: Alignment.bottomCenter,
              //   child: Container(
              //     height: 200,
              //     width: 150,
              //     child:,
              //   ),
              // )
            ],
          ),
        ),
      ],
    );
  }
}
