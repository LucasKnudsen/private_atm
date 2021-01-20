# atm_challenge_2021

## Problem Statement
A bank user is in serious need of cash, but the bank is closed. 
We want to create an automatic mechanism that allows the bank user to withdraw money at any time of the day. 

## User Stories
As a bank user
In order to receive cash
I would need to create a cash machine.
*Atm = class*
*Bank user = class*

As a bank user
In order to get cash from the cash machine
I would need the user to be able to withdraw
*withdraw = method*

As a bank user
In order to know if bank user has enough money to withdraw
The bank user needs an account with a balance.
*account = class or sub class to bank user*
*balance = local variable of account*

As an ATM
In order to spit out money
It needs enough funds.
*funds = instance variable to Atm*

As an ATM
In order to let the bank user know whether the withdrawal is accepted
It needs to return a message 
*return a message = case statement*

As a bank user
In order to verify that the account is mine
It needs a PIN code.
*PIN code = private method that returns true if correct argument*

As an ATM
In order to verify the user's account
It needs to know if the PIN code is right
*verification = if PIN method eq. true then proceed with withdrawal*



