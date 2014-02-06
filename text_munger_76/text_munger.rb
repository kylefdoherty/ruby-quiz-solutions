#encoding: UTF-8
=begin
Your task for this quiz, then, is to take a text as input and output 
the text in this fashion. Scramble each word's center (leaving the 
first and last letters of each word intact). Whitespace, punctuation,
numbers -- anything that isn't a word -- should also remain unchanged.
=end 

def word_shifter(w)
	word = w
	middle = word.slice!(1..-2)
	scrambled_middle = scrambler(middle)
	scrambled_word = scrambled_middle.insert(0, word[0])
	scrambled_word = scrambled_word.insert(-1, word[1])
end

def scrambler(letters)
	letters.split('').shuffle.join
end 

def rebuild(arr)
	text = arr.join(",")
	text.gsub(",", " ")
end 







text_file = ""

puts "There are 5 speeches you can choose from to scramble."
speeches = ["Strength and Decency by Theodore Roosevelt", "The Gettysburg Address by Abraham Lincoln", "I Have a Dream by Martin Luther King Jr.", "The Pearl Harbor Address to the Nation by Franklin D. Roosevelt", "Blood, Sweat, and Tears by Winston Churchill"]

num = 1
speeches.each do |speech| 
	puts "#{num} - #{speech}"
	num += 1
end 

puts "Please select a speech by number:"
selection = gets.chomp.to_i
puts "You chose #{selection}.  Scrambling commencing..."

case selection
	when 1
		text_file = "lib/strength_and_decency.txt"
	when 2
		text_file = "lib/gettysburg_address.txt"
	when 3
		text_file = "lib/I_have_a_dream.txt"
	when 4
		text_file = "lib/pearl_harbor_address.txt"
	when 5
		text_file = "lib/blood_sweat_tears.txt"
	else 
		puts "#{selection} isn't a valid selection."
end 



#text = "I desire to see in this country the decent men strong and the strong men decent, and until we get that combination in pretty good shape we are not going to be by any means as successful as we should be."


# File.open(text_file).readlines.each do |line|
# 	text = line
# end 
text = IO.read(text_file)


text.delete(",")
split_text = text.split

split_text.map! do |i|
	if i.length > 3
		word_shifter(i)
	else 
		i
	end
end 


scrambled_text = rebuild(split_text)

puts scrambled_text





#if a word is longer than 3 letters scramble the letters in the middle which are the letters between word[0] & word[-1]
#i could extract the parts of the word, first letter, last letter, and middle.  Then scramble the middle, and reconstruct the word
