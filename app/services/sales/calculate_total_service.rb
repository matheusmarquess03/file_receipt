module Sales
  class CalculateTotalService < ApplicationService
    def initialize(user)
      @user = user
    end

    def call
      calculate_total
    end

    private
    attr_reader :user

    def calculate_total
      Sale.where(user_id: user.id).select(:quantity).joins(:item).sum('price*quantity')
    end
  end
end