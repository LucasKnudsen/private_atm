require 'date'

class Person 

    attr_accessor :name
    attr_accessor :cash

    def initialize(attrs = {})
        set_name(attrs[:name])
        @cash = 0
    end

    def set_name(name)
        name == nil ? throw_name_error : @name = name
    end

    def throw_name_error
        raise 'A name is required'
    end

end