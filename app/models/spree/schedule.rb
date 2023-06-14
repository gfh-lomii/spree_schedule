module Spree
  class Schedule < Spree::Base
    acts_as_paranoid

    has_many :schedules_stock_locations, class_name: 'Spree::SchedulesStockLocation'
    has_many :stock_locations, through: :schedules_stock_locations, class_name: 'Spree::StockLocation'

    before_validation :set_day_code

    validates :day_code, :day, :starts_at, :ends_at, presence: true

    scope :enables, -> { where(active: true) }
    scope :today, -> { where(day_code: Date.current.wday) }
    scope :tomorrow, -> { where(day_code: Date.tomorrow.wday) }

    self.whitelisted_ransackable_attributes = %w[name day closed active]
    self.whitelisted_ransackable_scopes = %i(search_by_stock_location_id)

    def set_day_code
      self.day_code = I18n.t('date.day_names').map(&:downcase).find_index(day.downcase)
    end

    def self.search_by_stock_location_id(stock_location_id)
      joins(:schedules_stock_locations).where('spree_schedules_stock_locations.stock_location_id = ?', stock_location_id == true ? 1 : stock_location_id)
    end
  end
end
