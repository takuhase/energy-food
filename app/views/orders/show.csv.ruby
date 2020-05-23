require 'csv'

export_file = CSV.generate do |csv|
  cols = {
    '日替料理ID' => -> (u) { u.id },
    '中国名' => -> (u) { u.chinese_name },
    '英語名' => -> (u) { u.english_name },
    '金額' => -> (u) { "#{u.alacarte_price}円" },
  }

  # header
  csv << cols.keys

  # body
  @foods.each do |food|
    csv << cols.map { |k, col| col.call(food) }
  end
end

export_file << "合計,,, #{@total_price}円"
