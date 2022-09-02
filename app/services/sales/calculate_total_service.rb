module Sales
  class CalculateTotalService < ApplicationService
    def initialize; end

    def call
      calculate_total
    end

    private

    def calculate_total
      Sale.joins(:item).sum(:price)
    end
  end
end