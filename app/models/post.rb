class Post < ApplicationRecord
	validates :title, presence: true
	validates :content, length: { minimum: 250 }
	validates :summary, length: { maximum: 250 }
	validates :category, inclusion: { in: ['Fiction', 'Non-Fiction']}
	validate :must_be_clickbait

	def must_be_clickbait
		unless title.present? && title.to_s.match?(/Believe|Secret|Top \d|Guess/)
			errors.add(:title, "Title must be sufficiently clickbait-y!")
		end
	end

end
