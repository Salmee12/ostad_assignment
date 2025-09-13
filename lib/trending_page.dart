import 'dart:ui';

import 'package:flutter/material.dart';

class TrendingCard extends StatelessWidget {
  final String img;
  final String subtitle;
  final String duration;
  final num price;
  final double rating;

  const TrendingCard({
    Key? key,
    required this.img,
    required this.subtitle,
    required this.duration,
    required this.price,
    required this.rating,
  }) : super(key: key);

  void _showSnackbar(String msg, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg), duration: const Duration(seconds: 2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [

            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(image: NetworkImage(img), fit: BoxFit.cover),
              ),
            ),
            const SizedBox(width: 10),
            // Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(subtitle,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.access_time, color: Colors.grey, size: 16),
                      const SizedBox(width: 4),
                      Text(duration, style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 16),
                      const SizedBox(width: 4),
                      Text(rating.toString(), style: const TextStyle(color: Colors.black87)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\$${price.toString()}",
                          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
                      OutlinedButton(
                        onPressed: () {
                          _showSnackbar("Viewing Details...", context);
                        },
                        child: const Text("View Details"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}