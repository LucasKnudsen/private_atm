require './lib/account.rb'
require 'date'

describe Account do
    it 'check the length of PIN code' do
        number = 1234
        expect(number.to_s.size).to eq 4
    end

    it 'is expected to have an expiry date on initialize' do
        expected_date = Date.today.next_year(5).strftime("%m/%y")
        expect(subject.exp_date).to eq expected_date
    end

    it 'is expected to have an account status of active on initialize' do
        expect(subject.account_status).to eq :active
    end
    
end