require 'set'
def check (stringOfWords, arrayOfWords)
    wordArray = stringOfWords.split(' ')
    exists = Set.new
    wordArray.each do |word|
        if arrayOfWords.include? word
            exists.add word
        end
    end
    exists.each do |word|
    	puts word
    end
    return exists
end

check("aa bb cccc", ["aa", "bbb", "cc", "dd", "ee"])
check("aa bb cccc aa", ["aa", "bbb", "cc", "dd", "ee"])