class Ghost
   def color
    %w(white yellow purple red).sample
  end
end

ghost = Ghost.new
ghost.color  #=> "white" or "yellow" or "purple" or "red"