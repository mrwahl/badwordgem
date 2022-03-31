# frozen_string_literal: true

require_relative "badwordgem/version"
require 'yaml' #this will need to use the badlist.yml file 
module Badwordgem
  class Error < StandardError; end
  
  class Base
    class << self # assign class to itself so self does not need to be used for every method

      def badlist
        @badlist ||= YAML.load_file(File.expand_path("badlist.yml", __dir__)) # This will load in the bad words from our YML file and it will assign it to the badlist variable
      end

      def sanitize(input = "hello") # method to take in user input to check for profanity
        word = input.downcase # It will change the user input and set it to lowercase to match our bad list of words
        badlist.each do |key, value| # For every word in the badlist assign it a key(a bad word), and a value(then replace the bad work with * symbol)
          word.gsub!(/\b#{key}\b/, value) # For each word the user has inputed replace the old word(key) with the new word(value)
        end
        word # return the word whether it contains profanity or not
      end

    end
  end


end
