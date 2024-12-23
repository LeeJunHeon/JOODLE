import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:joodle_ver_one/repo/detailpage_repo.dart';

class CountButton extends StatelessWidget {
  const CountButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final counterProvider = Provider.of<menuCounterProvider>(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(25, 10, 15, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            '수량',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              IconButton(
                padding: const EdgeInsets.only(right: 15),
                constraints: const BoxConstraints(),
                style: const ButtonStyle(
                  splashFactory: NoSplash.splashFactory,
                ),
                onPressed: () {
                  //context.read(menuCounterProvider).decrement();
                },
                icon: const Icon(Icons.remove),
              ),
              Text(
                "1",
                //"${context.watch<menuCounterProvider>().count}",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                padding: const EdgeInsets.only(left: 15),
                constraints: const BoxConstraints(),
                style: const ButtonStyle(
                  splashFactory: NoSplash.splashFactory,
                ),
                onPressed: () {
                  //context.read(menuCounterProvider.notifier).increment();
                },
                icon: const Icon(Icons.add),
              ),
            ],
          )
        ],
      ),
    );
  }
}