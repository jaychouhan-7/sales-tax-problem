require './application_model.rb'
require './calculate_tax.rb'

class Order < ApplicationModel
  
  include CalculateTax
  
  has_many :items

  attr_accessor :object_id, :total_price, :total_sales_tax

  def initialize(object_id,*args)
    @total_price = 0
    @total_sales_tax = 0
    @object_id = object_id
    args.each_with_index do |_,i|
      Item.new(object_id,args[i])
    end
  end

  def final_price(item)
    @total_price += item.price
    item.price + tax_rate(item)
  end

  def get_items(name)
    found = []
    self.items.each do |item|
      item.orders.each do |order|
        found << order if order.include?(name)
      end
    end
    puts "Items found: #{found.length}"
    puts found
  end

  def print_receipt
    self.items.each_with_index do |item,i|
      puts "#{item.quantity} #{item.item_name}: #{format( "%.2f",((final_price(item)*20).round(2)/20.0 ))}"
    end
    puts "Sales Taxes: #{format("%.2f",@total_sales_tax)}"
    puts "Total: #{format("%.2f",@total_price + @total_sales_tax)}"
    puts 
  end

end
