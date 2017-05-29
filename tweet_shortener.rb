# Write your code here.
def dictionary
#"hello" becomes 'hi'
#"to, two, too" become '2'
#"for, four" become '4'
#'be' becomes 'b'
#'you' becomes 'u'
#"at" becomes "@"
#"and" becomes "&"

  dictionary = {
    "hello" => "hi",
    "to" => "2",
    "two" => "2",
    "too" => "2",
    "for" => "4",
    "four" => "4",
    "be" => "b",
    "you" => "u",
    "at" => "@",
    "and" => "&"
  }
end

def word_substituter(tweet)
  array = tweet.split(" ")
  return_array = []
  keys = dictionary.keys
  array.each do |item|
    if keys.include?(item) || keys.include?(item.downcase)
      return_array << dictionary[item.downcase]
    else
      return_array << item
    end
  end
  return return_array.join(" ")
end

def bulk_tweet_shortener(tweet_array)
  tweet_array.each do |array_item|
    puts word_substituter(array_item)
  end
end

def selective_tweet_shortener(tweet)
  if tweet.length > 140
    return word_substituter(tweet)
  else
    return tweet
  end
end

def shortened_tweet_truncator(tweet)
  tweet = selective_tweet_shortener(tweet)
  if tweet.length > 140
    truncated_tweet = tweet[0...139]
    truncated_tweet[137]="."
    truncated_tweet[138]="."
    truncated_tweet[139]="."
    return truncated_tweet
  end
  return tweet
end
