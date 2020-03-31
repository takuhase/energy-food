20.times do |n|
  name  = Faker::JapaneseMedia::DragonBall.character
  email = "example-#{n+1}@energyfood.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password: password,
               password_confirmation: password)
end

# Master data for Nutrient
[
  ['Meat', 3, 5],
  ['Vege', 2, 3]
].each do |name, addon_price, alacarte_price|
  Nutrient.create!( { name: name, addon_price: addon_price, alacarte_price: alacarte_price } )
end

# Master data for FoodCategory
[
  ['Chicken', 1],
  ['Pork', 1],
  ['Fish', 1],
  ['Tofu / Egg', 2],
  ['Vegetables', 2],
  ['Special Items', 2]
].each do |name, nutrient_id|
  FoodCategory.create!( { name: name, nutrient_id: nutrient_id } )
end







# Master data for Food
[
  ['蜜汁鸡丁', 'HK Honey Sesame Chicken Cubes', 1],
  ['姜蓉蒸鸡', 'Ginger Steamed Chicken', 1],
  ['炸盐酥鸡块', 'Pop Corn Fried Chicken', 1],
  ['烟熏酱猪扒片', 'Hickory BBQ Sauce Pork Chop', 2],
  ['什菇炒肉片', 'Assorted Mushroom StirFry Pork', 2],
  ['东菜蒸肉碎', 'Steamed DongChoy MincedPork', 2],
  ['泰式炸鱼饼', 'Thai Fish Cakes', 3],
  ['日式豆腐', 'Claypot Style Egg Tofu', 4],
  ['耗油蒸豆腐', 'Oyster Sauce Steamed Tofu', 4],
  ['三宝炒蛋', '3-Treasure Scrambled Egg', 4],
  ['蒸西兰花', 'Steamed Broccoli with Garlic Oil', 5],
  ['枸杞苋菜', 'Baby Bayam with Goji Berries', 5],
  ['亞參羊角豆', 'Assam Ladyfingers', 5],
  ['苦瓜炒蛋', 'Bittergourd with Egg', 5],
  ['咸蛋炸金瓜', 'Salted Egg Yolk Pumpkin', 5],
  ['炸腐竹', 'Fried Crispy Fuchuk', 6]
].each do |chinese_name, english_name, food_category_id|
  Food.create!( { chinese_name: chinese_name, english_name: english_name, food_category_id: food_category_id } )
end
