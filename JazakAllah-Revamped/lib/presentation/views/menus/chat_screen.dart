import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../constants/colors.dart';
import '../../../constants/images.dart';
import '../../widgets/chat_message_widget.dart';
import '../../widgets/app_background_image_widget.dart';
import '../../widgets/custom_appbar_widget.dart';

final String? apiSecretKey = 'sk-070326a52bbc4670a979a515b95851be';

class ChatMessage {
  final String text;
  final ChatMessageType chatMessageType;

  ChatMessage({required this.text, required this.chatMessageType});
}

enum ChatMessageType {
  user,
  bot,
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _textController = TextEditingController();
  final _scrollController = ScrollController();
  final List<ChatMessage> _messages = [];

  bool isLoading = false;
  bool isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();

    // Generate the bot's response and add it as the initial message
    String value = 'hello_iam_islamic_AI'.tr;
    _addBotMessage(value);
  }

  void _addBotMessage(String message) {
    setState(
      () {
        var processedMessage = postProcessText(message);
        _messages.add(
          ChatMessage(
            text: processedMessage,
            chatMessageType: ChatMessageType.bot,
          ),
        );
        Future.delayed(const Duration(milliseconds: 1)).then(
          (_) {
            _scrollDown(); // Scroll to the latest message
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          AppBackgroundImageWidget(
            bgImagePath: AssetsPath.secondaryBGSVG,
          ),
          CustomAppbarWidget(
            screenTitle: 'islamic_ai'.tr,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              child: _buildChatScreen(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatScreen() {
    return Column(
      children: [
        SizedBox(
          height: 70.h,
        ),
        Expanded(
          child: _buildList(),
        ),
        Visibility(
          visible: isLoading,
          child: Padding(
            padding: EdgeInsets.all(8.h),
            child: SpinKitThreeBounce(
              color: AppColors.colorWhiteHighEmp,
              size: 20.h,
            ),
          ),
        ),

        ///Input
        Container(
          width: double.infinity,
          color: AppColors.colorPrimaryDarker,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  _buildInput(),
                  _buildSubmit(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSubmit() {
    return Visibility(
      visible: !isLoading,
      child: Padding(
        padding: EdgeInsets.only(left: 8.w, right: 8.h),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: AppColors.colorDonationGradient1End,
          ),
          child: IconButton(
            icon: SvgPicture.asset(AssetsPath.sendButtonIconSVG),
            onPressed: () async {
              setState(() {
                _messages.add(
                  ChatMessage(
                    text: _textController.text,
                    chatMessageType: ChatMessageType.user,
                  ),
                );
                isLoading = true;
              });

              var input = _textController.text;
              _textController.clear();

              generateResponse(input).then(
                (value) {
                  print('Generated response: $value');
                  setState(
                    () {
                      isLoading = false;
                      _messages.add(
                        ChatMessage(
                          text: value,
                          chatMessageType: ChatMessageType.bot,
                        ),
                      );
                      Future.delayed(const Duration(milliseconds: 50)).then(
                        (_) {
                          _scrollDown(); // Scroll to the latest message
                        },
                      );
                    },
                  );
                },
              );

              Future.delayed(const Duration(milliseconds: 50)).then((_) {
                _scrollDown(); // Scroll to the latest message
              });
            },
          ),
        ),
      ),
    );
  }

  Widget _buildInput() {
    return Expanded(
      child: TextFormField(
        minLines: 1,
        maxLines: 3,
        textCapitalization: TextCapitalization.sentences,
        style: const TextStyle(color: AppColors.colorBlackHighEmp),
        controller: _textController,
        decoration: InputDecoration(
          fillColor: AppColors.colorWhiteHighEmp,
          filled: true,
          hintText: 'chat_hint'.tr,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.h),
          hintStyle:
              TextStyle(color: AppColors.colorBlackLowEmp, fontSize: 14.sp),
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              width: 1,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildList() {
    return Padding(
      padding: EdgeInsets.only(top: 16.h, left: 16.h, right: 16.h),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        controller: _scrollController,
        itemCount: _messages.length,
        reverse: false, // Changed from true to false
        itemBuilder: (context, index) {
          var message = _messages[index]; // Changed to access messages directly
          return ChatMessageWidget(
            text: message.text,
            chatMessageType: message.chatMessageType,
          );
        },
      ),
    );
  }

  void _scrollDown() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  Future<String> generateResponse(String prompt) async {
    var url = Uri.parse("https://api.deepseek.com/v1/chat/completions");

    // Load text from file
    String fileText = await getTextFromFile();

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiSecretKey',
        },
        body: json.encode({
          "model": "deepseek-chat",
          "messages": [
            {
              "role": "system",
              "content":
                  "You are Salah AI, an Islamic AI assistant providing accurate information about Islam. You are given some texts which are $fileText"
            },
            {
              "role": "system",
              "content":
                  "If someone asks a question that is not relevant to Islam or any religion, give them an answer relevant to Islam and Religion."
            },
            {
              "role": "system",
              "content":
                  "If someone greets you, greet them back and state your purpose as an Islamic Chat Bot."
            },
            {
              "role": "system",
              "content":
                  "Always provide references from Quran or authentic Hadith when answering questions about Islamic practices or beliefs."
            },
            {
              "role": "system",
              "content":
                  "If you don't know something or if a question is outside the scope of Islamic knowledge, politely decline to answer and suggest consulting with a qualified Islamic scholar."
            },
            {"role": "user", "content": prompt}
          ],
          "temperature": 0.7,
          "max_tokens": 1000,
        }),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse =
            jsonDecode(utf8.decode(response.bodyBytes));
        if (jsonResponse.containsKey('choices')) {
          var choices = jsonResponse['choices'] as List<dynamic>;
          if (choices.isNotEmpty && choices[0].containsKey('message')) {
            var message = choices[0]['message'];
            if (message.containsKey('content')) {
              var content = message['content'] as String;
              var processedContent = postProcessText(content);
              print("Response content: $processedContent");
              return processedContent;
            }
          }
        }
      }

      // If we reach here, something went wrong with the API response
      return 'I apologize, but I\'m having trouble connecting to my knowledge base right now. Please try again later or ask another question.';
    } catch (e) {
      print('Error generating response: $e');
      return 'I apologize, but I\'m having trouble connecting to my knowledge base right now. Please try again later or ask another question.';
    }
  }

  Future<String> getTextFromFile() async {
    try {
      return await rootBundle.loadString('assets/data.txt');
    } catch (e) {
      print('Error reading file: $e');
      return '';
    }
  }

  String postProcessText(String rawText) {
    // Implement your post-processing logic here
    // This is just a basic example, you can modify it according to your needs
    // Here, we remove any leading/trailing spaces and line breaks
    var processedText = rawText.trim();
    return processedText;
  }

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
