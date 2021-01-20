require './lib/account.rb'
require 'date'

describe Account do
    let(:person) { instance_double('Person', name: 'Noel') }
    subject { described_class.new({owner: person}) }

    it 'is expected to have an owner' do
        expect(subject.owner).to eq person
    end

    it 'is expected to throw an error if there is no owner' do
        expect { described_class.new }.to raise_error 'An Account owner is required'
    end

    it 'check the length of PIN code' do
        expect(subject.pin_code.to_s.size).to eq 4
    end

    it 'is expected to have an expiry date on initialize' do
        expected_date = Date.today.next_year(5).strftime("%m/%y")
        expect(subject.exp_date).to eq expected_date
    end

    it 'is expected to have an account status of active on initialize' do
        expect(subject.account_status).to eq :active
    end

    it 'is expected to disable account status on deactivate method' do
        subject.deactivate
        expect(subject.account_status).to eq :disabled
        # If we use the class method it doesn't affect the instance of the class, which is what we wish.
    end
end