import 'package:flutter/material.dart';
import 'package:new_one_v1/models/instruction_model.dart';
import 'package:new_one_v1/view/widgets/instruction.dart';

class InstruckionsBuilder extends StatelessWidget {
  const InstruckionsBuilder({super.key});

  static final List<InstructionModel> models = [
    InstructionModel(
      title: 'Tsunami',
      imgPath: 'assets/images/tsunami.png',
      steps: [
        'Узбагойтесь',
        'Dont panic',
        'one more relax',
      ],
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: models.length,
        itemBuilder: (context, index) {
          return InstructionWidget(
            model: models[index],
          );
        },
      ),
    );
  }
}
