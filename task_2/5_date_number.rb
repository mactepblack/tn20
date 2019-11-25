month_array = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

puts "Введите число, месяц, год через запятую."
date_arr = gets.split(",")

result = date_arr[0].to_i
mm = date_arr[1].to_i
yy = date_arr[2].to_i

for i in 0..(mm-2) do
  result += month_array[i]
end

result += 1 if yy%400 == 0 || (yy%4 == 0 && yy%100 != 0)  

puts "Порядковый номер даты: #{result}" 
