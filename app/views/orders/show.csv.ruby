require 'csv'

CSV.generate do |csv|
  cols = {
    '日替料理ID'     => ->(u){ u.id },
    '中国名'  => ->(u){ u.chinese_name },
    '英語名'  => ->(u){ u.english_name },
    '金額'  => ->(u){ "RM #{u.alacarte_price}" }
  }

  # header
  csv << cols.keys

  # body
  @orders.each do |order|
    csv << cols.map{|k, col| col.call(order) }
  end

end
