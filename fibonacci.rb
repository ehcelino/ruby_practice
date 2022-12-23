# Gerador de sequência de fibonacci com recursão
# fibonacci_seq(len): gera len números da sequência de fibonacci.
# fibonacci(number): gera o número de fibonnaci na posição number da sequência

def fibonacci(number)
  if number < 2
    number
  else
    fibonacci(number - 1) + fibonacci(number - 2)
  end
end

def fibonacci_seq(len)
  result = []
  (1..len).each {|n| result << fibonacci(n)}
  result
end

puts ''
puts fibonacci(10)
puts ''
print fibonacci_seq(10)
puts ''
