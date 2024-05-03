class Article < ApplicationRecord
    validates :title, presence: true
    validates :body, presence: true
    validates :published, inclusion: { in: [true, false] }
  
    after_initialize :set_defaults
  
    private
  
    def set_defaults
      self.published ||= false
    end
  end
  