class DeviseCreateUsers < ActiveRecord : : Migration [6.1] 
    def change 
        create_table :users do |t| 
            # Database authticatable 
            t.string :email , null : false , default : "" 
            t.string :encrypted_password , null : false 

            #Recoverable 
            t.string : reset_password_token
            t.datetime : reset_password_sent_at
            
            #rememberable
            t.datetime : remember_created_at

            # trackable 
            t.integer : sign_in_count , default : 0 , null :  false 
            t.datetime : current_sign_in_at 
            t.datetime : last_sign_in_at 
            t.string : current_sign_in_ip 
            t.string : last_sign_in_ip 
            
            #confirmable 

            t.string : confirmation_token 
            t.datetime : confirmed_at 
            t.datetime : confirmation_sent_at 
            t.string : unconfirmed_email   # only if using reconfirmable 

            # lockable
            t.integer : failed_attempts , default : 0 , null : false 
            # only if lock strategy is :failed_attempts 
            t.string : unlock_token # only if unlock strategy is : email or :both 
            t.datetime :locked_at 

            t.string : first_name 
            t.string : last_name
            t.datetime : announcements_last_read_at
            t.boolean : admin , default : false 
        end 
        add_index :users , :email ,
        add_index :users , :reset_password_token, 
        add_index :users , :confirmation_token ,
        add_index :users , :unlock_token ,
    end 
end 









