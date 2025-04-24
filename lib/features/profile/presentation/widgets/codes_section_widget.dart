import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CodesSectionWidget extends StatelessWidget {
  const CodesSectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'أكواد',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),

          // Code items
          CodeItem(
            title: 'كود الخصم',
            code: 'NEWS50',
            onCopy: () {
              Clipboard.setData(const ClipboardData(text: 'NEWS50'));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('تم نسخ الكود')),
              );
            },
          ),

          const SizedBox(height: 12),

          CodeItem(
            title: 'كود الإحالة',
            code: 'FRIEND2023',
            onCopy: () {
              Clipboard.setData(const ClipboardData(text: 'FRIEND2023'));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('تم نسخ الكود')),
              );
            },
          ),

          const SizedBox(height: 12),

          CodeItem(
            title: 'كود الاشتراك الشهري',
            code: 'MONTHLY25',
            onCopy: () {
              Clipboard.setData(const ClipboardData(text: 'MONTHLY25'));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('تم نسخ الكود')),
              );
            },
          ),

          const SizedBox(height: 16),

          // Add code button
          Center(
            child: OutlinedButton.icon(
              onPressed: () {
                _showAddCodeDialog(context);
              },
              icon: const Icon(Icons.add),
              label: const Text('إضافة كود جديد'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showAddCodeDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('إضافة كود جديد'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'عنوان الكود',
                  hintText: 'مثال: كود الخصم',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'الكود',
                  hintText: 'مثال: NEWS50',
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('إلغاء'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FilledButton(
              child: const Text('إضافة'),
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('تم إضافة الكود')),
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class CodeItem extends StatelessWidget {
  final String title;
  final String code;
  final VoidCallback onCopy;

  const CodeItem({
    Key? key,
    required this.title,
    required this.code,
    required this.onCopy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  code,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'monospace',
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onCopy,
            icon: const Icon(Icons.copy),
            tooltip: 'نسخ الكود',
          ),
        ],
      ),
    );
  }
}
