# Dada uma coleção de itens, cada um com um peso e um valor, determine quais itens serão incluídos em uma
# coleção para que o peso total seja menor ou igual a um limite, e o valor total seja o maior possível.
# Esta implementação não permite a repetição de itens já adicionados.

# Funciona corretamente.

# Os itens são formados por [valor, peso]

class Knapsack
  # solve(items,capacity) - items: array of arrays [[value, weight]], capacity: integer (capacity of container)
  def solve(items,capacity)
    array = Array.new(items.size + 1) { Array.new(capacity + 1, 0) }

    (0..capacity).each do |j|
      array[0][j] = 0
    end

    (1..items.length).each do |i|
      array[i][0] = 0
    end

    (1..items.length).each do |i|
      (0..capacity).each do |j|
        if items[i-1][1] > j
          array[i][j] = array[i - 1][j]
        else
          array[i][j] = [array[i - 1][j], array[i-1][j-items[i-1][1]] + items[i-1][0]].max
        end
      end
    end

    i = items.length
    j = capacity
    selected_items = []
    while i > 0 && j > 0
      if array[i][j] != array[i-1][j]
        selected_items << i-1
        j -= items[i-1][1]
      end
      i -= 1
    end

    return [array[items.length][capacity], selected_items.reverse]
  end 
end


items = [[0,0],[5,2],[3,1],[4,3],[2,2]]
capacity = 5

p Knapsack.new.solve(items,capacity)

items = [[10,5],[4,8],[9,12],[7,3],[11,7]]
capacity = 10

p Knapsack.new.solve(items,capacity)

items = [[11,7],[7,3],[9,12],[4,8],[10,5]]
capacity = 10

p Knapsack.new.solve(items,capacity)