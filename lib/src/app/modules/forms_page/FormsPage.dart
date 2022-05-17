import 'package:flutter/material.dart';
import 'package:flutter_nac2_kelvin/src/app/components/standart_card_content.dart';
import 'package:flutter_nac2_kelvin/src/app/modules/product/Product.dart';

class FormsPage extends StatefulWidget {
  const FormsPage({Key? key}) : super(key: key);

  @override
  State<FormsPage> createState() => _FormsPageState();
}

class _FormsPageState extends State<FormsPage> {
  List<Product> _list = [Product(productOne: "on1", productTwo: "one2")];
  final TextEditingController _controladorProductOne = TextEditingController();
  final TextEditingController _controladorProductTwo = TextEditingController();
  // void _addList() {
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //     _list.add();
  //   });
  // }
  Future<void> _showDialog(
    String productOne,
    String productTwo,
  ) async {
    return showDialog(
      context: context,
      builder: (BuildContext conext) {
        return AlertDialog(
          title: Text(productOne),
          content: SingleChildScrollView(
            child: Container(
              child: Text(
                '$productTwo',
              ),
            ),
          ),
          actions: <Widget>[TextButton(onPressed: () {}, child: Text('ok'))],
        );
      },
    );
  }

  addNewProduct({
    required String productOne,
    required String productTwo,
  }) {
    setState(() {
      _list.insert(
        0,
        Product(
          productOne: productOne,
          productTwo: productTwo,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NAC2'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 100.0,
          right: 100.0,
        ),
        child: Column(children: <Widget>[
          TextField(controller: _controladorProductOne),
          TextField(controller: _controladorProductTwo),
          ListView.separated(
            shrinkWrap: true,
            itemCount: _list.length,
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
              height: 15,
            ),
            itemBuilder: (context, index) {
              var productItems = _list[index];
              return MouseRegion(
                cursor: SystemMouseCursors.cell,
                child: GestureDetector(
                  onTap: () {
                    _showDialog(
                      productItems.productOne,
                      productItems.productTwo,
                    );
                    print(productItems.productOne);
                    print(productItems.productTwo);
                  },
                  child: StandardCardContent(
                    leftText: productItems.productOne,
                    rightText: productItems.productTwo,
                  ),
                ),
              );
            },
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addNewProduct(
              productOne: _controladorProductOne.text,
              productTwo: _controladorProductTwo.text);

          // final String valueOne = _controladorInputOne.text;
          // final String valueTwo = _controladorInputTwo.text;
          // final String valueTotal = valueOne + valueTwo;
          // _list.add(valueOne, valueTwo);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
