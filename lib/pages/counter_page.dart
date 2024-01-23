import 'package:counter_app/cubit/counter_cubit.dart';
import 'package:counter_app/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final count = 0;

  bool lightMode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter App',),
      
      ),
      body: BlocBuilder<CounterCubit, int>(
        builder: (context, count) {
          return 
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.nightlight, color: Colors.grey[700],),
                    Switch(value: lightMode, onChanged: (bool value) => 
                    setState(() {
                      lightMode = value;
                    })),
                    const Icon(Icons.sunny, color: Colors.amber,),

                  ],
                ),
              ),
              // Switch(
              //   value: context.select((ThemeCubit themeCubit) => themeCubit.state), onChanged: () =>
              //   context.read<ThemeCubit>().toggleTheme();
              // );
              Center(child: Text('$count', style: const TextStyle(fontSize: 30),),),
            ],
          );
        }
         ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () =>
            context.read<CounterCubit>().increment()
          , child: const Icon(Icons.add),),
          const SizedBox(height: 12,),
          FloatingActionButton(
            onPressed: () =>
            context.read<CounterCubit>().decrement()
          , child: const Icon(Icons.remove),),
        ]),
    );
  }
}