class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable, :invitable,
    :recoverable, :rememberable, :trackable, :validatable, :validate_on_invite => true
        
    validates :name, presence: true
    validates :country, presence: true
    validates :city, presence: true
    validates :email, confirmation: true
    validates :role, presence: true

    if self.created_by_invite
        validate :inviter_has_permission_to_invite
    end

    private

    def inviter_has_permission_to_invite
        inviter = User.find(self.invited_by_id)

        if inviter.role == "admin"
            unless self.role == "staff" || self.role == "volunteer"
                raise CanCan::AccessDenied
            end
        end

        if inviter.role == "staff" || inviter.role == "volunteer"
            raise CanCan::AccessDenied
        end
    end
   
    def role?(role)
        return self.role == role.to_s
    end

    def active_for_authentication?
        if self.role? :admin
            self.approved = super && approved? 
        else
            self.approved = true
        end
    end

    def inactive_message 
        if !approved? 
            :not_approved 
        else 
            super 
        end 
    end
end
