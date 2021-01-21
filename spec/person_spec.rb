require 'date'
require './lib/person.rb'

describe Person do

    subject { described_class.new(name: 'Noel') }
    
    it 'is expected to have a :name on initialize' do
        expect(subject.name).to eq 'Noel'
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
            expect(subject.account.owner).to eq subject.name
        end
    end

    describe 'can manage funds if an account been created' do
        let(:atm) { Atm.new }
        before do
            subject.create_account
            subject.cash = 100 
        end
        
        it 'can deposit funds' do
            expect(subject.deposit(100)).to be_truthy
        end
        it 'but doesnt deposit funds if person have insufficient cash' do
            expected_output = { status: false, message: 'Not enough cash', date: Date.today }
            expect(subject.deposit(250)).to eq expected_output
        end

        it 'funds are added to the account balance and deducted from cash' do
            subject.cash = 100
            subject.deposit(100)
            expect(subject.account.balance).to eq 200
            expect(subject.cash).to eq 0
        end

        it 'can withdraw funds' do
            subject.cash = 0
            subject.withdraw(100,subject.account.pin_code, subject.account, atm: atm)
            expect(subject.cash).to eq 100
        end

        it 'can withdraw funds' do
            withdraw_command = lambda { subject.withdraw(amount: 100, pin_code: subject.account.pin_code, account: subject.account, atm: atm) }
            expect(withdraw_command.call).to be_truthy
        end
    end

    describe 'can manage funds if no account been created' do
        it 'cant deposit funds' do
            expect { subject.deposit(100) }.to raise_error(RuntimeError, 'No account present')
        end


    end


end