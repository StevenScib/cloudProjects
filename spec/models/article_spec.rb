require 'rails_helper'

RSpec.describe Article, type: :model do
it "is not valid without a title" do
        article = Article.new(title: "", body: "He disappeared", published: false)
        expect(article).not_to be_valid
      end

it "is valid with valid attributes" do
        article = Article.new(title: "Superman of Havan", body: "He disappeared", published: false)
        expect(article).to be_valid
      end

  it "is not valid without a body" do
    article = Article.new(title: "Superman of Havana", body: "")
    expect(article).not_to be_valid
  end

    it "defaults published to false if not provided" do
      article = Article.new(title: "Superman of Havana", body: "He disappeared")
      expect(article.published).to eq(false)
    end
end

