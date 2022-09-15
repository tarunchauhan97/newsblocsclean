import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsblocsclean/text_cubit/text_cubit.dart';

class TextPage extends StatelessWidget {
  const TextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<TextCubit, TextState>(
          builder: (context, state) {
            if (state is TextInitial) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: context.read<TextCubit>().showNewText,
                    child: Text("Click Me!"),
                  ),
                ],
              );
            } else if (state is TextLoading) {
              return const CircularProgressIndicator();
            } else {
              return Text("Completed");
            }
          },
        ),
      ),
    );
  }
}
