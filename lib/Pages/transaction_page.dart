import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_pas/models/food_model.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key, required this.item});

  final FoodItem item;

  @override
  State<TransactionPage> createState() => TransactionPageState();
}

class TransactionPageState extends State<TransactionPage> {
  final jumlahController = TextEditingController(text: '1');
  int? jumlahTerakhir;
  int? subtotal;
  int? ppn;
  int? total;

  @override
  void dispose() {
    jumlahController.dispose();
    super.dispose();
  }

  String rupiah(int amount) {
    final digits = amount.toString();
    final output = StringBuffer();
    for (var i = 0; i < digits.length; i++) {
      output.write(digits[i]);
      final remaining = digits.length - i - 1;
      if (remaining > 0 && remaining % 3 == 0) output.write('.');
    }
    return 'Rp $output';
  }

  void hitung() {
    final quantity = int.tryParse(jumlahController.text.trim());
    if (quantity == null || quantity < 1 || quantity > 999) {
      Get.snackbar(
        'Jumlah tidak valid',
        'Masukkan jumlah antara 1 sampai 999.',
      );
      return;
    }
    final value = widget.item.price * quantity;
    final tax = (value * 5 / 100).round();
    setState(() {
      jumlahTerakhir = quantity;
      subtotal = value;
      ppn = tax;
      total = value + tax;
    });
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Transaksi Pembelian')),
    body: ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Center(
          child: Container(
            width: 150,
            height: 150,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: widget.item.color,
              borderRadius: BorderRadius.circular(26),
            ),
          ),
        ),
        const SizedBox(height: 18),
        Text(
          widget.item.name,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w800,
            color: Color(0xFF173B35),
          ),
        ),
        const SizedBox(height: 7),
        Text(
          widget.item.description,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Color(0xFF667873), height: 1.45),
        ),
        const SizedBox(height: 10),
        Text(
          'Harga satuan: ${rupiah(widget.item.price)}',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFF087E72),
            fontWeight: FontWeight.w800,
            fontSize: 17,
          ),
        ),
        const SizedBox(height: 25),
        TextField(
          controller: jumlahController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Jumlah makanan',
            prefixIcon: const Icon(Icons.numbers),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 14),
        SizedBox(
          height: 50,
          child: FilledButton.icon(
            onPressed: hitung,
            icon: const Icon(Icons.calculate_outlined),
            label: const Text('Bayar'),
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFF087E72),
              foregroundColor: Colors.white,
            ),
          ),
        ),
        if (total != null) ...[
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xFF173B35),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'RINCIAN PEMBAYARAN',
                  style: TextStyle(
                    color: Color(0xFFB9E4D4),
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 15),
                _row('Jumlah', '$jumlahTerakhir porsi'),
                _row('Subtotal', rupiah(subtotal!)),
                _row('PPN (5%)', rupiah(ppn!)),
                const Divider(color: Color(0xFF607D72), height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total Bayar',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      rupiah(total!),
                      style: const TextStyle(
                        color: Color(0xFFB9E4D4),
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ],
    ),
  );

  Widget _row(String label, String value) => Padding(
    padding: const EdgeInsets.only(bottom: 9),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Color(0xFFE6F1EC))),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );
}
