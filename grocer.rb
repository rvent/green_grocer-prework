data =   [
    {"AVOCADO" => {:price => 3.00, :clearance => true}},
    {"KALE" => {:price => 3.00, :clearance => false}},
    {"AVOCADO" => {:price => 3.00, :clearance => true}},
    {"AVOCADO" => {:price => 3.00, :clearance => true}}
  ]

coupons =
  [
    {:item => "AVOCADO", :num => 2, :cost => 5.00},
    {:item => "AVOCADO", :num => 2, :cost => 5.00}
    # {:item => "BEER", :num => 2, :cost => 20.00},
    # {:item => "CHEESE", :num => 3, :cost => 15.00}
  ]

def consolidate_cart(cart)
  # code here
  consolidated_cart = {}
  cart.each do |items|
    items.each do |name, values|
      if consolidated_cart[name] == nil
        consolidated_cart[name] = values
      end
      if consolidated_cart[name][:count] == nil
        consolidated_cart[name][:count] = 1
      else
        consolidated_cart[name][:count] += 1
      end
    end
  end
  consolidated_cart
 end
p data
# puts consolidate_cart(data)

def apply_coupons(cart, coupons)
  # code here
  new_cart = consolidate_cart(cart).clone
  p new_cart
  consolidated = consolidate_cart(cart).clone
  item_values =  coupons.map {|item| item.values}
  item_values.each_with_index do |selection, i|
    name = selection[0]
    if new_cart[name] != nil
      new_name = "#{name} W/COUPON"
      p"B4 w", new_cart[new_name], "B4 w/o", new_cart[name]
      if new_cart[new_name] == nil
        new_cart[new_name] = new_cart[name].clone
        #new_cart[new_name][:price] = coupons[i][:cost]
      end
      #   new_cart[new_name][:count] = 1
      # else
      #   new_cart[new_name][:count] += 1
      # end
      p new_name, new_cart[new_name], name, consolidated[name]
    end
    # if new_cart[new_name][:count] == nil
    #   new_cart[new_name][:count] = 1
    # else
    #   new_cart[new_name][:count] += 1
    # end
  end
  new_cart
end

p apply_coupons(data, coupons)
p data
def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
