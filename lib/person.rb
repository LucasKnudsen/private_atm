require 'date'
require 'pry'
require './lib/account.rb'

class Person 

    attr_accessor :name
    attr_accessor :cash
    attr_accessor :account

    def initialize(attrs = {})
        set_name(attrs[:name])
        @cash = 0
        @account
    end

    public

    def create_account
        @account = Account.new(owner: @name)
    end

    def deposit(amount)
        @account == nil ? throw_account_error : @account.balance += amount
    end

    private

    def throw_account_error
        raise 'No account present'
    end
    def set_name(name)
        name == nil ? throw_name_error : @name = name
    end

    def throw_name_error
        raise 'A name is required'
    end



end