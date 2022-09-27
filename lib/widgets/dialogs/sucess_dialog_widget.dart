import 'package:flutter/material.dart';

class SucessDialogWidget extends StatelessWidget {
  final Function() onDismissed;
  const SucessDialogWidget({Key? key, required this.onDismissed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.info),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Dados informados com sucesso!',
                    softWrap: true,
                  ),
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: onDismissed,
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
