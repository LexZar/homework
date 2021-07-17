# Необходимо прочитать файл, затем запросив у пользователя
# ввод возраста, найти в результатах чтения файла, студента 
# чей возраст равен введеному числу и записать этого студента(тов)
# в другой файл с назаванием results.txt. После этого перезаписать ввод.
# Программа завершается выводом на экран содержимого файла results.txt
# построчно, если все студенты из первого файла были записаны во второй или
# если пользователь ввел с клавиатуры -1.

f_students = File.new("data/students.txt", "r:UTF-8")
lines = f_students.read
puts "Данные из файла students.txt\n #{lines}"
f_students.close

students = []
results = []

f_students = File.open("data/students.txt", 'r') do |file|
  file.each_line { |x| students.push(x) }
end

f_students.close

age = nil
loop do
  file_path = "data/results.txt"
  f_results = File.new(file_path, "a+:UTF-8")
  r_lines = f_results.read 
  puts "Введите возраст студента для записи в файл results.txt (для выхода введите -1)"
  age = gets
  results = students.select{|item| item.include?(age)}
  f_results.puts(results)
  results = students.reject!{|item| item.include?(age)}
  f_results.close
  break if age.to_i == -1 || students.empty?
end

f_results = File.new("data/results.txt", "r+:UTF-8")
puts "Данные из файла results.txt"
puts f_results.read
f_results.close
