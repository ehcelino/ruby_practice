# Algoritmo que organiza um array de números por valor do menor para o maior

class MergeSort
  def sort(array)
    left_array = []
    right_array = []
    # se o array for menor ou igual a um não há nada a fazer, retorna o array.
    return array if array.size <= 1
    array_size = array.size
    array_half = (array_size / 2).round
    array_half += 1 if array_size.odd?
    # separa os valores entre o left e o right array
    array.each_with_index do |item, idx|
      if idx < array_half
        left_array << item
      else
        right_array << item
      end
    end
    # usa recursão para ordenar os arrays divididos
    sorted_left_array = sort(left_array)
    sorted_right_array = sort(right_array)
    # une os arrays novamente
    merge(sorted_left_array, sorted_right_array)
  end

  def merge(left_array, right_array)
    # se um dos arrays estiver vazio, retorna o outro
    if right_array.empty?
      return left_array
    end
    if left_array.empty?
      return right_array
    end
    # retira o primeiro elemento de um array se for menor ou igual ao elemento no outro
    # até sobrar somente um valor
    smallest_number = if left_array[0] <= right_array[0]
      left_array.shift
    else
      right_array.shift
    end
    # aplica o merge novamente
    recursion = merge(left_array, right_array)
    # soma o array contendo o menor número com o resultado da recursão
    [smallest_number].concat(recursion)
  end
end

array = [1,2,3,4].shuffle
print array
print MergeSort.new.sort(array)