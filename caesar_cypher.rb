def caesar_cipher(string, offset)
  array = ('a'..'z').to_a
  result = []
  string.each_char do |c|
    # Se o caracter fizer parte do alfabeto, pega sua posição no array e soma com o número na variável
    # offset. Então é calculado o módulo entre este valor e o número de letras no alfabeto. O resultado
    # do cálculo é a posição do caracter que tomará o lugar do anterior na cifra. Ele é adicionado ao
    # array de respostas.
    if array.include?(c)
      idx = array.index(c)      
      # Aqui usa-se o cálculo do módulo para que se possa percorrer o array de maneira que se o índice
      # ultrapasse o tamanho do array ele volte ao início do mesmo, o que é necessário na caesar cypher.
      # Se o valor de idx + offset for menor que 26, módulo retorna o valor da soma. Se for maior, módulo
      # retorna o resto, ou seja, o valor da soma menos 26.
      m = (idx + offset).modulo(26)
      result << array[m]
      # Este elsif trata os caracteres que estejam em maiúsculas. Sua função é manter estes caracteres
      # como maiúsculos na resposta.
    elsif array.include?(c.downcase)
      idx = array.index(c.downcase)
      m = (idx + offset).modulo(26)
      result << array[m].upcase
      # O else trata o caso de caracteres que não fazem parte do alfabeto, como espaços e pontuação.
    else
      result << c
    end
  end 
  result.join
end


the_end = caesar_cipher("What a string!", 5)
puts "Codificado:", the_end
puts "Decodificado:", caesar_cipher(the_end, -5)