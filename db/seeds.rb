# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
users = [
	{ username: "ana.criativa", email: "ana@example.com" },
	{ username: "lucas.design", email: "lucas@example.com" },
	{ username: "bia.casa", email: "bia@example.com" }
]

users.each do |attributes|
	User.find_or_create_by!(username: attributes[:username]) do |user|
		user.email = attributes[:email]
		user.password = "password123"
		user.password_confirmation = "password123"
	end
end

posts = [
	{
		username: "ana.criativa",
		title: "Cores para começar o dia",
		description: "Uma combinação leve de cores, texturas e detalhes para trazer mais energia à rotina."
	},
	{
		username: "lucas.design",
		title: "Referências para um espaço criativo",
		description: "Ideias simples para organizar um ambiente bonito, funcional e cheio de personalidade."
	},
	{
		username: "bia.casa",
		title: "Pequenos detalhes, grandes mudanças",
		description: "Inspirações para transformar cantos da casa usando objetos que já fazem parte da sua história."
	},
	{
		username: "ana.criativa",
		title: "Um fim de tarde tranquilo",
		description: "Luz natural, uma pausa merecida e espaço para guardar novas ideias."
	}
]

posts.each do |attributes|
	user = User.find_by!(username: attributes[:username])
	user.posts.find_or_create_by!(title: attributes[:title]) do |post|
		post.description = attributes[:description]
	end
end

puts "Seeds concluídos: #{User.count} usuários e #{Post.count} posts."
puts "Senha dos usuários de desenvolvimento: password123"
#   end
