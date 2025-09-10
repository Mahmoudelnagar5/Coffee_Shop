import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

import '../../../../../core/functions/get_transctions.dart';
import '../../../../../core/utils/api_keys.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../core/utils/app_theme.dart';
import '../../data/models/amount_model/amount_model.dart';
import '../../data/models/item_list_model/item_list_model.dart';
import '../../data/models/payment_intent_input_model.dart';
import '../manager/payment_cubit.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({super.key, required this.isPaypal});

  final bool isPaypal;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          _showResultDialog(
            context,
            title: 'Payment Success',
            message: 'Your payment was completed successfully.',
            isSuccess: true,
          );
        }

        if (state is PaymentFailure) {
          Navigator.of(context).maybePop();
          _showResultDialog(
            context,
            title: 'Payment Failed',
            message: state.errMessage,
            isSuccess: false,
          );
        }
      },
      builder: (context, state) {
        return CustomButton(
          color: Apptheme.buttonBackground1Color,
          height: 56,
          width: double.infinity,
          onTap: () {
            if (isPaypal) {
              var transctionsData = getTransctionsData();
              exceutePaypalPayment(context, transctionsData);
            } else {
              excuteStripePayment(context);
            }
          },
          isLoading: state is PaymentLoading ? true : false,
          child: Text(
            'Pay',
            style: Apptheme.buttonTextStyle,
          ),
        );
      },
    );
  }

  void excuteStripePayment(BuildContext context) {
    PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(
      amount: '100',
      currency: 'USD',
      cusomerId: 'cus_T1RdWkShzFfg3U',
    );
    BlocProvider.of<PaymentCubit>(
      context,
    ).makePayment(paymentIntentInputModel: paymentIntentInputModel);
  }

  void exceutePaypalPayment(
    BuildContext context,
    ({AmountModel amount, ItemListModel itemList}) transctionsData,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: ApiKeys.clientID,
          secretKey: ApiKeys.paypalSecretKey,
          transactions: [
            {
              "amount": transctionsData.amount.toJson(),
              "description": "The payment transaction description.",
              "item_list": transctionsData.itemList.toJson(),
            },
          ],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            log('onSuccess: $params');
            Navigator.pop(context);

            Future.microtask(() {
              _showResultDialog(
                context,
                title: 'Payment Success',
                message: 'Your PayPal payment was completed successfully.',
                isSuccess: true,
              );
            });
            Navigator.pop(context);
          },
          onError: (error) {
            log('onError: $error');
            Navigator.pop(context);
            Future.microtask(() {
              _showResultDialog(
                context,
                title: 'Payment Error',
                message: error.toString(),
                isSuccess: false,
              );
            });
          },
          onCancel: () {
            log('cancelled:');
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  void _showResultDialog(
    BuildContext context, {
    required String title,
    required String message,
    required bool isSuccess,
  }) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: Apptheme.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Row(
            children: [
              Icon(
                isSuccess ? Icons.check_circle : Icons.error,
                color: isSuccess ? Colors.green : Colors.red,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: Apptheme.buttonTextStyle,
              ),
            ],
          ),
          content: Text(
            message,
            style: Apptheme.buttonTextStyle,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
              child: Text(
                'OK',
                style: Apptheme.buttonTextStyle,
              ),
            ),
          ],
        );
      },
    );
  }
}
