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
  ['炸春卷', 'Fried Loh Bak', 6]
















].each do |chinese_name, english_name, food_category_id|
  Food.create!( { chinese_name: chinese_name, english_name: english_name, food_category_id: food_category_id } )
end

# Master data for DailyFood
[
  ['2020-04-20', 1],
  ['2020-04-20', 2],
  ['2020-04-20', 3],
  ['2020-04-20', 4],
  ['2020-04-20', 5],
  ['2020-04-20', 6],
  ['2020-04-20', 7],
  ['2020-04-20', 8],
  ['2020-04-20', 9],
  ['2020-04-20', 10],
  ['2020-04-20', 11],
  ['2020-04-20', 12],
  ['2020-04-20', 13],
  ['2020-04-20', 14],
  ['2020-04-20', 15],
  ['2020-04-20', 16],
  ['2020-04-21', 17],
  ['2020-04-21', 18],
  ['2020-04-21', 19],
  ['2020-04-21', 20],
  ['2020-04-21', 21],
  ['2020-04-21', 22],
  ['2020-04-21', 23],
  ['2020-04-21', 24],
  ['2020-04-21', 25],
  ['2020-04-21', 26],
  ['2020-04-21', 27],
  ['2020-04-21', 28],
  ['2020-04-21', 29],
  ['2020-04-21', 30],
  ['2020-04-21', 31],
  ['2020-04-21', 32],
  ['2020-04-22', 33],
  ['2020-04-22', 34],
  ['2020-04-22', 35],
  ['2020-04-22', 36],
  ['2020-04-22', 37],
  ['2020-04-22', 38],
  ['2020-04-22', 39],
  ['2020-04-22', 40],
  ['2020-04-22', 41],
  ['2020-04-22', 42],
  ['2020-04-22', 43],
  ['2020-04-22', 44],
  ['2020-04-22', 45],
  ['2020-04-22', 46],
  ['2020-04-22', 47],
  ['2020-04-22', 48]
].each do |date, food_id|
  DailyFood.create!( { date: date, food_id: food_id } )
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
