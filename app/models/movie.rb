class Movie < ActiveRecord::Base
  attr_accessible :name, :opening_weekend, :percent_of_total, :total_gross
end
