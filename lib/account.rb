require 'date'

class Account 
    STANDARD_VALIDITY_YRS = 5
    def set_expire_date
        Date.today.next_year(STANDARD_VALIDITY_YRS).strftime("%m/%y")
    end

    attr_accessor :exp_date
    def initialize
        @exp_date = set_expire_date()
    end

end
