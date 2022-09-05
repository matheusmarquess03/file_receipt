module Sales
  class CalculateTotalService < ApplicationService
    def initialize; end

    def call
      calculate_total
    end

    private

    def calculate_total
      Sale.select(:quantity).joins(:item).sum('price*quantity')
    end
  end
end