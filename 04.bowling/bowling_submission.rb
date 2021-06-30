#引数をとる
score = ARGV[0]

#1投毎に分割する
scores = score.split(',')
shots = [] # shots - Array.new

#数字に変換
scores.each do |s|
  if s == 'X'
    shots << 10
    shots << nil
  elsif s == 'S' #spare
    shots << 10
  else
    shots << s.to_i
  end
end

#フレーム毎に分割
frames = []
shots.each_slice(2) do |s|
  frames << s.compact
end

last_frame = frames.slice(9..).flatten.compact #compactはnilを消す
#p last_frame

front_frame = frames.slice(..8)
front_frame.push(last_frame) #()使ってもスペースでもおｋ

#p front_frame

point = 0
p front_frame #あるべき形のフレーム
front_frame.each.with_index do |frame, i|
    frame_point = 0
    if i == 9
        frame_point = frame.sum
    else 
        if frame[0] == 10 #strike
            frame_point = (10 + frames[i+1][0])
            frame_point += frames[i+1][1] || frames[i+2][0] #
        elsif frame.sum == 10 #spare
            frame_point = frames[i+1][0] + 10
        else  #normal
            frame_point = frame.sum
        end
    end 
    point += frame_point 
end 

p point