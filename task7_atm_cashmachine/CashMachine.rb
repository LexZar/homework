class CashMachine
    def initialize
      puts "Введите:\n D - для того что бы положить деньги\n W - для того что бы снять деньги\n B - для просмотра баланса\n Q - для выхода"
    end
  
    def deposit
      puts "Сколько вы хотите положить на счет?\n 100\n 200\n 500\n 1000"
        deposit = gets.to_f
          if deposit == 100 || deposit == 200 ||  deposit == 500 || deposit == 1000
            if File.exist?("balance.txt")
              f_balance = File.new("balance.txt", "r:UTF-8")
              balance = f_balance.read.to_f
              f_balance.close
            else
              balance = 100.0
            end   
            new_balance = balance + deposit
            f_balance = File.new("balance.txt", "w:UTF-8")
            f_balance.puts(new_balance)
            f_balance.close
          else
          puts "Только указанные суммы"
          end 
    end
  
    def withdraw
      if File.exist?("balance.txt")
        f_balance = File.new("balance.txt", "r:UTF-8")
        balance = f_balance.read.to_f
        puts "Ваш баланс #{balance}. Вы можете снять не больше #{balance}.Сколько Вы хотите снять?"
        withdraw = gets.to_f
        f_balance.close
      else
        balance = 100.0
        puts "Ваш баланс #{balance}. Вы можете снять не больше #{balance}.Сколько Вы хотите снять?"
        withdraw = gets.to_f
        f_balance.close
      end  
      if withdraw > 0 && withdraw <= balance
        new_balance = balance - withdraw
        f_balance = File.new("balance.txt", "w:UTF-8")
        f_balance.puts(new_balance)
        f_balance.close
      else
        puts "Недостаточно средств на вашем счету"
      end 
    end
  
    def balance
      if File.exist?("balance.txt")
        f_balance = File.new("balance.txt", "r:UTF-8")
        lines = f_balance.read.chomp
        f_balance.close
        puts "Ваш баланс: #{lines}"
      else
        puts "Ваш баланс: 100"
      end
    end

    def init
      loop do
        input = gets.downcase.chomp
    
        if input === "d"
          deposit
        elsif  input === "w"
          withdraw   
        elsif input ==="b" 
          balance
        elsif input === "q" 
          break
        else
          puts "Только D W B Q"  
        end
          initialize
      end
    end
  end