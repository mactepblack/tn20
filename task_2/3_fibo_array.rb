fib_array = []
i = 0

while fib_array[-1].to_i + fib_array[-2].to_i < 100 do
  if fib_array.size < 2
    fib_array << i
    i += 1
  else
    fib_array << fib_array[-1] + fib_array[-2]
  end  
end
