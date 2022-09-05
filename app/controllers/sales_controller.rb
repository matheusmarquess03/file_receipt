# frozen_string_literal: true
include ActionView::Helpers::NumberHelper

class SalesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def index
    @total = Sales::CalculateTotalService.call(@user)
    @sales = Sale.where(user_id: @user.id)
    @sales = @sales.paginate(page: params[:page], per_page: 10)
  end

  def import
    @import = Sales::ImportService.call(params[:file], @user)
    @total_gross_income = ::Sales::ImportService.call(params[:file], @user)

    if @import[:success]
      redirect_to sales_path,
                  notice: "Sales was successfully imported. Total gross income: #{number_to_currency(@import[:value])}"
    else
      redirect_to sales_path, flash: { error: @import[:value] }
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end
end
