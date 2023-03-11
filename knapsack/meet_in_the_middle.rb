# valor, peso

def meet_in_the_middle(items, capacity)
  n = items.length
  mid = n / 2

  # Partition the set into two subsets
  a = items[0...mid]
  b = items[mid..-1]

  # Compute the weights and values of all subsets of each set
  subsets_a = []
  (1..a.length).each do |i|
    subsets_a.concat(a.combination(i).to_a)
  end

  subsets_b = []
  (1..b.length).each do |i|
    subsets_b.concat(b.combination(i).to_a)
  end
  # p subsets_b
  # Find the subset of b of greatest value such that the combined weight is less than capacity for each subset of a
  selected_sb = subsets_b.select { |subset_b| subset_b.inject(0) { |sum, item| sum + item[1] } <= capacity }
  selected_sa = subsets_a.select { |subset_a| subset_a.inject(0) { |sum, item| sum + item[1] } <= capacity }
  max_value = 0
  selected_items = []
  subsets_a.each do |subset_a|
    # Compute the weight and value of the current subset of a
    weight_a = subset_a.inject(0) { |sum, item| sum + item[1] }
    value_a = subset_a.inject(0) { |sum, item| sum + item[0] }
    # Find the subset of b of greatest value such that the combined weight is less than capacity
    subsets_b.select { |subset_b| subset_b.inject(weight_a) { |sum, item| sum + item[1] } <= capacity }
           .each do |subset_b|
      total_value = value_a + subset_b.inject(0) { |sum, item| sum + item[0] }
      if total_value > max_value
        max_value = total_value
        selected_items = subset_a + subset_b
        # p selected_items
      end
    end
    selected_sb.each do |subset_b|
      value_b = subset_b.inject(0) { |sum, item| sum + item[0] }
      value_ab = selected_items.inject(0) { |sum, item| sum + item[0] }
      if value_b > value_ab
        max_value = value_b
        selected_items = subset_b
      end
    end
    selected_sa.each do |subset_a|
      value_a = subset_a.inject(0) { |sum, item| sum + item[0] }
      value_ab = selected_items.inject(0) { |sum, item| sum + item[0] }
      if value_a > value_ab
        max_value = value_a
        selected_items = subset_a
      end
    end
  end

  # Return the greatest combined value seen so far and the positions of the selected items in the original array
  selected_positions = selected_items.map { |item| items.index(item) }
  return [max_value, selected_positions]
end

items = [[0,0],[5,2],[3,1],[4,3],[2,2]]
capacity = 5

p meet_in_the_middle(items, capacity)

items = [[10,5],[4,8],[9,12],[7,3],[11,7]]
capacity = 10

p meet_in_the_middle(items, capacity)

items = [[11,7],[7,3],[9,12],[4,8],[10,5]]
capacity = 10

p meet_in_the_middle(items, capacity)