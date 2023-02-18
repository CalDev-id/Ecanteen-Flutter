part of 'pages.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({Key key}) : super(key: key);

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController houseNumberController = TextEditingController();
    TextEditingController cityController = TextEditingController();

    return GeneralPage(
      title: "Address",
      subtitle: "Make sure it's valid",
      onBackButtonPressed: () {
        Get.back();
      },
      backColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: TextField(
                controller: phoneController,
                decoration: InputDecoration(
                    labelText: "Phone No",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelStyle: GoogleFonts.poppins()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: TextField(
                controller: addressController,
                decoration: InputDecoration(
                    labelText: "Address",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelStyle: GoogleFonts.poppins()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: TextField(
                controller: houseNumberController,
                decoration: InputDecoration(
                    labelText: "House No",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelStyle: GoogleFonts.poppins()),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey)),
              child: DropdownButton(
                isExpanded: true,
                underline: const SizedBox(),
                value: cityController.text,
                // ignore: prefer_const_literals_to_create_immutables
                items: [
                  const DropdownMenuItem(
                    value: "Jakarta Utara",
                    child: Text(
                      "Jakarta Utara",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  const DropdownMenuItem(
                    value: "Jakarta Pusat",
                    child: Text("Jakarta Pusat"),
                  ),
                  const DropdownMenuItem(
                    value: "Jakarta Timur",
                    child: Text("Jakarta Timur"),
                  ),
                  const DropdownMenuItem(
                    value: "Jakarta Barat",
                    child: Text("Jakarta Barat"),
                  ),
                  const DropdownMenuItem(
                    value: "Jakarta Selatan",
                    child: Text("Jakarta Selatan"),
                  ),
                ],
                onChanged: (a) {},
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 30),
              child: FloatingActionButton(
                  backgroundColor: mainColor,
                  onPressed: () {
                    Get.to(() => const SuccessSignUpPage());
                  },
                  child: const Icon(Icons.arrow_forward)),
            )
          ],
        ),
      ),
    );
  }
}
