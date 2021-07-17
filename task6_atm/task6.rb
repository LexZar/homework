# Напишите программу, которая начинается с чтения банковского баланса клиента
# из файла с именем balance.txt. Этот файл содежит одну строку со стартовым балансом клиента.
# Если файл не cуществует, используйте стартовый баланс 100.0, который должкен быть константой.
# После этого программа повторно предложит клиенту внести деньги, вывести деньги, проверить баланс 
# или выйти, используя буквы D(deposit), W(withdraw), B(balance), Q(quit). Программа должна принимать 
# на вход значения в верхнем или нижнем регистре.Для депозитов, программа подсказывает сумму.
# Сумма должна быть больше нуля. Если сумма действительна, программа добавляет сумму депозита к балансу клиента
# и отображает новый баланс.
# При снятии средств программа выдаст запрос на сумму. Сумма должна быть больше нуля или равна текущему балансу.
# Если сумма корректна,то программа вычитает сумму вывода из баланса клиента и отображает новый баланс. 
# Для проверки баланса программ просто выводи текущий баланс.
# Когда клиент решит выйти из программы, программа запишет текущий баланс обратно в файл balance.txt.
# В случае неправильного ввода(команда или сумма), ваша программа должна выдать соответсвующее сообщение об ошибке, 
# которое говорит клиенту, как ее исправить. Нельзя просто выводить "Error!"- это не поможет.

loop do
    puts "Введите:\n D - для того что бы положить деньги\n W - для того что бы снять деньги\n B - для просмотра баланса\n Q - для выхода"
    input = gets.downcase.chomp
    
    if input == "d"
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
    elsif input == "w"
      
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
      elsif input == "b" 
        if File.exist?("balance.txt")
          f_balance = File.new("balance.txt", "r:UTF-8")
          lines = f_balance.read.chomp
          f_balance.close
          puts "Ваш баланс: #{lines}"
        else
          puts "Ваш баланс: 100"
        end
    elsif input == "q"
      break
    else
      puts "Только D W B Q"  
    end
  end
  
  puts "Спасибо что воспользовались услугами нашего банка. До свидания."
  