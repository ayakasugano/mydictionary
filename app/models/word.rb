class Word < ApplicationRecord
  enum :word_class, [:noun, :verb, :adjective, :adverb]
end
