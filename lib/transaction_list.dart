import'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transactions.dart';

class TransactionsList extends StatelessWidget{
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionsList(this.transactions, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 5
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: EdgeInsets.all(6),
                  child: FittedBox(
                    child: Text('\$${transactions[index].amount}'),

                  ),
                ),
              ),
              title: Text(
                transactions[index].title,
                style: Theme.of(context).textTheme.title,
              ),
              subtitle: Text(DateFormat.yMMMd().format(transactions[index].date),
              ),
              trailing: IconButton(icon: Icon(Icons.delete), color: Theme.of(context).errorColor,
                onPressed: () => deleteTx(transactions[index].id),
              ),
            ),
          );
        },
        itemCount: transactions.length ,
      ),
    );
  }
}