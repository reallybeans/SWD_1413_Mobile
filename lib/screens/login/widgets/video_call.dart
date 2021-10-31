import 'dart:convert';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

// ignore: must_be_immutable
class VideoCall extends StatefulWidget {
  String channelName = "test1";

  // VideoCall({required this.channelName});
  @override
  _VideoCallState createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  // late final AgoraClient _client;
  bool _loading = true;
  String tempToken = "";

  @override
  void initState() {
    // getToken();
    initAgora();
    super.initState();
  }

  void initAgora() async {
    await _client.initialize();
  }
  // Future<void> getToken() async {
  //   String link =
  //       "https://agora-node-tokenserver-1.davidcaleb.repl.co/access_token?channelName=${widget.channelName}";

  //   Response _response = await get(Uri.parse(link));
  //   Map data = jsonDecode(_response.body);
  //   setState(() {
  //     tempToken = data["token"];
  //   });
  //   _client = AgoraClient(
  //       agoraConnectionData: AgoraConnectionData(
  //         appId: "c0361d4447854ba8b277b52880484530",
  //         tempToken: tempToken,
  //         channelName: widget.channelName,
  //       ),
  //       enabledPermission: [Permission.camera, Permission.microphone]);
  //   Future.delayed(Duration(seconds: 1)).then(
  //     (value) => setState(() => _loading = false),
  //   );
  // }
// fb79b1cad7814576a4125ede73db4c2e
// videocall. c0361d4447854ba8b277b52880484530

// token 006c0361d4447854ba8b277b52880484530IAB1O2VSw8f3CdwBufGUJGO87AU7lkwv4o5fZaloxaMO2Ax+f9gAAAAAEACcPzRRSch+YQEAAQBJyH5h
  final AgoraClient _client = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
        appId: "c0361d4447854ba8b277b52880484530",
        tempToken:
            '006c0361d4447854ba8b277b52880484530IAB1O2VSw8f3CdwBufGUJGO87AU7lkwv4o5fZaloxaMO2Ax+f9gAAAAAEACcPzRRSch+YQEAAQBJyH5h',
        channelName: 'test',
      ),
      enabledPermission: [Permission.camera, Permission.microphone]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AgoraVideoViewer(
              client: _client,
            ),
            AgoraVideoButtons(client: _client)
          ],
        ),
      ),
    );
    ;
  }
}
