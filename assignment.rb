dictionary_list = []
File.open("dictionary.txt", "r") do |f|
	f.each do |i|
		dictionary_list << i
	end
end