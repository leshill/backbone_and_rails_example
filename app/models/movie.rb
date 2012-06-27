class Movie < ActiveRecord::Base
  attr_accessible :name, :opening_weekend, :percent_of_total, :total_gross

  before_save :calculate_percent

  private

  def calculate_percent
    self.percent_of_total = (opening_weekend / total_gross) * 100
  end
end
