class Atm
    attr_accessor :funds
    def initialize
        @funds = 1000
    end

    def withdraw(amount, account)
        case
        when amount > account.balance
            return
        else
            @funds = @funds - amount
            account.balance = account.balance - amount
            return { status: true, message: 'success', date: 'today', amount: amount}
        end
    end
end
