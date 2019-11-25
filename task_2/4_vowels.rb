vowel_arr = %w( a e i o u )
vowel_hash = {}

("a".."z").each.with_index do |letter, index|
  vowel_hash[letter] = index + 1 if vowel_arr.include?(letter)
end 
