model_names = [
  "Character",
  "TelevisionShow",
  "Actor",
  "Meetup",
  "Task",
  "User",
  "Octopus",
  "Movie",
  "Recipe",
  "Potato",
  "BreakableToy",
  "HelpRequest",
  "Comment",
  "Post",
  "LineItem",
  "Deer",
  "Mouse",
  "Person",
  "Product",
  "FunnyJoke",
  "Publication"
]

model_names.each do |model_name|
  Challenge.find_or_create_by(model_name: model_name, approved: true)
end
