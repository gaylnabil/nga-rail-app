class User < ApplicationRecord

    has_secure_password
    
    validates :email, 
                presence: true, 
                uniqueness: true,
                format: {
                    with: URI::MailTo::EMAIL_REGEXP, 
                    message: "must be a valid email address"
                }
                
    validates :name, 
            presence: true,
            length: { 
                maximum: 50, 
                too_long: "%{count} characters is the maximum allowed"
            } 

    validates :password, 
            confirmation: true, 
            length: { 
                minimum: 3 
            }, 
            allow_blank: false

    # validates :password_confirmation, 
    #         length: { 
    #             minimum: 3 
    #         }, 
    #         allow_blank: false
end