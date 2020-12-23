  # あっちむいてほいの処理
  def direction
    directions = ["上", "下", "左", "右"]
    puts "-------------------------"
    puts "あっちむいて〜"
    puts "0(上) 1(下) 2(左) 3(右)"
    @user_direction = gets.to_i
    @rival_direction = rand(0..3)
    puts "ほい！"
    puts "-------------------------"
    puts "あなたは#{directions[@user_direction]} 相手は#{directions[@rival_direction]}" 
  end
  
  # あっちむいてほい勝利
  def direction_win
    puts "勝利!!"
  end
  
  # あっちむいてほい敗北
  def direction_lose
    puts "敗北。。。"
  end
  
  # 結果の出力
  def result
    puts "あなたは#{@jankens[@choose]}, 相手は#{@jankens[@rival_choose]}を出しました"
  end
  
  puts "ジャンケン...."
  
  # ジャンケンの処理
  def janken
    puts "0(グー)1(チョキ)2(パー)3(降参...)"
    
    @choose = gets.to_i
    @rival_choose = rand(0..2)
    @jankens = ["グー", "チョキ", "パー"]
    
    if @choose > 3
      puts "そんな手は無い！(0〜3を入力してください。)"
      puts "-------------------------------------------"
      return true
    end
    
    if @choose == 3
      puts "降参します。。。。"
      return false
    
    # 引き分け
    elsif @choose == @rival_choose
      puts "ぽん！！"
      result
      puts "あいこで..."
      return true
    
    # ジャンケンに勝利
    elsif (@choose == 0 && @rival_choose == 1) || (@choose == 1 && @rival_choose == 2) || (@choose == 2 && @rival_choose == 0)
      puts "ぽん！！"
      result
      puts "ジャンケンに勝ちました！"
      direction
      if @user_direction == @rival_direction
        direction_win
        return false
      else
        puts "もう一度ジャンケン...."
        return true
      end
    
    # ジャンケンに敗北
    else
      puts "ぽん！！"
      result
      puts "ジャンケンに負けました！"
      direction
      if @user_direction == @rival_direction
        direction_lose
        return false
      else
        puts "もう一度ジャンケン...."
        return true
      end
    end 
  end
  
  
  next_game = true
  
  while next_game
    # jankenメソッドの返り値が入る
    next_game = janken
  end