class Ticket < ApplicationRecord
  validates :name,
    :presence => true,
    :length => { minimum: 5 }

  validates :address,
    :presence => true

  validates :email_address,
    :presence => true,
    :format => { with: URI::MailTo::EMAIL_REGEXP }
  
  validates :price,
    :presence => true,
    :numericality => { greater_than: 0 }

  belongs_to :event
  belongs_to :user
end
