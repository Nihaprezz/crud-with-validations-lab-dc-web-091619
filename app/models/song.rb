class Song < ApplicationRecord
    validates :title, presence: true
    validates :released, inclusion: { in:[true,false] }
    validates :artist_name, presence: true
    validates :release_year, presence: true,
        unless: Proc.new {|attr|attr[:released]== false },
        uniqueness: true,
        numericality: {less_than_or_equal_to: Date.today.year}
end
