class Event < ApplicationRecord
  validates :artist,
    :presence => true

  validates :price_low,
    :presence => true,
    :numericality => { greater_than: 0 }

  validates :price_high,
    :presence => true,
    :numericality => { greater_than: 0 }

  validates :event_date,
    :presence => true,
    :allow_blank => false,
    :allow_nil => false

  has_many :tickets

  validate :event_date_not_from_past,
    :price_high_cannot_be_lower_than_low,
    :price_low_cannot_be_higher_than_high

  def event_date_not_from_past
    if event_date < Date.today
      errors.add('Event date', 'cannot be from the past')
    end
  end

  def price_high_cannot_be_lower_than_low
    if price_high < price_low
      errors.add('Price high', 'cannot be lower than low')
    end
  end

  def price_low_cannot_be_higher_than_high
    if price_low > price_high
      errors.add('Price low', 'cannot be higher than high')
    end
  end
end
