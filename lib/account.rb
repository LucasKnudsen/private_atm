require 'date'

class Account 
    STANDARD_VALIDITY_YRS = 5
    def set_expire_date
        Date.today.next_year(STANDARD_VALIDITY_YRS).strftime("%m/%y")
    end

    attr_accessor :exp_date
    attr_accessor :account_status
    attr_accessor :pin_code
    def initialize
        @exp_date = set_expire_date()
        @account_status = :active
        @pin_code = rand(1000..9999)
    end

    def deactivate
        @account_status = :disabled
    end

end
