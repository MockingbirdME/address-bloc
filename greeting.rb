def greeting
  (1..(ARGV.size-1)).each{|x| p ARGV[0] +" #{ARGV[x]}"}
end

greeting
