require './application_model.rb'


class Item < ApplicationModel

  attr_accessor :orders, :order_id, :item_name, :quantity, :price, :sales_tax, :total

  def initialize(order_id,item)

    @orders = []

    
    @order_id = order_id

    @sales_tax = 0
    @total = 0

    @quantity = item.split.first.to_i
    @item_name = item.split.slice(1,item.split.length-3).join(" ")
    @price = item.split.last.to_f
    @orders << item
  end

end


