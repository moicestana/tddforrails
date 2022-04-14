require 'rails_helper'

#RSpec.describe Food, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
#end

RSpec.describe Food, type: :model do

  it "is invalid with non-numeric price" do
    food = Food.create(
        name: "Nasi Uduk",
        description: "Betawi style steamed rice cooked in coconut milk. Delicious!",
        price: "abc"
      )

    food.valid?

    expect(food.errors[:price]).to include("is not a number")
  end  

  it "is invalid with a price less than 0.01" do
    food = Food.create(
        name: "Nasi Uduk",
        description: "Betawi style steamed rice cooked in coconut milk. Delicious!",
        price: 0.0
      )

    food.valid?

    expect(food.errors[:price]).to include("must be greater than or equal to 0.01")
  end
  
end
