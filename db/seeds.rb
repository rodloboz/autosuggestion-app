puts "Cleaning up database..."
Skill.destroy_all

puts "Creating skills..."
skills = [ "ruby", "ruby on rails", "javascript", "react",
  "vue", "python", "c", "clojure", "objective-c", "c++",
  "c#", "node.js", "php", "nim", "julia", "lisp", "pascal",
  "java", "kotlin", "html", "css", "laravel", "go", "r",
  "typescript", "lua", "coffeescript", "elixir", "phoenix",
  "rust", "elm", "perl", "cobol", "dart", "sql", "erlang",
  "fortran", "sass", "slim", "matlab", "solidity", "reasonml",
  "unity", "visual basic", "web assembly", "angular",
  "backbone", "ember", "expressjs", "knockoutjs", "meteor",
  "django", "haskell", "scala", "swift", "crystal",
  "kepler", "play", "lift", "drupal", "symfony", "sinatra" ]
skills.each { |s| Skill.create!(name: s) }
puts "Created #{Skill.count} skills!"
