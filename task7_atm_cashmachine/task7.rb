# Переписать банкомат на работу с классами
# Класс должен называтся- CashMachine.
# Программа должна запускатся с помощью метода класса init, 
# создавать экземпляр класса и взаимодействовать с пользователем
# соглассно условиям задачи

require "./CashMachine"

# loop do
#     bancomat = CashMachine.new
#     input = gets.downcase.chomp

#     if input === "d"
#       bancomat.deposit
#     elsif  input === "w"
#       bancomat.withdraw   
#     elsif input ==="b" 
#       bancomat.balance
#     elsif input === "q" 
#       break
#     else
#       puts "Только D W B Q"  
#     end   
# end
bancomat = CashMachine.new
bancomat.init