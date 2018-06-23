class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable, :invitable, :confirmable, :omniauthable,
    :recoverable, :rememberable, :trackable, :validatable, :validate_on_invite => true

    validates :name, presence: true, format: { with: /[^!@#\$%\^\*()\[\]\{\}\+_=\?\/<>:~,\"'`;]+/, message: "Please enter a valid name" }, length: { maximum: 255}
    validates :nickname, format: { with: /[^!@#\$%\^\*()\[\]\{\}\+_=\?\/<>:~,\"'`;]+/, message: "Please enter a valid name", allow_blank: true }, length: { maximum: 255}
    validates :country, presence: true, length: { maximum: 255}, unless: -> { from_omniauth? }
    validates :city, presence: true, length: { maximum: 255}, unless: -> { from_omniauth? }
    validates :state_or_province, length: { maximum: 255}
    validates :email, confirmation: true, format: { with: /\b[A-Z0-9._%a-z\-]+@peacecorps\.gov\z/, message: "Must be a peacecorps.gov account" }, length: { maximum: 255}, unless: -> { from_omniauth? }
    validates :role, presence: true

    def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        user.email = auth.info.email
        user.role = 'developer'
        user.city = auth.extra.raw_info.location
        user.github = auth.info.nickname
        user.profile_link = auth.extra.raw_info.html_url
        user.gitAvatar = auth.info.image
        user.additional_information = auth.extra.raw_info.bio
        user.password = Devise.friendly_token[0,20]
        user.skip_confirmation_notification!
        user.skip_confirmation!
        user.save!
      end
    end

    #Returns boolean whether the account was created by OmniAuth
    def from_omniauth?
      provider && uid
    end

    def password_required?
      super && provider.blank?
    end

    if self.created_by_invite == true
        validate :inviter_has_permission_to_invite
    end

    def to_s
        name
    end


    def self.search(search)
        where("name LIKE ?", "%#{search}%")
    end

    def role?(role)
        return self.role == role.to_s
    end

    def admin
        if self.role? :superadmin or self.role? :admin
            return true
        end
    end

    def active_for_authentication?
        if confirmed_at.nil?
            self.approved = false
        else
            if self.role? :admin or self.role? :superadmin
                if self.created_by_invite?
                    self.approved = true
                else
                    self.approved = super && approved?
                end
            else
                self.approved = true
            end
        end
    end

    def inactive_message
        if confirmed_at.nil?
            :unconfirmed
        elsif !approved?
            :not_approved
        else
            super
        end
    end

    protected
    def confirmation_required?
      true
    end

    private

    def inviter_has_permission_to_invite
        inviter = User.find(self.invited_by_id)

        if self.role == "superadmin"
            unless inviter.role == "superadmin"
                raise CanCan::AccessDenied
            end
        end

        if inviter.role == "admin"
            unless self.role == "staff" || self.role == "volunteer"
                raise CanCan::AccessDenied
            end
        end

        if inviter.role == "staff" || inviter.role == "volunteer"
            raise CanCan::AccessDenied
        end
    end
end
