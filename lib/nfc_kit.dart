import 'dart:typed_data';
import 'package:app_settings/app_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:joodle_ver_one/repo/nfc_repo.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class NfcKit extends StatefulWidget {
  const NfcKit({Key? key}) : super(key: key);
  @override
  State<NfcKit> createState() => _NfcKitState();
}

class _NfcKitState extends State<NfcKit> {
  ValueNotifier<dynamic> result = ValueNotifier(null);

  final _storePrimaryKeyValue = TextEditingController();
  final _tableValue = TextEditingController();
  final _tableFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('NfcManager Plugin Example')),
        body: SafeArea(
          child: FutureBuilder<bool>(
            future: NfcManager.instance.isAvailable(),
            builder: (context, ss) => ss.data != true
                ? Center(child: Text('NfcManager.isAvailable(): ${ss.data}'))
                : Flex(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              direction: Axis.vertical,
              children: [
                Flexible(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.all(4),
                    constraints: BoxConstraints.expand(),
                    decoration: BoxDecoration(border: Border.all()),
                    child: SingleChildScrollView(
                      child: ValueListenableBuilder<dynamic>(
                        valueListenable: result,
                        builder: (context, value, _) =>
                            Text('${value ?? ''}'),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: GridView.count(
                    padding: EdgeInsets.all(4),
                    crossAxisCount: 2,
                    childAspectRatio: 4,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                    children: [
                      TextFormField(
                        controller: _storePrimaryKeyValue,
                        maxLines: 1,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) => _tableFocusNode.requestFocus(),
                        inputFormatters: [FilteringTextInputFormatter(RegExp('[0-9]'), allow: true)],
                        decoration: InputDecoration(
                          hintText: '가게 고유번호'
                        ),
                        maxLength: 6,
                      ),
                      TextFormField(
                        controller: _tableValue,
                        maxLines: 1,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.done,
                        inputFormatters: [FilteringTextInputFormatter(RegExp('[0-9]'), allow: true)],
                        decoration: InputDecoration(
                            hintText: '테이블 번호'
                        ),
                        maxLength: 3,
                      ),
                      ElevatedButton(
                          onPressed: _tagRead,
                          child: const Text('Tag Read')),
                      ElevatedButton(
                          onPressed: _ndefWrite,
                          child: const Text('Ndef Write')
                      ),
                      ElevatedButton(
                          onPressed: _ndefWriteLock,
                          child: const Text('Ndef Write Lock')),
                      ElevatedButton(onPressed: (){
                        _handleNFCTag();
                      }, child: const Text('App Launch Test'))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _tagRead() {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      result.value = tag.data;
      NfcManager.instance.stopSession();
    });
  }

  void _ndefWrite() {
    final storePrimaryKeyValue = _storePrimaryKeyValue.text.trim();
    final tableValue = _tableValue.text.trim();
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      var ndef = Ndef.from(tag);
      if (ndef == null || !ndef.isWritable) {
        result.value = 'Tag is not ndef writable';
        NfcManager.instance.stopSession(errorMessage: result.value);
        return;
      }

      NdefMessage message = NdefMessage([
        NdefRecord.createText('가게 고유번호: $storePrimaryKeyValue'),
        NdefRecord.createText('테이블 번호: $tableValue'),
        NdefRecord.createUri(Uri.parse('com.example.joodle_ver_one')),
        NdefRecord.createMime(
            'text/plain', Uint8List.fromList('Hello'.codeUnits)),
        NdefRecord.createExternal(
            'com.example', 'mytype', Uint8List.fromList('mydata'.codeUnits)),
      ]);

      try {
        await ndef.write(message);
        result.value = 'Success to "Ndef Write"';
        NfcManager.instance.stopSession();

        bool isAppInstalled = await _checkIfAppInstalled();

        if(isAppInstalled){
          _launchApp();
        } else {
          _launchWebPage();
        }
      } catch (e) {
        result.value = e;
        NfcManager.instance.stopSession(errorMessage: result.value.toString());
        return;
      }
    });
  }

  void _ndefWriteLock() {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      var ndef = Ndef.from(tag);
      if (ndef == null) {
        result.value = 'Tag is not ndef';
        NfcManager.instance.stopSession(errorMessage: result.value.toString());
        return;
      }

      try {
        await ndef.writeLock();
        result.value = 'Success to "Ndef Write Lock"';
        NfcManager.instance.stopSession();
      } catch (e) {
        result.value = e;
        NfcManager.instance.stopSession(errorMessage: result.value.toString());
        return;
      }
    });
  }

  void _handleNFCTag() async {
    const String appPackage = 'com.example.joodle_ver_one';

    bool isAppInstalled = await _checkIfAppInstalled();

    if (isAppInstalled) {
      _launchApp();
    } else {
      _launchWebPage();
    }
  }

  void _launchApp() async {
    const String appPackage = 'com.example.joodle_ver_one';

    // 앱 실행
    try {
      await launch('package:$appPackage');
    } catch (e) {
      print('Failed to launch app: $e');
    }
  }

  void _launchWebPage() async {
    const String webUrl = 'https://www.google.com';

    // 웹 페이지로 리다이렉트
    try {
      await launch(webUrl);
    } catch (e) {
      print('Failed to launch web page: $e');
    }
  }

  Future<bool> _checkIfAppInstalled() async {
    const String appPackageName = 'com.example.joodle_ver_one';
    bool isAppInstalled = await canLaunch('package:$appPackageName');
    return isAppInstalled;
  }


}
