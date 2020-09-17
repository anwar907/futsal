import 'package:flutter/material.dart';
import 'package:putsal/boking.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController searchController = TextEditingController();
  List<String> images = [
    "assets/profil.png",
    "assets/profil.png",
    "assets/profil.png"
  ];
  double defaultMargin = 24;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF0E2331),
        body: Container(
          child: ListView(
            shrinkWrap: true,
            children: [
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(8.0),
                    height: 270.0,
                    width: double.infinity,
                    color: Color(0xFF0E2331),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 0, right: 0, top: 0),
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                          color: Colors.lightBlue),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              "Lapangan",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 55, left: 10, right: 10),
                        padding: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.transparent),
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: TextField(
                            // onChanged: (text) {
                            //   setState(() {
                            //     isPasswordValid = text.length >=
                            //         6; //jika panjang password lebih dari sama dengan 6 makan nilainya true. Sehinggan isPasswordValid nilainya akan berubah menjadi true dan disetState.
                            //   });
                            // },

                            controller: searchController,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.white)),
                              prefixIcon: Icon(Icons.search),
                              labelText: "Search...",
                              hintText: "Search...",
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Rekomendasi",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 140,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal, //scroll kesamping
                            itemCount: images.length,
                            itemBuilder: (_, index) => Container(
                                  //index merupakan index dari masing2 item
                                  margin: EdgeInsets.only(
                                      left: (index == 0)
                                          ? defaultMargin
                                          : 0, // kalo dia diawal brrti margin kiri defaultmargin kalo tidak brrti marginnya 0
                                      right: (index ==
                                              images.length -
                                                  1) //kalo dia yang terakhir brrti margin kanannya defaulmargin kalo tidak 16. Akan menindih margin kiri item yang lain yang bernilai 0 sehingga jarak antar item adalah 16.
                                          ? defaultMargin
                                          : 16),
                                  child: LapanganCard(
                                    images[
                                        index], //moviecard memiliki parameter onTap yang bersifat opsional, sesuai dengan konstruktor MovieCard yang kita buat sebelumnya
                                    onTap: () {
                                      // context
                                      //     .bloc<PagesBloc>()
                                      //     .add(GoToMovieDetailPage(movies[index]));
                                    },
                                  ),
                                )),
                      ),
                    ],
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                alignment: Alignment.topLeft,
                child: Text(
                  "Lapangan",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Boking()));
                },
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Card(
                        child: ListTile(
                          leading: Image.asset(
                            "assets/profil.png",
                            fit: BoxFit.cover,
                            height: 60,
                            width: 60,
                            alignment: Alignment.center,
                          ),
                          title: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Gelandang"),
                              Text(
                                "Jl melur no. 1A gomong selaparang mataram",
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Rp. 50.000"),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Card(
                        child: ListTile(
                          leading: Image.asset(
                            "assets/profil.png",
                            fit: BoxFit.cover,
                            height: 60,
                            width: 60,
                            alignment: Alignment.center,
                          ),
                          title: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Gelandang"),
                              Text(
                                "Jl melur no. 1A gomong selaparang mataram",
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Rp. 50.000"),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 50,
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.group_add),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.date_range),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.person),
                onPressed: () {},
              ),
            ],
          ),
        ));
  }
}

class LapanganCard extends StatelessWidget {
  final String images;
  final Function onTap; //ada fungsi onTap pada objek ini/

  LapanganCard(this.images, {this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //memberikan gesture detector agar onTap bekerja.
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
        height: 190,
        width: 280,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              image: AssetImage(
                  images), //w780 merupakan ukuran dari gambar yang diambil dari API sesuai ketentuan dari APInya.
              fit: BoxFit.cover),
        ),
        child: Container(
          //container ini berfungsi untuk degradasi warna pada container dari hitam ke transparan.
          height: 190,
          width: 280,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.61),
                    Colors.black.withOpacity(0)
                  ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //   Text(
              //     movie.title,
              //     style: whiteTextFont,
              //     maxLines: 2,
              //     overflow: TextOverflow.ellipsis,
              //   ),
              //   RatingStars(voteAverage: movie.voteAverage,)
            ],
          ),
        ),
      ),
    );
  }
}
