
import 'package:flutter/material.dart';

import '../paymentSuccess/index.dart';

const kAccent = Color(0xFFF0283C);
const kDark = Color(0xFF3E2F2F);

class paymentPage extends StatefulWidget {
  final Map productsDetail;
  final int quantity;

  const paymentPage({
    super.key,
    required this.productsDetail,
    this.quantity = 1,
  });

  @override
  State<paymentPage> createState() => _paymentPageState();
}

class _paymentPageState extends State<paymentPage> {
  int selectedCard = 0;
  bool saveCard = true;

  double get price =>
      (widget.productsDetail['price'] as num).toDouble();

  double get subtotal => price * widget.quantity;
  double get tax => subtotal * 0.05;
  double get delivery => subtotal >= 50 ? 0 : 1.5;
  double get total => subtotal + tax + delivery;

  String money(double amount) => '\$${amount.toStringAsFixed(2)}';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Payment'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                const Text(
                  'Order Summary',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),

                summaryRow(
                  '${widget.productsDetail['title']} x${widget.quantity}',
                  money(subtotal),
                ),
                summaryRow('Taxes (5%)', money(tax)),
                summaryRow(
                  'Delivery Fees',
                  delivery == 0 ? 'Free' : money(delivery),
                ),

                const Divider(height: 28),

                summaryRow('Total', money(total), bold: true),

                const SizedBox(height: 12),

                summaryRow(
                  'Estimated Delivery',
                  '${widget.productsDetail['shippingInformation'] ?? '15 - 30 mins'}',
                ),

                const SizedBox(height: 32),

                const Text(
                  'Payment Methods',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),

                paymentCard(
                  0,
                  'Credit Card',
                  '5105 **** **** 0505',
                  'MC',
                ),
                const SizedBox(height: 12),

                paymentCard(
                  1,
                  'Debit Card',
                  '3566 **** **** 0505',
                  'VISA',
                ),

                CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  value: saveCard,
                  activeColor: kAccent,
                  title: const Text(
                    'Save card details for future payments',
                    style: TextStyle(fontSize: 13),
                  ),
                  onChanged: (value) {
                    setState(() => saveCard = value ?? false);
                  },
                ),
              ],
            ),
          ),

          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Total Price'),
                      Text(
                        money(total),
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: kAccent,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),

                  Expanded(
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentSuccess(
                              total: total,
                            ),
                          ),
                        );
                      },

                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        height: 52,
                        decoration: BoxDecoration(
                          color:Color.fromARGB(218, 4, 151, 9),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            'Pay Now',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget summaryRow(
      String title,
      String value, {
        bool bold = false,
      }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontWeight: bold ? FontWeight.bold : FontWeight.normal,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            value,
            style: TextStyle(
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
              fontSize: bold ? 16 : 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget paymentCard(
      int index,
      String title,
      String number,
      String logo,
      ) {
    final selected = selectedCard == index;

    return InkWell(
      onTap: () => setState(() => selectedCard = index),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: selected ? kDark : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? kAccent : Colors.transparent,
          ),
        ),
        child: Row(
          children: [
            Text(
              logo,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: logo == 'VISA'
                    ? const Color(0xFF1A1F71)
                    : Colors.red,
              ),
            ),
            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: selected ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    number,
                    style: TextStyle(
                      fontSize: 12,
                      color: selected ? Colors.white70 : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            Icon(
              selected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: selected ? Colors.white : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }


}
