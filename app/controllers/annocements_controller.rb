class AnnouncementsController < ApplicationController 
    before_action : marks_as_reads , if :: user_signed_in? 
    def index 
        @announcements = Announcement.order(published_at : :desc)
    end 
    private 
    def marks_as_read
        current_user.update(announcements_last_read_at:Time.zone.now)
    end
end
