require 'date'

class Account 
    STANDARD_VALIDITY_YRS = 5
    def set_expire_date
        Date.today.next_year(STANDARD_VALIDITY_YRS).strftime("%m/%y")
    end

    attr_accessor :exp_date, :account_status, :pin_code, :balance, :owner
    
    def initialize(attrs = {})
        @balance = 100
        @exp_date = set_expire_date()
        @account_status = :active
        @pin_code = rand(1000..9999)
        set_owner(attrs[:owner])
    end

    def deactivate
        @account_status = :disabled
    end

    private
    def set_owner(obj) 
        obj == nil ? missing_owner_error : @owner = obj
    end
    def missing_owner_error
        raise 'An Account owner is required'
    end

end
