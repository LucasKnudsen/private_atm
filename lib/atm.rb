class Atm
    attr_accessor :funds
    def initialize
        @funds = 1000
    end

    def withdraw(amount, pin_code, account)
        case
        when insufficient_funds_in_account?(amount, account)
            { status: false, message: 'insufficient funds', date: 'today' }

        when incorrect_pin?(pin_code)
            { status: false, message: 'wrong PIN code', date: 'today' }

        when insufficient_funds_in_atm?(amount)
            { status: false, message: 'insufficient funds in ATM', date: 'today' }

        else
            perform_transaction(amount,account)
        end
    end

    private

    def insufficient_funds_in_account?(amount, account)
        amount > account.balance 
    end
    
    def perform_transaction(amount,account)
        @funds = @funds - amount
        account.balance = account.balance - amount
        return { status: true, message: 'success', date: 'today', amount: amount}
    end

    def insufficient_funds_in_atm?(amount)
        amount > @funds
    end

    def incorrect_pin?(pin_code)
        pin_code != '1234'
    end


end
