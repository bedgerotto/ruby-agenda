class Contact < ActiveRecord::Base
  belongs_to :kind
  has_one :address
  has_many :phones
  
  validates :name, presence: true, length: {minimum: 2}
  validates :email, presence: true
  
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true
end
