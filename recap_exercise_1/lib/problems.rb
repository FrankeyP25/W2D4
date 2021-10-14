# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]

# require "byebug"
def all_vowel_pairs(words)
  pairs = []
  # debugger
  (0...words.length).each do |i|
    (i...words.length).each do |j|
      if i < j
        # debugger
        conc = words[i] + " " + words[j]
        if all(conc)
            # debugger
        #   p all(conc)
        
        #  p "----------------"
        end
      end
    end
  end
  pairs
end

def all(word)
  vowels = "aeiou"
  hash = Hash.new(0)
  
  word.each_char { |char| hash[char] += 1 if vowels.include?(char) }
  hash.keys.length

end

p all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])

# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
  (2...num).each do |n|
    return true if num % n == 0
  end
  false
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
  hash = Hash.new(0)

  # (0...str.length - 1).each do |i|
  #    current = str[i]
  #    nexxt = str[i + 1]
  #    pairs = current + nexxt
     
  #    if bigrams.include?(pairs)
  #      hash[pairs] = true
  #    end
  # end
  bigrams.each { |el| hash[el] = 1 if str.include?(el) }

  hash.keys
end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
       hash = {}

       prc ||= Proc.new { |k,v| k == v }

       self.each do |k, v|
        
         if prc.call(k, v)
            hash[k] = v
         end
       end

       hash
    end
end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)
       arr = []
      if length != nil

        (0..self.length - length).each do |i|
          arr << self[i...i + length]
        end
      else 
        (1..self.length).each do |i|
           arr << substrings(i)
        end
      end
      
       arr.flatten
    end


    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
      alphabet = ("a".."z").to_a
      new_idx = []
      
      self.each_char do |char|     
          new_idx << (alphabet.index(char)+num) % 26  
      end

      new_idx = new_idx.map do |n|
        alphabet[n]
      end
     new_idx.join("")
    end
end
