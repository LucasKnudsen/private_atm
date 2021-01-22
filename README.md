# atm_challenge_2021  

## Problem Statement  
A bank user is in serious need of cash, but the bank is closed. 
We want to create an automatic mechanism that allows the bank user to withdraw or deposit money from his account at any time of the day.
  
Our app lets a Person be able to .withdraw or .deposit funds from an Atm. The Person has an Account with a balance attribute, as well as a cash attribute, that are both modified accordingly. 
The Atm has a lot of security checks, that verifies whether the Person has enough cash to do a deposit, or enough balance to do a withdraw. It also checks whether the pin_code entered is correct, if the account is active, and if the account has expired.

## Dependencies  
rspec

## Setup & instructions
1) **bundle** to require in dependencies  
2) in *irb* **require './lib/person.rb**  
3) Instantiate the classes:
**person = Person.new(name: 'name')**  
**atm = Atm.new**  
**person.create_account**  
4) You can now deposit or withdraw from person:  
**person.deposit(some_amount)**  
**person.withdraw(amount: some_amount, pin_code: person.  account.pin_code, account: person.account, atm: atm)**  

## Acknowledges  
We'd like to dedicate this challenge to Binding.pry. A true blessing in disguise. 

## Improvement Plans  
The withdraw method is long and complicated to call. This could be fixed, so that some variables are pre-fixed, or self.called or something similar. 

Give the Atm the feature to accept Bitcoin and adding a digital wallet to Person.

Adding a is_broken? attribute to Atm. Perhaps someone tried to rob it?

Adding service checks on Atm. So at a certain time every day, the Atm is updating and is thus unavailable. 

Adding easter egg. If Account's pin_code is *the lucky number*, the Atm will spit out all of its funds!  

## License  
Rspec - MIT License

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



