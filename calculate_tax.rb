module CalculateTax

  def item_exclude?(item)
    item.split.any? {|name| ["book", "chocolate","chocolates", "pill", "pills"].include? name}
  end

  def is_imported?(item)
    item.include?("imported")
  end

  def tax_rate(item) 
    rate = item.price*10.0/100
    item_exclude?(item.item_name)? rate = 0 : rate = item.price*10.0/100
    rate += (item.price*5.0/100).ceil(1) if is_imported?(item.item_name)

    @total_sales_tax += rate
    rate
  end

end