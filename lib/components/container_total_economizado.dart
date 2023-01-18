import 'package:flutter/material.dart';

class ContainerTotalEconomizado extends StatelessWidget {
  const ContainerTotalEconomizado({Key? key, required this.total})
      : super(key: key);

  final String total;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.blue[300],
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          const Image(
            image: AssetImage(
              'images/objetivo.png',
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Ao final, você terá economizado',
                  style: TextStyle(fontSize: 12.0, color: Colors.white),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  overflow: TextOverflow.ellipsis,
                  'R\$ $total',
                  style: const TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
