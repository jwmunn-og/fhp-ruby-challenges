def format_duration(seconds)
  years = seconds % (60*60*24*365)
  days = seconds % (60*60*24)
  hours = seconds % (60*60)
  minutes = seconds % (60)
  
  # if hours > 0
  #   puts "#{hours} hours, #{seconds} seconds" 
  # else
  #   puts "#{seconds} seconds"
  # end
  if seconds >= 60 * 60
    puts "#{seconds / (60*60)} hours, #{(seconds % 60) / 60} minutes, #{minutes} seconds"
  elsif seconds >= 60
    puts "#{seconds / 60} minutes, #{minutes} seconds"
  else
    puts "#{seconds} seconds"
  end
  


end

format_duration(1) # "1 second")
format_duration(62) #, "1 minute and 2 seconds")
format_duration(120) #, "2 minutes")
format_duration(3600) #, "1 hour")
format_duration(3662) #, "1 hour, 1 minute and 2 seconds")