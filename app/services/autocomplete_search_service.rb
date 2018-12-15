class AutocompleteSearchService
  include HTTParty
  base_uri "https://api.github.com/"

  def initialize(term)
    @term = term
  end

  def call
    { users: users, skills: skills }
  end

  private

  def users
    response = self.class.get("/search/users", query: { q: @term })
    response["items"].map { |u| u["login"] }.take(5)
  end

  def skills
    Skill.find_by_name(@term).map(&:name).take(5)
  end
end
