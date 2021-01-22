require 'date'

class Atm
    attr_accessor :funds
    def initialize
        @funds = 1000
    end

    def withdraw(amount, pin_code, account)
        case
        when insufficient_funds_in_account?(amount, account)
            { status: false, message: 'insufficient funds', date: Date.today }

        when incorrect_pin?(pin_code, account)
            { status: false, message: 'wrong PIN code', date: Date.today }

        when card_expired?(account.exp_date)
            { status: false, message: 'card has expired', date: Date.today }

        when account_disabled?(account.account_status)
            { status: false, message: 'account is disabled', date: Date.today }

        when insufficient_funds_in_atm?(amount)
            { status: false, message: 'insufficient funds in ATM', date: Date.today }
        when isnt_divisible_by_5?(amount)
            { status: false, message: 'amount not divisible by 5', date: Date.today }
        else
            perform_transaction(amount,account)
        end
    end

    private

    def insufficient_funds_in_account?(amount, account)
        amount > account.balance 
    end
    
    def perform_transaction(amount,account)
        @funds -= amount
        account.balance = account.balance - amount
        { status: true, message: 'success', date: Date.today, amount: amount, bills: count_bills(amount)}
    end

    def insufficient_funds_in_atm?(amount)
        amount > @funds
    end

    def incorrect_pin?(pin_code, account)
        pin_code != account.pin_code
    end

    def card_expired?(exp_date)
        Date.strptime(exp_date, '%m/%y') < Date.today
    end

    def isnt_divisible_by_5?(amount)
        amount % 5 != 0
    end

    def account_disabled?(state)
        state != :active
    end

    def count_bills(amount)
        denominations = [20,10,5]
        bills = []
        denominations.each do |bill|
            while amount - bill >= 0
                amount -= bill
                bills.push(bill)
            end
        end
        return bills
    end

end
