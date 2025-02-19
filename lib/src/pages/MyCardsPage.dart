import 'dart:math' as math;

import 'package:helpify/src/widgets/payment_back.dart';
import 'package:helpify/src/widgets/payment_front.dart';
import 'package:flutter/material.dart';

class MyCardsPage extends StatefulWidget {
  @override
  _MyCardsPageState createState() => _MyCardsPageState();
}

class _MyCardsPageState extends State<MyCardsPage>
    with SingleTickerProviderStateMixin {
  AnimationController _flipAnimationController;
  Animation<double> _flipAnimation;
  TextEditingController _cardNumberController,
      _cardHolderNameController,
      _cardExpiryController,
      _cvvController;
  FocusNode _cvvFocusNode;
  String _cardNumber = '';
  String _cardHolderName = '';
  String _cardExpiry = '';
  String _cvvNumber = '';

  _MyCardsPageState() {
    _cardNumberController = TextEditingController();
    _cardHolderNameController = TextEditingController();
    _cardExpiryController = TextEditingController();
    _cvvController = TextEditingController();
    _cvvFocusNode = FocusNode();

    _cardNumberController.addListener(onCardNumberChange);
    _cardHolderNameController.addListener(() {
      _cardHolderName = _cardHolderNameController.text;
      setState(() {});
    });
    _cardExpiryController.addListener(() {
      _cardExpiry = _cardExpiryController.text;
      setState(() {});
    });
    _cvvController.addListener(() {
      _cvvNumber = _cvvController.text;
      setState(() {});
    });

    _cvvFocusNode.addListener(() {
      _cvvFocusNode.hasFocus
          ? _flipAnimationController.forward()
          : _flipAnimationController.reverse();
    });
  }

  @override
  void initState() {
    super.initState();
    _flipAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 350));
    _flipAnimation =
        Tween<double>(begin: 0, end: 1).animate(_flipAnimationController)
          ..addListener(() {
            setState(() {});
          });
  }

  void onCardNumberChange() {
    _cardNumber = _cardNumberController.text;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Añadir tarjeta'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(math.pi * _flipAnimation.value),
              origin: Offset(MediaQuery.of(context).size.width / 2, 0),
              child: _flipAnimation.value < 0.5
                  ? Payment_front(
                      cardNumber: _cardNumber,
                      cardHolderName: _cardHolderName,
                      cardExpiry: _cardExpiry,
                    )
                  : Payment_back(
                      cvvNumber: _cvvNumber,
                    ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(16),
                height: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: _cardNumberController,
                        maxLength: 16,
                        decoration: InputDecoration(
                          hintText: 'Card Number',
                        ),
                      ),
                      _cardHolder(
                          cardHolderNameController: _cardHolderNameController),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: _cardExpir(
                                cardExpiryController: _cardExpiryController),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            flex: 1,
                            child: _insertCVV(
                                cvvFocusNode: _cvvFocusNode,
                                cvvController: _cvvController),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _cardHolder extends StatelessWidget {
  const _cardHolder({
    Key key,
    @required TextEditingController cardHolderNameController,
  })  : _cardHolderNameController = cardHolderNameController,
        super(key: key);

  final TextEditingController _cardHolderNameController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _cardHolderNameController,
    );
  }
}

class _cardExpir extends StatelessWidget {
  const _cardExpir({
    Key key,
    @required TextEditingController cardExpiryController,
  })  : _cardExpiryController = cardExpiryController,
        super(key: key);

  final TextEditingController _cardExpiryController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _cardExpiryController,
      maxLength: 5,
    );
  }
}

class _insertCVV extends StatelessWidget {
  const _insertCVV({
    Key key,
    @required FocusNode cvvFocusNode,
    @required TextEditingController cvvController,
  })  : _cvvFocusNode = cvvFocusNode,
        _cvvController = cvvController,
        super(key: key);

  final FocusNode _cvvFocusNode;
  final TextEditingController _cvvController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.numberWithOptions(decimal: false),
      focusNode: _cvvFocusNode,
      controller: _cvvController,
      maxLength: 3,
      decoration: InputDecoration(counterText: '', hintText: 'CVV'),
    );
  }
}

Widget _createButton() {
  return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.amber,
      textColor: Colors.white,
      icon: Icon(Icons.save),
      label: Text("Guardar"),
      onPressed: () {});
}
