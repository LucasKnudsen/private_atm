require 'date'
require './lib/person.rb'

describe Person do

    subject { described_class.new(name: 'Noel') }
    
    it 'is expected to have a :name on initialize' do
        expect(subject.name).not_to be nil
    end

    it 'is expected to throw error if no name on initialize' do
        expect { described_class.new }.to raise_error 'A name is required'
    end

    it 'is expected to have a :cash attribute with the value of 0 on initialize' do
        expect(subject.cash).to eq 0
    end

    it 'is expected to have a :account attribute' do
        expect(subject.account).to eq nil
    end

    describe 'can create an Account' do
        before { subject.create_account }
        it 'of Account class' do
            expect(subject.account).to be_an_instance_of Account
        end

        it 'with himself as an owner' do
            expect(subject.account.owner).to eq subject
        end
    end

    describe 'can manage funds if an account been created' do
        let(:atm) { Atm.new }
        before { subject.create_account }
        
        
        it 'can deposit funds' do
            expect(subject.deposit(amount: 100, atm: atm)).to be_truthy
        end

        it 'but doesnt deposit funds if person have insufficient cash' do
            expected_output = { status: false, message: 'Not enough cash', date: Date.today }
            expect(subject.deposit(amount: 150, atm: atm)).to eq expected_output
        end

        it 'funds are added to the account balance and deducted from cash and Atm funds' do
            subject.cash = 100
            subject.deposit(amount: 100, atm: atm)
            expect(subject.account.balance).to eq 200
            expect(subject.cash).to eq 0
            expect(atm.funds).to eq 1100
        end

        it 'can withdraw funds' do
            withdraw_command = -> { subject.withdraw(amount: 100, pin_code: subject.account.pin_code, account: subject.account, atm: atm) }
            expect(withdraw_command.call).to be_truthy
        end

        it 'withdraw is expected to raise an error if no ATM is passed in' do
            withdraw_command = -> { subject.withdraw(amount: 100, pin_code: subject.account.pin_code, account: subject.account) }
            expect {withdraw_command.call}.to raise_error 'Need ATM to withdraw money'
        end

        it 'funds are added to cash - deducted from account balance' do
            subject.cash = 100
            subject.deposit(amount: 100, atm: atm)
            subject.withdraw(amount: 100, pin_code: subject.account.pin_code, account: subject.account, atm: atm)
            expect(subject.account.balance).to eq 100
            expect(subject.cash).to eq 100
            
        end
    end

    describe 'can manage funds if no account been created' do
        it 'cant deposit funds' do
            expect { subject.deposit(amount: 100) }.to raise_error(RuntimeError, 'No account present')
        end


    end


end