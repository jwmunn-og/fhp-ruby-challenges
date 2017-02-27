class Ghost
  def assign_color
    colors = %w[white yellow purple red]
    color = colors.shuffle.shift
  end

  def color
    p self.assign_color.to_s
  end
  
end

ghost = Ghost.new
ghost.color  #=> "white" or "yellow" or "purple" or "red"