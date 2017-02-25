def find_missing_number(sequence)
  arr = sequence.split
  arr.sort!
  
  if arr.length === 0
    puts 0
  else
    arr.each do |arr_item|
      if arr_item != arr_item.to_i
        puts arr_item
      else
        puts arr.inspect
      end
    end

    # arr.each { |x| puts x.class }
  end
  
  
  
end



find_missing_number("1 2 3 5") # 4,"It must work for missing middle terms"
find_missing_number("1 3") # 2,"It must work for missing middle terms"
find_missing_number("") # 0,"It must return 0 for an empty sequence"
find_missing_number("2 3 4 5") # 1,"It must return 1 for a sequence missing the first element"
find_missing_number("2 1 4 3 a") # 1,"It must return 1 for an invalid sequence"