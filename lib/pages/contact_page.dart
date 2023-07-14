import 'package:flutter/material.dart';
import 'package:portfolio/components/portfolio_textfield.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/pages/portfolio_page.dart';
import 'package:portfolio/utils/assets.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/action_button.dart';
import '../components/column_row.dart';
import '../components/custom_gridview.dart';
import '../components/portfolio_title.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  late TextEditingController nameController,
      phoneController,
      emailController,
      subjectController,
      messageController;
  late List<Widget> children = [
    PortfolioTextField(controller: nameController, hint: "Full Name"),
    PortfolioTextField(
      controller: emailController,
      hint: "Email Address",
      inputType: TextInputType.emailAddress,
    ),
    PortfolioTextField(
      controller: phoneController,
      hint: "Mobile Number",
      inputType: TextInputType.phone,
    ),
    PortfolioTextField(controller: subjectController, hint: "Email Subject"),
    PortfolioTextField(
      controller: messageController,
      hint: "Your Message",
      inputType: TextInputType.multiline,
      maxlines: 10,
    ),
  ];
  String mailLink = "";

  void getMailLink() {
    final subject = subjectController.text;
    final name = nameController.text;
    final phone = phoneController.text;
    final email = emailController.text;
    final message = messageController.text;
    String body = "Name: $name\n";
    if (email.isNotEmpty) {
      body += "Email: $email\n";
    }
    if (phone.isNotEmpty) {
      body += "Phone: $phone\n";
    }
    if (message.isNotEmpty) {
      body += "Message: $message\n";
    }
    mailLink = "mailto:$email?subject=$subject&body=$body";
    subjectController.clear();
    nameController.clear();
    phoneController.clear();
    emailController.clear();
    messageController.clear();
  }

  void openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      launchUrl(uri);
    }
  }

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    subjectController = TextEditingController();
    messageController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    subjectController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = context.isMobile ? 1 : 2;
    return Container(
      height: context.screenHeight,
      width: context.screenWidth,
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal:
                context.screenWidthPercentage(context.isMobile ? 5 : 20)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const PortfolioTitle(
              title: "Contact Me",
            ),
            CustomGridView(
              items: children,
              gridSize: crossAxisCount,
              itemBuilder: (index) {
                return Expanded(child: children[index]);
              },
            ),
            ActionButton(
              text: "Send Mail",
              onTap: () {
                getMailLink();
                openUrl(mailLink);
              },
            ),
          ],
        ),
      ),
    );
  }
}
