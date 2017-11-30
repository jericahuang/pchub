class Users::InvitationsController < Devise::InvitationsController
    rescue_from CanCan::AccessDenied do |exception|
      redirect_to main_app.root_url, :alert => exception.message
    end

   def new
     if 
      cannot?( :invite, User )
       raise CanCan::AccessDenied
     else
       super
     end
   end

   def create
     if cannot?( :invite, User )
       raise CanCan::AccessDenied
     else
       super
     end
   end
end

