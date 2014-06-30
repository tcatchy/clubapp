class Club < ActiveRecord::Base
	belongs_to :location
	has_many :events, dependent: :destroy
    has_and_belongs_to_many :users
    has_and_belongs_to_many :announcements
	accepts_nested_attributes_for :events

	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	       :recoverable, :rememberable, :trackable, :validatable

    validates :name, presence: true, uniqueness: true
    validates :reg_no, presence: true
    validate :club_in_system

    validates :president_first_name, presence: true
    validates :president_last_name, presence: true
    validates :president_contact, presence: true
    validates :president_email, presence: true

    validates :treasurer_first_name, presence: true
    validates :treasurer_last_name, presence: true
    validates :treasurer_contact, presence: true
    validates :treasurer_email, presence: true

    validates :admin_first_name, presence: true
    validates :admin_last_name, presence: true
    validates :admin_contact, presence: true
    validates :email, presence: true

    validates :nickname, presence: true

    has_attached_file :banner, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :banner, :content_type => /\Aimage\/.*\Z/

    # Validates if club is in the system according to a hash
    # Simulates an admin interface where valid club names and registration numbers are entered
    def club_in_system
    	valid_clubs = {"isa" => 999, "hs" => 1000, "ps" => 1001, "esls" => 1002, "mubs" => 1003,
        "kmc" => 1004, "muac" => 1005, "as" => 1006, "mufl" => 1007, "mucc" => 1008, "muds" => 1009,
        "muns" => 1010, "pcmu" => 1011, "muas" => 1012, "muha" => 1013, "muusc" => 1014,
        "mubw" => 1015, "ic" => 1016, "asmu" => 1017, "envi" => 1018, "mumpc" => 1019, "cissa" => 1020, 
        "mugc" => 126, "mass" => 125}
		unless valid_clubs[nickname] == reg_no
			errors.add(:base, "Your club is not registered with our system.")
		end
	end
end
