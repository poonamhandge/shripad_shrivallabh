import 'package:flutter/material.dart';

class Phal extends StatelessWidget {
  final VoidCallback openDrawer;

  const Phal({Key? key, required this.openDrawer}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.orange[400],
          leading: GestureDetector(
              onTap: () {
                openDrawer();
              },
              child: const Icon(
                Icons.menu, // add custom icons also
              )),
          title: const Text(
              '``ÞççÇHçço ÞççÇJçuuçYç ®ççÆj\$ççcçÉlç\'\' iç´bLçç®³çç Òçl³çíkçÀ DçO³çç³ç-Hç"Cçç®çí HçÀ}',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Varun')),
          actions: const <Widget>[]),
      body: Padding(
        padding: const EdgeInsets.all(20.00),
        child: ListView(children: <Widget>[
          Text(
              '1 Içjçlç MççblççÇ vççbolçí mçáKçç®ççÇ ÒçççÆHlç \n2 cçvç:kçw}íMç çÆvçJççjCç \n3 vççiçoçíøç çÆvçJççjCç, mçblççvç-ÒççÆlçyçbOçkçÀ-oçíøç çÆvçJççjCç \n4 cçá}çÇvçç ³ççíi³ç Jçj ÒçççÆHlç, içá©çÆvçvoç-oçíøç-çÆvçJççjCç \n5 çÆJçIvç oÓj nçíC³ççmç, oíJçlçç kçÀçíHççHççmçÓvç cçáÊçÀçÇ \n6 çÆHçlçÉ MççHççHçmçÓvç çÆvçJçÉÊççÇ \n7 Dç%ççvç çÆvçJçÉÊççÇ, çÆJçJçíkçÀ ÒçççÆHlç \n8 mçblççvçÒççHlççÇ, }#cççÇ-kç=ÀHçç-kçÀìç#ç }çYç \n9 ÒççjyOç-kçÀcç&-vççMç \n10 oçÌYçç&i³ç-vççMç \n11 oáiçá&CççHççmçÓvç cçáÊçÀçÇ \n12 MçjçÇjçjçíi³ç ÒçççÆHlç \n13 ³çJçmçç³ç JçÉ×çÇ, HçMçá-JçÉçÆ× \n14 DççHçoç-çÆvçJççjCç, Glmççn-JçÉçÆ× \n15 DçkçÀçjCç kçÀ}n çÆvçJççjCç, HçÓJç& pçvcç kç=Àlç oçíøç çÆvçJççjCç \n16 OçvççkçÀøç&Cç-MççÆÊçÀ-JçÉçÆ× \n17 çÆmç× Hçá©øççb®çí DçççÆMçJçç&o \n18 HççHçkçÀcçç¥®çç vççMç, Yççi³ç JçÉçÆ× \n19 cççvççÆmçkçÀ kçw}íMç çÆvçJççjCç \n20 kçÀ<ì-vç<ì-çÆvçJççjCç \n21 DçO³çççqlcçkçÀ }çYç, HçáC³ç JçÉçÆ× \n22 kçÀcç&oçíøç çÆvçJççjCç \n23 Síéç³ç&-ÒçççÆHlç \n24 oçbHçl³ç-mçáKç \n25 DçççÆLç&kçÀ mçcçm³çç oÓçÆjkçÀjCç \n26 oáozJç vççMç, mçlmçblççvç-ÒçççÆHlç \n27 Síéç³ç& }#cççÇ ÒçççÆHlç\n28 çÆJçJççn DçvçákçÓÀ} Jç MççÇIç´ nçíC³ççmç\n29 çÆHçlçÉ oíJçlççb®çí DçççÆMçJçç&o\n30 GpJç} YççÆJç<³ç nçíC³ççmç\n31 çÆJçÐçç, Síéç³ç& ³ççb®ççÇ ÒççHlççÇ\n32 mçodiçá© kç=ÀHççkçÀìç#ç ÒçççÆHlç mçç"çÇ\n33 DçvçákçáÀ} çÆJçJççn nçíC³ççmç\n34 \$ç+Cç cççí®çvççbmçç"çÇ\n35 Jçççqkçwmç×çÇ mçç"çÇ\n36 DçvçákçÓÀ} oçcHçl³ç pççÇJçvççmçç"çÇ\n37 pççÇJçvççlç mLçÌ³ç&\n38 DççlcçmLçÌ³ç&\n39 mçHç& oçíøç-çÆvçJççjCç\n40 DçmççO³ç kçÀç³çç&lç ³çMç çÆcçUC³ççmçç"çÇ\n41 }çíkçÀçÆvçvoç-HççÆjnçjçLç&\n43 Dç<ìÌéç³ç& ÒçççÆHlçmçç"çÇ\n44 GpJç} YççÆJç<³ççmçç"çÇ\n45 >mçJç& #çí\$ççlç JçÉçÆ×\n46 lJççÆjlç çÆJçJççnmçç"çÇ\n47 mçJç& MçáYçHçÀ} çÆcçUC³ççmç\n48 Dççlç&, DçLçç&Lçça, çÆpç%ççmçá, cçácçá#çá ³ççbvçç ®ççjçÇ Hçá©øççLç& çÆmç×çÇmçç"çÇ\n49 mçcçmlç kçÀcç&-oçíøççHççmçÓvç çÆvçJçÉçÆÊç\n50 içá©çÆvçvoç kçíÀu³ççcçáUí Dçç}í}í oççÆjêîç oÓj nçíC³ççmç\n51 pç}içb[ççÆokçÀçHççmçÓvç j#çCç\n52 mçJç& mçcçm³çç DçÒç³çlvççvçí oÓj nçílççÇ}\n53 cçnçHççHç-OJçbmç nçíC³ççmç',
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrangeAccent[700],
                  fontFamily: 'Varun'),
              textAlign: TextAlign.center),
        ]),
      ),
    );
  }
}
