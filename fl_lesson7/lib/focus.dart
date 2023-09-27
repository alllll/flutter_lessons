import 'package:flutter/material.dart';

class FocusForm extends StatefulWidget {
  const FocusForm({super.key});

  @override
  State<FocusForm> createState() => _FocusFormState();
}

class _FocusFormState extends State<FocusForm> {
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: TextFormField()),
              ],
            ),
            Focus(
              canRequestFocus: false,
              onFocusChange: (value) {
                print('$value');
              },
              descendantsAreTraversable: false,
              descendantsAreFocusable: false,
              child: Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    focusNode: focusNode,
                  )),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(child: TextFormField()),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                    child: const Text('Фокус на второе поле'),
                    onPressed: () {
                      focusNode.requestFocus();
                    },
                  )),
                ],
              ),
            ),
            FocusTraversalGroup(
                policy: OrderedTraversalPolicy(),
                child: Column(
                  children: [
                    FocusTraversalOrder(
                      order: const NumericFocusOrder(2),
                      child: Row(
                        children: [
                          Expanded(child: TextFormField()),
                        ],
                      ),
                    ),
                    FocusTraversalOrder(
                      order: const NumericFocusOrder(1),
                      child: Row(
                        children: [
                          Expanded(child: TextFormField()),
                        ],
                      ),
                    ),
                    FocusTraversalOrder(
                      order: const NumericFocusOrder(3),
                      child: Row(
                        children: [
                          Expanded(child: TextFormField()),
                        ],
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
