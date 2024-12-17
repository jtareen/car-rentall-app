//
// @override
// State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
// }
//
// class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
//   final GlobalKey<CountdownTimerState> _countdownTimerKey = GlobalKey();
//   bool _isVerifying = false;
//   bool _isEmailVerified = false;
//   late final User? _currentUser;
//   late final Timer _timer;
//
//   @override
//   void initState() {
//     super.initState();
//     _currentUser = FirebaseAuth.instance.currentUser;
//     _isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
//
//     if (_currentUser != null) {
//       _sendVerificationEmail();
//       // Automatically refresh every 5 seconds to check if the email is verified
//       _timer = Timer.periodic(const Duration(seconds: 5), (_) {
//         _checkEmailVerification();
//       });
//     }
//   }
//
//   Future<void> _checkEmailVerification() async {
//     await FirebaseAuth.instance.currentUser!.reload();
//
//     setState(() {
//       _isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
//     });
//     if (_isEmailVerified) {
//       _timer.cancel(); // Stop the timer once verified
//       _navigateToNextPage();
//     }
//   }
//
//   Future<void> _sendVerificationEmail() async {
//     if (_currentUser != null && !_isVerifying) {
//       setState(() {
//         _isVerifying = true;
//       });
//
//       try {
//         await _currentUser.sendEmailVerification();
//         _countdownTimerKey.currentState?.restartTimer();
//         _showSnackBar('Verification email sent to your email');
//       } catch (e) {
//         _showSnackBar('Error sending verification email: $e');
//       } finally {
//         setState(() {
//           _isVerifying = false;
//         });
//       }
//     }
//   }
//
//   void _showSnackBar (String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//       ),
//     );
//   }
//
//   void _navigateToNextPage() {
//     // Redirect to the next page after successful verification
//     Navigator.pushReplacementNamed(context, '/bottomNavBar'); // Replace '/main' with your actual route
//   }
//
//   @override
//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }







// class SignInPage extends StatefulWidget {
//   const SignInPage({super.key});
//
//   @override
//   State<SignInPage> createState () => _SignInPageState ();
// }
//
// class _SignInPageState extends State<SignInPage> {
//   late final TextEditingController _email;
//   late final TextEditingController _password;
//   final GlobalKey<ToggleMessageBoxState> _toggleMessageBoxKey = GlobalKey();
//
//
//   @override
//   void initState() {
//     _email = TextEditingController();
//     _password = TextEditingController();
//
//     super.initState();
//   }
//
//   @override void dispose() {
//     _email.dispose();
//     _password.dispose();
//
//     super.dispose();
//   }
//
//   Future<void> _loginAttempt () async {
//     if (!_validateInput()) return ;
//
//     final email = _email.text.trim();
//     final password = _password.text.trim();
//
//     try {
//       // Sign in using email and password
//       UserCredential userCredential = await FirebaseAuth.
//       instance.signInWithEmailAndPassword(email: email, password: password);
//
//       User? user = userCredential.user;
//
//       if (user != null) {
//         // check if user is verified or not
//         if (user.emailVerified) {
//           _loginToApp();
//         } else {
//           _navigateToVerificationPage ();
//         }
//       } else {
//         throw Exception('Unknown Error: user not retrieved');
//       }
//
//     } on FirebaseAuthException catch (e) {
//       String message;
//       if (e.code == 'network-request-failed') {
//         _showErrorDialog('Network Error', 'Make sure you are connected to network');
//         return ;
//       } else if (e.code == 'invalid-email') {
//         message = 'Please enter a valid email address';
//       } else if (e.code == 'invalid-credential') {
//         message = 'Provided Email and Password do not match. Please provide valid credentials.';
//       } else {
//         message = "Login failed: ${e.message}";
//       }
//
//       _toggleMessageBoxKey.currentState?.updateState(true, message, AlertType.error, true);
//     } catch (e) {
//       _toggleMessageBoxKey.currentState?.updateState(true, e.toString(), AlertType.error, true);
//     }
//   }
//
//   bool _validateInput() {
//     if (_email.text.trim().isEmpty ||
//         _password.text.trim().isEmpty) {
//       _toggleMessageBoxKey.currentState?.updateState(true, 'All fields are required.', AlertType.error, true);
//       return false;
//     }
//     return true;
//   }
//
//   void  _showErrorDialog (title, message) {
//     showErrorDialog(context, title, message);
//   }
//
//   void _loginToApp () {
//     Navigator.pushReplacementNamed(context, '/bottomNavBar');
//   }
//
//   void _navigateToVerificationPage () {
//     Navigator.pushNamed(context, '/emailVerification');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 30),
//               child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//
//                     /*  Top Section  */
//                     const SizedBox(height: 50,),
//                     const Text(
//                       'Welcome to, Pikbil 👌',
//                       style: TextStyle(
//                           color: primary,
//                           fontSize: 24,
//                           fontWeight: FontWeight.w600
//                       ),
//                     ),
//                     const Text(
//                       'Enter your pikbil account to continue',
//                       style: TextStyle(
//                           color: Colors.grey,
//                           fontSize: 16
//                       ),
//                     ),
//                     const SizedBox(height: 20,),
//                     /*  Top Section  */
//
//                     ToggleMessageBox(key: _toggleMessageBoxKey,),
//
//                     /*  Form Section  */
//                     const SizedBox(height: 10,),
//                     SignInUpPageTextField(
//                       model: SignInUpPageTextFieldModel(
//                         label: 'Email Address',
//                         hint: 'Your email address',
//                         inputType: TextInputType.emailAddress,
//                         controller: _email,
//                       ),
//                     ),
//                     const SizedBox(height: 20,),
//                     PasswordField(controller: _password ,),
//                     const SizedBox(height: 20,),
//                     AsyncButton(label: 'Login', onPressed: _loginAttempt,),
//                     const SizedBox(height: 20,),
//                     /*  Form Section  */
//
//                     /*  Footer Section  */
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         InkWell(
//                             onTap: () {
//                               Get.to(() => const ForgotPasswordPage());
//                             },
//                             child: const Text('Forgot password?', style: TextStyle(color: Colors.grey),)
//                         )
//                       ],
//                     ),
//                     const SizedBox(height: 20,),
//                     const LoginDivider(label: 'or login with'),
//                     const SizedBox(height: 20,),
//                     const SocialButtonsWidget(),
//                     const SizedBox(height: 20,),
//                     Center(
//                       child: Wrap(
//                         alignment: WrapAlignment.center,
//                         children: [
//                           Text(
//                             "Didn't have a pikbil account? ",
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               color: Colors.grey[700],
//                               fontSize: 16,
//                             ),
//                           ),
//                           InkWell(
//                             onTap: () {
//                               Get.to(() => const SignUpPage());
//                             },
//                             child: const Text(
//                               "Register",
//                               style: TextStyle(
//                                 color: primary, // Adjust color as needed
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                     /*  Footer Section  */
//                   ]
//               ),
//             )
//         )
//     );
//   }
// }
//
//
//
// class SignUpPage extends StatefulWidget {
//   const SignUpPage({super.key});
//
//   @override
//   State<SignUpPage> createState () => _SignUpPageState();
// }
//
// class _SignUpPageState extends State<SignUpPage> {
//   final GlobalKey<ToggleMessageBoxState> _toggleMessageBoxKey = GlobalKey();
//
//   late final TextEditingController _fullName;
//   late final TextEditingController _email;
//   late final TextEditingController _password;
//
//   @override void initState() {
//     // TODO: implement initState
//     super.initState();
//
//     _fullName = TextEditingController();
//     _email = TextEditingController();
//     _password = TextEditingController();
//   }
//
//   @override void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//
//     _fullName.text = '';
//     _email.text = '';
//     _password.text = '';
//
//     _fullName.dispose();
//     _email.dispose();
//     _password.dispose();
//   }
//
//   bool _validateInput() {
//     if (_fullName.text.trim().isEmpty ||
//         _email.text.trim().isEmpty ||
//         _password.text.trim().isEmpty) {
//
//       _toggleMessageBoxKey.currentState?.updateState(true, 'All fields required', AlertType.error, true);
//
//       return false;
//     }
//
//     return true;
//   }
//
//   Future<void> _registerUser() async {
//     if (!_validateInput()) return ;
//
//     final email = _email.text.trim();
//     final password = _password.text.trim();
//     final name = _fullName.text.trim();
//
//     try {
//       // Create a new user with email and password
//       UserCredential userCredential = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(email: email, password: password);
//
//       // Get the user object
//       User? user = userCredential.user;
//
//       if (user != null) {
//         // Update the user's display name
//         await user.updateDisplayName(name);
//         await user.reload(); // Reload user to ensure the name is updated
//
//         _navigateToVerificationPage();
//       } else {
//         throw Exception('Registration Failed: Something went wrong');
//       }
//
//     } on FirebaseAuthException catch (e) {
//       // Handle Firebase-specific errors
//
//       String errorMessage;
//       if (e.code == 'network-request-failed') {
//         _showErrorDialog('Network Error', 'Make sure you are connected to network');
//         return ;
//       } else if (e.code == 'email-already-in-use') {
//         errorMessage = "The account already exists for that email.";
//       } else if (e.code == 'invalid-email') {
//         errorMessage = "The email address is not valid.";
//       } else if (e.code == 'weak-password') {
//         errorMessage = "The password provided is too weak.";
//       } else {
//         errorMessage = "Registration failed: ${e.message}";
//       }
//
//       // Show error message to user
//       _toggleMessageBoxKey.currentState?.updateState(true, errorMessage, AlertType.error, true);
//     } catch (e) {
//       // Handle other errors and show to user
//       _toggleMessageBoxKey.currentState?.updateState(true, "An error occurred: $e", AlertType.error, true,);
//     }
//   }
//
//   void _navigateToVerificationPage () {
//     Navigator.pushNamed(context, '/emailVerification');
//   }
//
//   void  _showErrorDialog (title, message) {
//     showErrorDialog(context, title, message);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               icon: const Icon(Icons.arrow_back_ios_new, color: primary,)
//           ),
//           backgroundColor: Colors.white,
//         ),
//         backgroundColor: Colors.white,
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 30),
//             child: Column(
//               // mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Nice to know you!',
//                     style: TextStyle(
//                         color: primary,
//                         fontSize: 24,
//                         fontWeight: FontWeight.w600
//                     ),
//                   ),
//                   const Text(
//                     "It's you first time to use pikbil",
//                     style: TextStyle(
//                         color: Colors.grey,
//                         fontSize: 16
//                     ),
//                   ),
//                   const SizedBox(height: 20,),
//                   ToggleMessageBox(key: _toggleMessageBoxKey,),
//                   const SizedBox(height: 10,),
//                   SignInUpPageTextField(
//                     model: SignInUpPageTextFieldModel(
//                       label: 'Full name',
//                       hint: 'Your full name',
//                       inputType: TextInputType.text,
//                       controller: _fullName,
//                     ),
//                   ),
//                   const SizedBox(height: 20,),
//                   SignInUpPageTextField(
//                     model: SignInUpPageTextFieldModel(
//                         label: 'Email Address',
//                         hint: 'Your email address',
//                         inputType: TextInputType.emailAddress,
//                         controller: _email
//                     ),
//                   ),
//                   const SizedBox(height: 20,),
//                   PasswordField(controller: _password,),
//                   const SizedBox(height: 20,),
//                   AsyncButton(label: 'Register', onPressed: _registerUser),
//                   const SizedBox(height: 20,),
//                   const LoginDivider(label: 'or register with'),
//                   const SizedBox(height: 20,),
//                   const SocialButtonsWidget(),
//                   const SizedBox(height: 20,),
//                   Center(
//                     child: Wrap(
//                       alignment: WrapAlignment.center,
//                       children: [
//                         Text(
//                           "Already have a pikbil account? ",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: Colors.grey[700],
//                             fontSize: 16,
//                           ),
//                         ),
//                         InkWell(
//                           onTap: () {
//                             Navigator.pop(context);
//                           },
//                           child: const Text(
//                             "Login",
//                             style: TextStyle(
//                               color: primary, // Adjust color as needed
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 20,),
//                 ]
//             ),
//           ),
//         )
//     );
//   }
// }
