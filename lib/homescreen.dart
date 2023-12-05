import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'modalclass.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}
//...............................................................................................................

TextEditingController txtProduct = TextEditingController();
TextEditingController txtDiscount = TextEditingController();
TextEditingController txtQty = TextEditingController();
TextEditingController txtAmount = TextEditingController();
TextEditingController txtPrice = TextEditingController();

List<InvoiceModle> productList = [];

String? name;
String? q;
String? price;
int fq = 0;
//...............................................................................................................

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text("Invoice Maker",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 25,
                  fontWeight: FontWeight.w500)),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(onTap: () {
                setState(() {
                  productList.clear();
                  fq = 0;
                });
              },child: const Icon(Icons.clear, color: Colors.red)),
            ),
            IconButton(onPressed: () {
            setState(() {
              int sumQ = 0;
              double  sumA= 0;
              setState(() {
                for(int i=0; i<productList.length; i++)
                {
                  sumQ = sumQ + int.parse(productList[i].productQty!);
                  sumA = sumA + double.parse(productList[i].productPrice!);
                }
                totalModel t1 = totalModel(prList: productList,totalQ: sumQ,totalAmount: sumA);
                Navigator.pushNamed(context, 'invoice',arguments: t1);
              });
            });
            }, icon: Icon(Icons.download,color: Colors.green),),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                child: ListView.builder(

                  itemCount: productList.length,
                  itemBuilder: (context, index) {
                    return productBox(index,productList[index].productName!,productList[index].productQty!,productList[index].productPrice!);
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                          onTap: () {
                            setState(() {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  content: Container(
                                    height: 300,
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextFormField(
                                          style: const TextStyle(letterSpacing: 2),
                                          controller: txtProduct,
                                          decoration: InputDecoration(
                                            labelText: "Product Name",
                                            labelStyle:
                                            const TextStyle(color: Colors.grey),
                                            border: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Colors.black,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(5)),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.black,
                                                    width: 2),
                                                borderRadius:
                                                BorderRadius.circular(10)),
                                          ),
                                        ),
                                        TextFormField(
                                          controller: txtQty,
                                          style:  TextStyle(letterSpacing: 2),
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            labelText: "Product Qty",
                                            labelStyle:
                                            TextStyle(color: Colors.grey),
                                            border: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Colors.black,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(5)),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.black,
                                                    width: 2),
                                                borderRadius:
                                                BorderRadius.circular(10)),
                                          ),
                                        ),
                                        TextFormField(
                                          style: const TextStyle(letterSpacing: 2),
                                          controller: txtPrice,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            labelText: "Product Price",
                                            labelStyle:
                                            const TextStyle(color: Colors.grey),
                                            border: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Colors.black,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(5)),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.black,
                                                    width: 2),
                                                borderRadius:
                                                BorderRadius.circular(10)),
                                          ),
                                        ),

                                        InkWell(onTap: () {
                                          setState(() {

                                            name = txtProduct.text;
                                            q = txtQty.text;
                                            price = txtPrice.text;
                                            double amt = double.parse(txtPrice.text)+((double.parse(txtPrice.text)*18)/100);
                                            String amount = amt.toString();
                                            fq = fq + int.parse(txtQty.text);
                                            int i = 0;
                                            InvoiceModle i1 = InvoiceModle(productName: name,productPrice: price,productQty: q,productAmount:amount,);
                                            productList.add(i1);
                                            Navigator.pop(context);
                                          });
                                        },child: customButtonForAddProduct(),),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                          },
                          child: customButtonForAddProduct()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget productBox(int i,String pname,String q,String price) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: PopupMenuButton(
        offset: const Offset(20,20),
        shape: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 1.5)),
        itemBuilder: (context) {
          return [
            PopupMenuItem(onTap: () {
              Future.delayed(const Duration(seconds: 0),() =>  showDialog(context: context, builder: (context) {
                return AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 15,),
                      TextFormField(
                        style: const TextStyle(letterSpacing: 2),
                        controller: txtProduct,
                        decoration: InputDecoration(
                          labelText: "Product Name",
                          labelStyle:
                          const TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                              borderRadius:
                              BorderRadius.circular(5)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black,
                                  width: 2),
                              borderRadius:
                              BorderRadius.circular(10)),
                        ),
                      ),
                      const SizedBox(height: 15,),
                      TextFormField(
                        controller: txtQty,
                        style: const TextStyle(letterSpacing: 2),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Product Qty",
                          labelStyle:
                          const TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                              borderRadius:
                              BorderRadius.circular(5)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black,
                                  width: 2),
                              borderRadius:
                              BorderRadius.circular(10)),
                        ),
                      ),
                      const SizedBox(height: 15,),
                      TextFormField(
                        style: const TextStyle(letterSpacing: 2),
                        controller: txtPrice,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Product Price",
                          labelStyle:
                          const TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                              borderRadius:
                              BorderRadius.circular(5)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black,
                                  width: 2),
                              borderRadius:
                              BorderRadius.circular(10)),
                        ),
                      ),
                      const SizedBox(height: 30,),

                      InkWell(
                        onTap: () {
                          setState(() {
                            productList[i].productName = txtProduct.text;
                            productList[i].productQty = txtQty.text;
                            productList[i].productPrice = txtPrice.text;
                            Navigator.pop(context);
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 130,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Edit",
                                  style: TextStyle(color: Colors.white, letterSpacing: 1)),
                              const SizedBox(
                                width: 5,
                              ),
                              const Icon(
                                Icons.download,
                                color: Colors.white,
                                size: 18,
                              )
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                );
              },),);
              setState(() {

                txtProduct = TextEditingController(text: "$pname");
                txtQty = TextEditingController(text: "$q");
                txtPrice = TextEditingController(text: "$price");

              });
            },child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text("Edit",style: TextStyle(letterSpacing: 2),),const Icon(Icons.edit)]),),

            PopupMenuItem(onTap: () {
              setState(() {

                productList.removeAt(i);

              });
            },child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text("Delete",style: TextStyle(letterSpacing: 2),),const Icon(Icons.delete)]),),
          ];
        },
        child: Container(
          padding: const EdgeInsets.all(5),
          height: 80,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Text("No.", style: TextStyle()),
                  Text("Product Name (Qty)", style: TextStyle(color: Colors.red)),
                  Text("Price", style: TextStyle(color: Colors.red)),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Text("$i", style: TextStyle()),
                  Text("${pname} (${q})", style: TextStyle(color: Colors.lightBlue)),
                  Text("${price}", style: TextStyle(color: Colors.lightBlue)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customButtonForAddProduct() {
    return Container(
      height: 40,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: const Icon(
        Icons.add,
        color: Colors.white,
        size: 18,
      ),
    );
  }

  Widget customButtonForAddInvoiceGenerate() {
    return Container(
      height: 40,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child:const Icon(
        Icons.download,
        color: Colors.white,
        size: 18,
      )
    );
  }
}