import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FriendlyChat',
      debugShowCheckedModeBanner: false,
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _messageController = TextEditingController();

  List<ChatMessage> _message = [];

  void _handleMessage(String message) {
    setState(() {
      _messageController.text = message;
      _message.insert(0, ChatMessage(_messageController.text));
      _messageController.clear();
    });
  }

  Widget _buildTextMessage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: _messageController,
              onSubmitted: _handleMessage,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                hintText: 'Send a message',
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.send,
              color: Colors.blue,
            ),
            onPressed: () {
              _handleMessage(_messageController.text);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FriendlyChat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemBuilder: (context, index) {
                return _message[index];
              },
              itemCount: _message.length,
            ),
          ),
          _buildTextMessage(),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String message;
  ChatMessage(this.message);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      color: Colors.greenAccent,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Colors.pink,
              child: Text(
                'Y',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Your Name'),
                Text(
                  message,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
