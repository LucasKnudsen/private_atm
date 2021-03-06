require 'date'
require 'pry'
require './lib/account.rb'
require './lib/atm.rb'

class Person 

    attr_accessor :name, :cash, :account

    def initialize(attrs = {})
        set_name(attrs[:name])
        @cash = 0
        @account = nil
    end

    public

    def create_account
        @account = Account.new(owner: self)
    end

    def deposit(args = {})
        if @account == nil
            throw_account_error
        elsif @cash < args[:amount] 
            throw_cash_error
        else
            deposit_func(args)
        end
    end

    def withdraw(args = {})
        @account == nil ? throw_account_error : withdraw_func(args)
    end

    private

    def add_cash(amount)
        @cash += amount
    end

    def deposit_func(args)
        args[:atm] == nil ? throw_atm_error : atm = args[:atm]
        amount = args[:amount]
        @account.balance += amount
        @cash -= amount
        atm.funds += amount
        { status: true, message: 'Deposit was successful', amount: amount, date: Date.today }
    end
    
    def withdraw_func(args)
        args[:atm] == nil ? throw_atm_error : atm = args[:atm]
        account = @account
        amount = args[:amount]
        pin = args[:pin_code]
        response = atm.withdraw(amount, pin, account)
        response[:status] == true ? add_cash(args[:amount]) : response
        response
    end

    def throw_account_error
        raise 'No account present'
    end

    def throw_cash_error
        { status: false, message: 'Not enough cash', date: Date.today }
    end

    def set_name(name)
        name == nil ? throw_name_error : @name = name
    end

    def throw_name_error
        raise 'A name is required'
    end

    def throw_atm_error
        raise 'Need ATM to withdraw money'
    end

end