def grader(score)
  case score
    when 0.9..1; "A"
    when 0.8..0.9; "B"
    when 0.7..0.8; "C"
    when 0.6..0.7; "D"
    else "F"
  end
  
  
end

p grader(0.7) # "C"