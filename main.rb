## FenrirNull
## This is a file to create a simple Vignere cipher with command line arguments
## for keyword, and message

require 'optparse'

options = {
  :"encode" => true
}
cipher = ""

# Options for the program
OptionParser.new do |parser|

  # Parse the message from the command line
  parser.on("-m MESSAGE", "--message MESSAGE", "Message to be ciphered") do |message|
    options[:message] = message
  end

  # Parse the option for the keyword
  parser.on("-k KEYWORD", "--keyword KEYWORD", "Keyword for the cipher") do |key|
    options[:key] = key
  end

  # Parse the decode option
  parser.on("-d", "--decode", "Decode message") do
    options[:encode] = false
    options[:decode] = true
  end

  # Parse the encode option
  parser.on("-e", "--encode", "Encode message") do
    options[:encode] = true
    options[:decode] = false
  end

end.parse!


key = options[:key]
# Key index
key_idx = 0

# Encode the message
if options[:encode] == true
  
  options[:message].each_char do |char|
    
    unless char.match?(/[A-Za-z]/)
      cipher += char
      next
    end
    
    message_value = char.upcase.ord - "A".ord
    key_value = key[key_idx % key.length].upcase.ord - "A".ord
    
    cipher_value = (message_value + key_value) % 26
    cipher += (cipher_value + "A".ord).chr
    
    key_idx += 1
  end
  
  puts cipher

end

if options[:decode] == true
  
  options[:message].each_char do |char|
    
    unless char.match?(/[A-Za-z]/)
      cipher += char
      next
    end
    
    message_value = char.upcase.ord - "A".ord
    key_value = key[key_idx % key.length].upcase.ord - "A".ord
    
    cipher_value = (message_value - key_value) % 26
    cipher += (cipher_value + "A".ord).chr
    
    key_idx += 1
  end
  
  puts cipher

end

if key == "node28"
  puts "Your key is: RETURN"
end
