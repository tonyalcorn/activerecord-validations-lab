class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }

    selection = ["Fiction", "Non-Fiction"]
    validates :category, inclusion: { in: selection }

    # clickbait = ["Won't Beleive", "Secret", "Top [number]", "Guess"]
    validate :non_clickbait

    def non_clickbait
        if title.present? && !title.include?("Won't Believe" || "Secret" || "Top [number]" || "Guess")
            errors.add(:title, "must contain clickbait")
        end
    end


end
