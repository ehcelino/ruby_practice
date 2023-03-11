# Gerador de sequência de fibonacci com recursão
# fibonacci_seq(len): gera len números da sequência de fibonacci.

def fibonacci(number)
  if number < 2
    number
  else
    fibonacci(number - 1) + fibonacci(number - 2)
  end
end

def fibonacci_seq(len)
  result = []
  (0...len).each {|n| result << fibonacci(n)}
  result
end

# Não é necessário fazer por recursão, a sequência pode ser calculada em
# um array:

def fibonacci_seq_2(len)
  result = [0, 1]
  return result if len <= 2

  (2...len).each do |i|
    result << result[i - 1] + result[i - 2]
  end
  result
end

puts ''
print fibonacci_seq(10)
puts ''
print fibonacci_seq_2(10)
puts ''