class NotificationController < ApplicationController 
    before_action : authenticate_user!

    def index 
        @notifications = current_user.notifications.map(&:to_notifcation) 
    end
end 

