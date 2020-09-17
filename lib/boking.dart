import 'package:flutter/material.dart';

class Boking extends StatefulWidget {
  @override
  _BokingState createState() => _BokingState();
}

class _BokingState extends State<Boking> {
  List<String> images = [
    "assets/profil.png",
    "assets/profil.png",
    "assets/profil.png"
  ];
  double defaultMargin = 24;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          shrinkWrap: true,
          children: [
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(8.0),
                  height: 300.0,
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
                        Text(
                          "Gelandang",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 140,
                      margin: EdgeInsets.only(top: 55, left: 10, right: 10),
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
                    Column(
                      children: [
                        Text(
                          "Deskripsi",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Futsal adalah permainan bola yang dimainkan oleh dua tim, yang masing-masing beranggotakan lima orang. Tujuannya adalah memasukkan bola ke gawang lawan, dengan memanipulasi bola",
                            style: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.normal),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
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
