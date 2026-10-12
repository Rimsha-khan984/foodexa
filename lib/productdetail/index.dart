import 'package:flutter/material.dart';
import 'package:foodexa/paymentPage/index.dart';


class productdetail extends StatelessWidget {
  final Map productsDetail;
  const productdetail({super.key, required this.productsDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),

      // APP BAR
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Product Details',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),

        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black87,
            ),
          ),
          SizedBox(width: 20,)
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // PRODUCT IMAGE
              Container(
                width: double.infinity,
                height: 350,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),

                  child: Image.network(
                    "${productsDetail["thumbnail"]}",
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // PRODUCT NAME
              Text(
                '${productsDetail["title"]}',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10,),

              // Rating and stock
              Wrap(
                spacing: 25,
                runSpacing: 12,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 20,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "${productsDetail['rating']}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,

                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.inventory_2_outlined,
                        color: Color.fromARGB(218, 4, 151, 9),
                        size: 20,
                      ),
                      const SizedBox(width: 8),

                      Text(
                        productsDetail["stock"] > 0
                            ? "In Stock (${productsDetail["stock"]})"
                            : "Out of Stock",
                        style:  TextStyle(
                          fontSize: 16,
                          color: productsDetail["stock"] > 0
                              ? Color.fromARGB(218, 4, 151, 9)
                              : Colors.red,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                    ],
                  ),
                ],
              ),

              const SizedBox(height: 15),
              // DESCRIPTION
              Text(
                '${productsDetail["description"]}',
                style: TextStyle(
                  fontSize: 15,
                  height: 1.6,
                  color: Colors.grey.shade700,
                ),
              ),
              SizedBox(height: 15,),

              // PRICE

              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 15,
                runSpacing: 10,
                children: [
                  Text(
                    "\$${productsDetail['price']}",
                    style: const TextStyle(
                      fontSize: 31,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(218, 4, 151, 9),
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 13,
                      vertical: 9,
                    ),
                    decoration: BoxDecoration(
                      color:  Color.fromARGB(255, 230, 245, 230),
                        borderRadius: BorderRadius.circular(20),
                    ),
                    child:  Text(
                      '\$ ${(productsDetail["price"] / (1 - productsDetail["discountPercentage"] / 100)).toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ),
                ],
              ),


              const SizedBox(height: 30),

              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => paymentPage(
                        productsDetail: productsDetail,
                        quantity: 1,
                      ),
                    ),
                  );

                },
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  height: 52,
                  decoration: BoxDecoration(
                    color:Color.fromARGB(218, 4, 151, 9),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                    child: Text(
                      'Buy Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
