    class Event < ActiveRecord::Base
        belongs_to :club
        has_and_belongs_to_many :users
        has_many :tickets, dependent: :destroy
        has_many :comments, dependent: :destroy
        accepts_nested_attributes_for :tickets

        validates :name, presence: true
        validates :event_type, presence: true
        validates :event_time, presence: true
        validates :location, presence: true
        
        has_attached_file :image1, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
        validates_attachment_content_type :image1, :content_type => /\Aimage\/.*\Z/
        has_attached_file :image2, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
        validates_attachment_content_type :image2, :content_type => /\Aimage\/.*\Z/
        has_attached_file :image3, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
        validates_attachment_content_type :image3, :content_type => /\Aimage\/.*\Z/
    end
