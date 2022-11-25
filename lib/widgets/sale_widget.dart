import 'package:flutter/material.dart';

class saleWidget extends StatelessWidget {
  const saleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(
            colors: [
              Color(0xff7D3C98),
              Color(0xffD2B4DE),
            ],
            begin: FractionalOffset(0.0, 1.0),
            end: FractionalOffset(1.0, 0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Row(
        children: [
          Flexible(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.all(14),
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffBB8FCE),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Get the special discount',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Text(
                              '50 %\nOFF',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )),
          Flexible(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.all(14),
                child: Image.network(
                    width: double.infinity,
                    'https://i.ibb.co/vwB46Yq/shoes.png'),
              ))
        ],
      ),
    );
  }
}
