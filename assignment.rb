require 'pry'
dictionary_list = []

def convert(input)
	results = []
	dictionary_hash.each do |word, number|
		if input.match(number.gsub("\n", ""))
			results << word
		end
	end
	len3 = []
	len4 = []
	len5 = []
	len6 = []
	len7 = []
	len10 = []
	results.each do |result|
		len3 << result if result.length == 4
		len4 << result if result.length == 5
		len5 << result if result.length == 6
		len6 << result if result.length == 7
		len7 << result if result.length == 8
		len10 << result if result.length == 11
	end
	binding.pry
	p ""
end

File.open("dictionary.txt", "r") do |f|
	f.each do |i|
		dictionary_list << i
	end
end

dictionary_hash = {}
dictionary_list.each do |letter|
	dictionary_hash[letter] = letter.gsub(/(A|B|C)/, "2")
																	.gsub(/(D|E|F)/, "3")
																	.gsub(/(G|H|I)/, "4")
																	.gsub(/(J|K|L)/, "5")
																	.gsub(/(M|N|O)/, "6")
																	.gsub(/(P|Q|R|S)/, "7")
																	.gsub(/(T|U|V)/, "8")										 
																	.gsub(/(W|X|Y|Z)/, "9")
end
dictionary_hash.each do |word, number|
	if word.length < 4 || word.length == 9 || word.length == 10 || word.length > 11 
		dictionary_hash.delete(word)
	end
end
print "Enter the number: "
input = gets.to_s
convert(input)