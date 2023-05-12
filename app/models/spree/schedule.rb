module Spree
  class Schedule < Spree::Base
    acts_as_paranoid

    has_many :schedules_stock_locations, class_name: 'Spree::SchedulesStockLocation'
    has_many :stock_locations, through: :schedules_stock_locations, class_name: 'Spree::StockLocation'

    before_validation :set_day_code

    validates :day_code, :day, :starts_at, :ends_at, presence: true

    scope :enables, -> { where(closed:  false) }

    def set_day_code
      self.day_code = I18n.t('date.day_names').map(&:downcase).find_index(day.downcase)
    end
  end
end
