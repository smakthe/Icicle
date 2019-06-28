def all_results(input)										#this is the public method which takes input the 10-digit number and returns all possible words list
	results = []
	$dictionary_hash.each do |word, number|										#checking if the dictionary keys match with the input number
		if input.match(number.gsub("\n", ""))
			results << word 									#storing the words in result
		end
	end
	results 									#returning the result
end
										
def convert(input)										#the convert method takes a string of 10 digits as input and prints all possible words/combination of words
	results = all_results(input)										#calling the all_results method to get the list of all matched words
	len3 = []
	len4 = []
	len5 = []
	len6 = []
	len7 = []
	len10 = []
	results.each do |result|
		len3 << result if result.length == 4										#this is the array of all words having 3 leters
		len4 << result if result.length == 5										#this is the array of all words having 4 leters
		len5 << result if result.length == 6										#this is the array of all words having 5 leters
		len6 << result if result.length == 7										#this is the array of all words having 6 leters
		len7 << result if result.length == 8										#this is the array of all words having 7 leters
		len10 << result if result.length == 11										#this is the array of all words having 10 leters
	end
	len10.each { |word| puts word}										#printing all the 10-letter words
	for i in 0...len5.length
		for j in 0...len5.length
			puts (len5[i] + len5[j]).gsub("\n", ", ")[0..-3]										#printing all the combinations of 5-letter words
		end
	end
	len4.each do |word4|
		len6.each do |word6|
			puts (word4 + word6).gsub("\n", ", ")[0..-3]										#printing all the combinations of 4-letter and 6-letter words
			puts (word6 + word4).gsub("\n", ", ")[0..-3]
		end
	end
	len3.each do |word3|
		len7.each do |word7|
			puts (word3 + word7).gsub("\n", ", ")[0..-3]										#printing all the combinations of 3-letter and 7-letter words
			puts (word7 + word3).gsub("\n", ", ")[0..-3]
		end
	end
	len4.each do |word|
		for i in 0...len3.length
			for j in 0...len3.length
				puts (len3[i] + len3[j] + word).gsub("\n", ", ")[0..-3]										#printing all the combinations of 3-letter and 4-letter words
				puts (len3[i] + word + len3[j]).gsub("\n", ", ")[0..-3]
				puts (word + len3[i] + len3[j]).gsub("\n", ", ")[0..-3]
			end
		end
	end
end

dictionary_list = []										#this is the list of all dictionary words
File.open("dictionary.txt", "r") do |f|										#reading the file
	f.each do |i|
		dictionary_list << i 									#fetching all the words from dictionary
	end
end

$dictionary_hash = {}										#this is the dictionary hash, a key-value pair of dictionary words and their corresponding numerical values after mapping
dictionary_list.each do |letter|										#the mapping logic
	$dictionary_hash[letter] = letter.gsub(/(A|B|C)/, "2")
																	.gsub(/(D|E|F)/, "3")
																	.gsub(/(G|H|I)/, "4")
																	.gsub(/(J|K|L)/, "5")
																	.gsub(/(M|N|O)/, "6")
																	.gsub(/(P|Q|R|S)/, "7")
																	.gsub(/(T|U|V)/, "8")										 
																	.gsub(/(W|X|Y|Z)/, "9")
end
$dictionary_hash.each do |word, number|										#removing useless words having less than 3 or more than 8,9 characters
	if word.length < 4 || word.length == 9 || word.length == 10 || word.length > 11 
		$dictionary_hash.delete(word)
	end
end
while 1
	print "Enter the number: "										#taking input from user
	input = gets.to_s
	if input.match(/(0|1)/)										#checking if the input contains 0 or 1
		puts "Invalid input. Try again"
		next
	else
		convert(input)										#calling the convert method to print the output
	end
end