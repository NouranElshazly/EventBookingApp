import 'dart:async';
import 'package:event_booking/core/functions/navigation.dart';
import 'package:event_booking/core/styles/color.dart';
import 'package:event_booking/core/styles/text_style.dart';
import 'package:event_booking/core/widgets/gradient_background.dart';
import 'package:event_booking/core/widgets/main_button.dart';
import 'package:flutter/material.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key, required this.email});

  final String email;

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final List<TextEditingController> _controllers =
      List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  int _secondsRemaining = 20;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    setState(() => _secondsRemaining = 20);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining == 0) {
        timer.cancel();
      } else {
        setState(() => _secondsRemaining--);
      }
    });
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    _timer?.cancel();
    super.dispose();
  }

  void _onContinuePressed() {
    final code = _controllers.map((c) => c.text).join();
    if (code.length < 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter the full 4-digit code')),
      );
      return;
    }
    // TODO: verify the code with your backend
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GradientBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),

                // Back arrow
                IconButton(
                  onPressed: () => pop(context),
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),

                const SizedBox(height: 32),

                // Title
                Text(
                  'Verification',
                  style: TextStyles.h4.copyWith(fontWeight: FontWeight.w600),
                ),

                const SizedBox(height: 12),

                // Subtitle
                Text(
                  "We've send you the verification code on ${widget.email}",
                  style: TextStyles.body3.copyWith(color: AppColors.subColor),
                ),

                const SizedBox(height: 36),

                // OTP boxes
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(4, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: _OtpBox(
                        controller: _controllers[index],
                        focusNode: _focusNodes[index],
                        onChanged: (value) {
                          if (value.length == 1 && index < 3) {
                            _focusNodes[index + 1].requestFocus();
                          } else if (value.isEmpty && index > 0) {
                            _focusNodes[index - 1].requestFocus();
                          }
                        },
                      ),
                    );
                  }),
                ),

                const SizedBox(height: 36),

                // Continue button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: main_button(
                    text: 'CONTINUE',
                    onPressed: _onContinuePressed,
                  ),
                ),

                const SizedBox(height: 20),

                // Resend countdown
                Center(
                  child: _secondsRemaining > 0
                      ? Text.rich(
                          TextSpan(
                            text: 'Re-send code in ',
                            style: TextStyles.body3.copyWith(
                              color: AppColors.subColor,
                            ),
                            children: [
                              TextSpan(
                                text:
                                    '0:${_secondsRemaining.toString().padLeft(2, '0')}',
                                style: TextStyles.body3.copyWith(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        )
                      : GestureDetector(
                          onTap: _startTimer,
                          child: Text(
                            'Re-send code',
                            style: TextStyles.body3.copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _OtpBox extends StatelessWidget {
  const _OtpBox({
    required this.controller,
    required this.focusNode,
    required this.onChanged,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 56,
      height: 56,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
        style: TextStyles.h4.copyWith(fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          counterText: '',
          filled: true,
          fillColor: AppColors.accentColor,
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:
                const BorderSide(color: AppColors.primaryColor, width: 1.5),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
