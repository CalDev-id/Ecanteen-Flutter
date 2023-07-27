part of 'pages.dart';

class Catatan extends StatefulWidget {
  const Catatan({Key key}) : super(key: key);

  @override
  State<Catatan> createState() => _CatatanState();
}

class _CatatanState extends State<Catatan> {
  TextEditingController judulController = TextEditingController();
  TextEditingController deskripsiController = TextEditingController();

  @override
  void initState() {
    refreshCatatan();
    super.initState();
  }

  //ambil data dari firebase
  List<Map<String, dynamic>> histori = [];
  void refreshCatatan() async {
    final data = await SQLHelper.getHistori();
    setState(() {
      histori = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;

    print(histori);
    return Scaffold(
        body: GeneralPage(
      title: "Your Orders",
      subtitle: "Wait for the best meal",
      child: Column(
        children: [
          CustomTabBar(
            titles: ['In Progress', 'Past Orders'],
            selectedIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
            child: ListView.builder(
              itemCount: histori.length,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      margin: const EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage(histori[index]['image']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width -
                          2 * defaultMargin -
                          182, // 60 + 12 + 110
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            histori[index]['makanan'],
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500, fontSize: 15),
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                          ),
                          Text(
                            "${histori[index]['jumlah']} item • ${NumberFormat.currency(symbol: 'IDR ', decimalDigits: 0, locale: 'id-ID').format(histori[index]['harga'])}",
                            style: GoogleFonts.poppins(fontSize: 13),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 110,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // Text(convertDateTime(histori[index]['tanggal']),
                          //     style: GoogleFonts.poppins(
                          //         fontSize: 12, color: greyColor)),
                          Text(histori[index]['tanggal'],
                              style: GoogleFonts.poppins(
                                  fontSize: 12, color: greyColor)),
                          Text(
                            'On Delivery',
                            style: GoogleFonts.poppins(
                                fontSize: 10, color: mainColor),
                          )

                          // (transaction.status == TransactionStatus.cancelled)
                          //     ? Text(
                          //         'Cancelled',
                          //         style: GoogleFonts.poppins(
                          //             fontSize: 10, color: Colors.red),
                          //       )
                          //     : (transaction.status == TransactionStatus.pending)
                          //         ? Text(
                          //             'Pending',
                          //             style: GoogleFonts.poppins(
                          //                 fontSize: 10, color: Colors.red),
                          //           )
                          //         : (transaction.status == TransactionStatus.on_delivery)
                          //             ? Text(
                          //                 'On Delivery',
                          //                 style: GoogleFonts.poppins(
                          //                     fontSize: 10, color: mainColor),
                          //               )
                          //             : SizedBox()
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          // ElevatedButton(
          //     onPressed: () {
          //       modalForm();
          //     },
          //     child: Icon(Icons.add))
        ],
      ),
    ));
  }

  //fungsi tambah
  // Future<void> tambahCatatan() async {
  //   await SQLHelper.tambahHistori(
  //       judulController.text,
  //       deskripsiController.text,
  //       "1",
  //       DateTime.now().toString(),
  //       "assets/bni.png");
  //   refreshCatatan();
  // }

  // //form tambah
  // void modalForm() async {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (_) => Container(
  //             padding: EdgeInsets.all(15),
  //             width: double.infinity,
  //             height: 800,
  //             child: SingleChildScrollView(
  //               child: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 crossAxisAlignment: CrossAxisAlignment.end,
  //                 children: [
  //                   TextField(
  //                     controller: judulController,
  //                     decoration: InputDecoration(
  //                       hintText: "Judul",
  //                     ),
  //                   ),
  //                   SizedBox(height: 10),
  //                   TextField(
  //                     controller: deskripsiController,
  //                     decoration: InputDecoration(
  //                       hintText: "deskripsi",
  //                     ),
  //                   ),
  //                   SizedBox(height: 20),
  //                   ElevatedButton(
  //                       onPressed: () async {
  //                         await tambahCatatan();
  //                         judulController.clear();
  //                         deskripsiController.clear();
  //                         navigator.pop(context);
  //                       },
  //                       child: Text("Tambah"))
  //                 ],
  //               ),
  //             ),
  //           ));
  // }

  String convertDateTime(DateTime dateTime) {
    String month;

    switch (dateTime.month) {
      case 1:
        month = 'Jan';
        break;
      case 2:
        month = 'Feb';
        break;
      case 3:
        month = 'Mar';
        break;
      case 4:
        month = 'Apr';
        break;
      case 5:
        month = 'May';
        break;
      case 6:
        month = 'Jun';
        break;
      case 7:
        month = 'Jul';
        break;
      case 8:
        month = 'Aug';
        break;
      case 9:
        month = 'Sep';
        break;
      case 10:
        month = 'Oct';
        break;
      case 11:
        month = 'Nov';
        break;
      case 12:
        month = 'Dec';
        break;
    }

    return month + ' ${dateTime.day}, ${dateTime.hour}:${dateTime.minute}';
  }
}
