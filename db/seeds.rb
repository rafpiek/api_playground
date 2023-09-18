p "Create sample user"

user = User.find_or_initialize_by(
  email: "email@email.com",
)

user.password = "passwordpassword"
user.save!

p "User #{user.email} created."
