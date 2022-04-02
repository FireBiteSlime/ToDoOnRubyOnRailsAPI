# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

seeds = HashWithIndifferentAccess.new(YAML.load(File.read(Rails.root.join('db', 'seeds.yml'))))

seeds["projects"].each do |seed|
	title = seed["title"]
	project = Project.create(title: title)
	project_id = project["id"]

	seed["todos"].each do |todo|
		text = todo["text"]
		isCompleted = todo["isCompleted"]
		Todo.create(text: text, isCompleted: isCompleted, project_id: project_id)
	end
end