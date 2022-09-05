require 'csv'

module Sales
  class ImportService < ApplicationService
    def initialize(file, user)
      @file = file
      @user = user
    end

    def call
      parser_file
    end

    private

    attr_reader :file, :user

    def parser_file
      return result("File invalid!") unless file_extension_valid?
      return result("File is empty!") if File.empty?(file)

      @total_gross_income = 0

      CSV.foreach(file, headers: true, col_sep: "\t") do |row|
        sale_info = row.to_h

        quantity = sale_info['purchase count'].to_i

        merchant = create_merchant(sale_info)

        item_parsed = parser_item(row)
        item = create_item(merchant, item_parsed)

        purchaser_name = sale_info['purchaser name']
        purchaser = create_person(purchaser_name)

        create_sales(quantity, item, purchaser)

        @total_gross_income += total_gross_income(item_parsed[:item_price], quantity)
      end

      result(@total_gross_income, true)
    end

    def create_merchant(sale_info)
      merchant_name = sale_info['merchant name']
      merchant_address = sale_info['merchant address']
      merchant_address = parser_address(merchant_address)
      merchant = create_person(merchant_name)
      create_address(merchant, merchant_address)
      merchant
    end

    def create_sales(quantity, item, purchaser)
      Sale.find_or_create_by(
        item_id: item.id,
        purchaser_id: purchaser.id,
        quantity: quantity,
        user_id: user.id
      ) unless item.blank? || purchaser.blank?
    end

    def create_person(name)
      Person.where(name: name).first_or_create
    end

    def create_address(person, address)
      number = address[:number]
      street = address[:street]

      person.addresses.where(street: street, number: number).first_or_create(
        street: street,
        number: number
      )
    end

    def parser_address(address)
      number = address&.split&.shift
      street = address&.split&.drop(1)&.join(" ")
      { number: number, street: street }
    end

    def create_item(merchant, item)
      merchant.items.where(description: item[:item_description], price: item[:item_price]).first_or_create
    end

    def parser_item(sale_info)
      item_description = sale_info['item description']
      item_price = sale_info['item price'].to_f
      { item_description: item_description, item_price: item_price }
    end

    def total_gross_income(price, quantity)
      price * quantity
    end

    def file_extension_valid?
      extension = File.extname(file)
      extension == ".tab"
    end

    def result(value, success = false)
      { value: value, success: success }
    end
  end
end