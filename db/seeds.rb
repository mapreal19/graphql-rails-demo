User.destroy_all
Movie.destroy_all

user = User.create(name: "Mario")

Movie.create(
  title: 'Deadly Weapon',
  description: '2 retired monks walk into a bar',
  user: user
)

Movie.create(
  title: 'Deadly Weapon 2 — This time time it’s personal',
  description: 'Like Deadly Weapon, only deadlier and more personal',
  user: user
)
