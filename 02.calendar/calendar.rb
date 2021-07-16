require 'date'
require 'optparse'

def calendar(year: Date.today.year, month: Date.today.month)
  firstday = Date.new(year, month, 1) #日にち
  lastday = Date.new(year, month, -1)

  first_wday = firstday.wday #曜日
  lastday_date = lastday.day #最終日
  week = %w(日 月 火 水 木 金 土)

  header = firstday.strftime("%m月, %Y")  #タイトル

  puts header.center(20) #曜日設定&表示
  puts week.join(" ")
  print "  " * first_wday

  days = (1..lastday_date).map do |date|  #カレンダーっぽく表示する
    date.to_s.rjust(2)
  end 

  format_days = Array.new(first_wday, '').push(days).flatten.each_slice(7).to_a

  format_days.each do |weeks|
    puts weeks.join(' ')
  end 
  print "\n"
end 


#オプション
def option_parse
  options = {}
  OptionParser.new do |opts|
    opts.on('-y', '--year YEAR') do |v| 
      options[:year] = v.to_i
    end 

    opts.on('-m', '--month MONTH') do |v| 
      options[:month] = v.to_i
    end 
  end.parse!
  options
end

calendar(**option_parse)
