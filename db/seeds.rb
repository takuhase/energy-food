#Guest User
User.create!(name: 'Guest User',
             email: 'guest@example.com',
             password: SecureRandom.urlsafe_base64)

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
  ['炸腐竹', 'Fried Crispy Fuchuk', 6],
  ['褐色酱鸡丁', 'Brown Sauce Chicken Cubes', 1],
  ['白兰式蒸鸡', 'Brand\'s Steamed Chicken', 1],
  ['娘惹炸鸡', 'Inchi Kabin Fried Chicken', 1],
  ['铁板烧肉片', 'Teppanyaki Pork', 2],
  ['咖喱肉片', 'Creamy Curry Pork', 2],
  ['香菇炒肉碎', 'Mushroom Minced Pork', 2],
  ['柠檬鱼片', 'Lemon Fish Fillet', 3],
  ['鲍鱼酱焖豆腐', 'Abalone Sauce Braised Soft Tofu', 4],
  ['蒸水蛋', 'Steamed Silky Egg', 4],
  ['菜补煎蛋', 'Dried Radish Omelette', 4],
  ['什炒莲藕', 'Assorted Lotus Roots', 5],
  ['清炒菜心', 'Stir Fry Choi Sam', 5],
  ['包菜炒腐竹', 'StirFry Cabbage with Fuchuk', 5],
  ['三巴长豆茄子', 'Sambal Longbean & Brinjal', 5],
  ['树仔菜炒蛋', 'Money Chai with Egg', 5],
  ['炸薯角', 'Potato Wedges', 6],
  ['金沙咸蛋鸡丁', 'Salted Egg Yolk Chicken Cubes', 1],
  ['帝皇蒸鸡', 'Emperor’s Herb Steamed Chicken', 1],
  ['泰式鸡片', 'Thai Style Tender Chicken Fillet', 1],
  ['甘香肉片', 'Kam Heong Pork', 2],
  ['蒙古肉片', 'Mongolian Stir Fry Pork', 2],
  ['咸鱼蒸肉碎', 'Steamed Salted Fish MincedPork', 2],
  ['香炸鱼片', 'Golden Fish Fillet', 3],
  ['金瓜酱豆腐', 'Pure Pumpkin Sauce Egg Tofu', 4],
  ['香炸白饭鱼蒸豆腐', 'Fried Silverfish Steamed Tofu', 4],
  ['粉丝炒蛋', 'Glass Noodle Scrambled Egg', 4],
  ['清炒菜旦', 'Garlic Choy Tam', 5],
  ['马来风光', 'Belacan Kangkung', 5],
  ['清炒羊角豆', 'Stir Fry Ladyfingers ', 5],
  ['清炒季豆', 'Garlic Frenchbeans', 5],
  ['焖马铃薯', 'Soybraised Potatoes', 5],
  ['炸春卷', 'Fried Loh Bak', 6],
  ['日式照烧酱鸡丁', 'Japanese Teriyaki Chicken Cubes', 1],
  ['芋头焖鸡', 'Yam Braised Chicken', 1],
  ['南乳炸鸡', 'Nam Yu Fried Chicken', 1],
  ['咕噜肉', 'Sweet & Sour Pork', 2],
  ['五香炸肉', '5 Spice Fried Pork', 2],
  ['泰式炒肉碎', 'Thai Basil Minced Pork', 2],
  ['泰式鱼片', 'Thai Style Fish Fillet', 3],
  ['肉碎蒸豆腐', 'Minced Meat Egg Tofu', 4],
  ['麻婆豆腐', 'Mapo Tofu', 4],
  ['长豆煎蛋', 'Longbean Omelette', 4],
  ['咖喱什菜', 'Assorted Vegetable Curry', 5],
  ['清炒油麦', 'Garlic Yau Mak', 5],
  ['包菜丝炒培根', 'Shredded Cabbage with Bacon', 5],
  ['苦瓜炒咸蛋', 'Bittergourd with Salted Egg', 5],
  ['粉丝丝', 'Shredded Vege with Tanghoon', 5],
  ['炸海鲜块', 'Fried Seafood Nuggets', 6],
  ['家乡咖喱鸡', 'Creamy Curry Chicken Potatoes', 1],
  ['士林鸡片', 'Shihlin Tender Chicken Fillet', 1],
  ['焖肉骨茶', 'Bakuteh Style Braised Pork ', 2],
  ['客家焖猪肉', 'Hakka Stewed Pork', 2],
  ['家乡炒面', 'Ala Carte Fried Mee', 3],
  ['卤豆干/蛋', 'SoyBraised Beancurd & Eggs', 4],
  ['肉碎蒸全蛋', 'Steamed WholeEgg with Mincedpork', 4],
  ['芙蓉蛋', 'Fu Yong Omelette', 4],
  ['甜豆西兰花', 'Assorted Broccoli/Sweet Peas', 5],
  ['蚝油小白菜', 'Oyster Sauce Siew Bak Choy', 5],
  ['清炒奶白腐竹', 'Stirfry NaiPak with Fuchuk', 5],
  ['三巴臭豆', 'Sambal Petai', 5],
  ['焖佛手瓜', 'Braised Sweet Gourd', 5],
  ['熏鸭片', 'Smoked Duck Slices', 6]
].each do |chinese_name, english_name, food_category_id|
  Food.create!( { chinese_name: chinese_name, english_name: english_name, food_category_id: food_category_id } )
end

# Master data for DailyFood
78.times do |n|
  food_id = n+1
  if food_id <= 16
    date = '2020-05-03'
  elsif food_id <= 32
    date = '2020-05-04'
  elsif food_id <= 48
    date = '2020-05-05'
  elsif food_id <= 64
    date = '2020-05-06'
  else
    date = '2020-05-07'
  end
  DailyFood.create!(date: date,
                    food_id: food_id)
end

# Master data for Order
Order.create!(user_id: 1)
Order.create!(user_id: 2)
Order.create!(user_id: 1)
Order.create!(user_id: 1)

# Master data for OrderDetail
order_1 = Order.first.id
order_2 = Order.second.id
order_3 = Order.third.id
order_4 = Order.find(4).id
[
  [order_1, 1],
  [order_1, 9],
  [order_1, 14],
  [order_2, 2],
  [order_2, 9],
  [order_2, 13],
  [order_3, 19],
  [order_3, 27],
  [order_3, 30],
  [order_4, 37],
  [order_4, 43],
  [order_4, 47]
].each do |order_id, daily_food_id|
  OrderDetail.create!( { order_id: order_id, daily_food_id: daily_food_id } )
end
