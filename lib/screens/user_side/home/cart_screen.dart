import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/screens/common_widgets/button_widget.dart';
import 'package:shoppe/screens/common_widgets/info_container.dart';
import 'package:shoppe/screens/common_widgets/product_card.dart';
import 'package:shoppe/screens/common_widgets/quantity_button.dart';
import 'package:shoppe/screens/user_side/home/check_oder.dart';
import 'package:shoppe/screens/user_side/services/api_service.dart';
import 'package:shoppe/screens/user_side/services/product_categories.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final FirestoreService service = FirestoreService();
  final uid = FirebaseAuth.instance.currentUser!.uid; //user id

  @override
  Widget build(BuildContext context) {
    Future<void> removeFromCart(String productId) async {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .collection("cart")
          .doc(productId)
          .delete();
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: StreamBuilder<QuerySnapshot>(
            stream: service.getCart(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              final cart = snapshot.data!.docs;

              // Reset totals every rebuild
              double totalPrice = 0;

              for (var item in cart) {
                final price = (item['price'] as num).toDouble();
                final qty = (item['quantity'] as num).toInt();

                totalPrice += price * qty;
              }

              return Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Cart",
                                style: TextStyle(
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 5,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(
                                    255,
                                    228,
                                    243,
                                    248,
                                  ),
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                                child: Text(
                                  cart.length.toString(),
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          InfoContainer(
                            title: "Shipping Address",
                            details:
                                "26, Duong So 2, Thao Dien Ward, An Phu, District 2, Ho Chi Minh city",
                            onPressed: () {},
                          ),
                          SizedBox(height: 20.h),

                          /// CART LIST
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: cart.length,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.only(bottom: 6),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                ),

                                child: Row(
                                  children: [
                                    Stack(
                                      children: [
                                        ProducrCard(
                                          width: 160.w,
                                          onTap: () {},
                                          imagepath: cart[index]['image'],
                                        ),
                                        Positioned(
                                          top: 0,
                                          left: 90,
                                          child: Container(
                                            width: 45.w,
                                            height: 40.h,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20.r),
                                            ),
                                            child: IconButton(
                                              onPressed: () {
                                                final docId = cart[index].id;

                                                removeFromCart(docId);
                                              },
                                              icon: Icon(
                                                Icons.delete_outline,
                                                color: Colors.redAccent,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 16.w),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              cart[index]['description']
                                                  .toString(),
                                              style: const TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "₦${cart[index]['price']}",
                                              style: TextStyle(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              QuantityButton(
                                                text: '-',
                                                onPressed: () {
                                                  final docId = cart[index].id;
                                                  final currentQty =
                                                      (cart[index]['quantity']
                                                              as num)
                                                          .toInt();
                                                  //should only minus if qty is > 1
                                                  if (currentQty > 1) {
                                                    FirebaseFirestore.instance
                                                        .collection("users")
                                                        .doc(uid)
                                                        .collection("cart")
                                                        .doc(docId)
                                                        .update({
                                                          "quantity":
                                                              FieldValue.increment(
                                                                -1,
                                                              ),
                                                        });
                                                  }
                                                },
                                              ),
                                              SizedBox(width: 8.w),
                                              Container(
                                                width: 54.w,
                                                height: 40.h,
                                                decoration: BoxDecoration(
                                                  color: const Color(
                                                    0xFFE5EBFC,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        10.r,
                                                      ),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    cart[index]['quantity']
                                                        .toString(),
                                                    style: const TextStyle(
                                                      fontSize: 25,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 8.w),
                                              QuantityButton(
                                                text: '+',
                                                onPressed: () {
                                                  final docId = cart[index].id;

                                                  FirebaseFirestore.instance
                                                      .collection("users")
                                                      .doc(uid)
                                                      .collection("cart")
                                                      .doc(docId)
                                                      .update({
                                                        "quantity":
                                                            FieldValue.increment(
                                                              1,
                                                            ),
                                                      });
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// TOTAL SECTION
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(
                              fontSize: 25.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            "₦${totalPrice.toStringAsFixed(2)}",
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      ButtonWidget(
                        text: "Checkout",
                        onPressed: () async {
                          try {
                            final api = ApiService();
                            // Read the cart
                            final items = cart.map((item) {
                              return {
                                "productId": item.id,
                                "quantity": item["quantity"],
                              };
                            }).toList();

                            // Call the API
                            final order = await api.createOrder(
                              userId: uid,
                              items: items,
                              total: totalPrice,
                            );

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => CheckOder(
                                  orderId: order["orderId"],
                                  totalPrice: totalPrice,
                                ),
                              ),
                            );
                          } catch (error, stackTrace) {
                            print(error);
                            print(stackTrace);

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(error.toString())),
                            );
                          }
                        },
                        color: const Color(0xFF004CFF),
                        height: 40.h,
                        width: 128.w,
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
