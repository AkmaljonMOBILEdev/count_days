import 'package:count_days/cubits/counter/counter_cubit.dart';
import 'package:count_days/ui/widgets/button.dart';
import 'package:count_days/ui/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Count days"),
      ),
      body: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) {
          return Column(
            children: [
              UserTextField(
                hintText: "20.11.2023",
                controller: firstController,
              ),
              UserTextField(
                hintText: "23.11.2023",
                isLast: true,
                controller: secondController,
              ),
              MainButton(
                onTap: () {
                  context.read<CounterCubit>().getFirstDate(firstController.text);
                  context.read<CounterCubit>().getSecondDate(secondController.text);
                  context.read<CounterCubit>().count();
                },
              ),
              Text(
                "Days: ${state.result}",
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.green),
              )
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    firstController.dispose();
    secondController.dispose();
    super.dispose();
  }
}
