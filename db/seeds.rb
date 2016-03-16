subjects = [
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

subjects.each do |subject|
  Challenge.find_or_create_by(subject: subject, approved: true)
end
