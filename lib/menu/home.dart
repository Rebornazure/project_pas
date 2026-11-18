import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_pas/Models/food_model.dart';
import 'package:project_pas/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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

  @override
  Widget build(BuildContext context) => ListView(
    padding: const EdgeInsets.fromLTRB(16, 18, 16, 24),
    children: [
      const Text(
        'KULINER HARI INI',
        style: TextStyle(
          color: Color(0xFF087E72),
          fontSize: 12,
          letterSpacing: 1.2,
          fontWeight: FontWeight.w800,
        ),
      ),
      const SizedBox(height: 6),
      const Text(
        'Pilih makanan favoritmu',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w800,
          color: Color(0xFF173B35),
        ),
      ),
      const SizedBox(height: 6),
      const Text(
        'Ketuk menu untuk melihat rincian dan menghitung pembayaran.',
        style: TextStyle(color: Color(0xFF667873)),
      ),
      const SizedBox(height: 16),
      ListView.builder(
        itemCount: menuMakanan.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final item = menuMakanan[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            elevation: 0,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(18),
              onTap: () => Get.toNamed(Routes.transaction, arguments: item),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Container(
                      width: 82,
                      height: 82,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: item.color,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    const SizedBox(width: 13),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF173B35),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            item.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 12,
                              height: 1.35,
                              color: Color(0xFF667873),
                            ),
                          ),
                          const SizedBox(height: 7),
                          Text(
                            rupiah(item.price),
                            style: const TextStyle(
                              color: Color(0xFF087E72),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Icon(Icons.chevron_right, color: Color(0xFF8A9A94)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    ],
  );
}
