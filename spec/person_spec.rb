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

end