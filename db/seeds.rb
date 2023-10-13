# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.all.each do |u|
    10.times do |i|
        s = Station.create([
            {
                context: "Contexto da estação #{i + 1}",
                procedure: "Procedimento da estação #{i + 1}",
                evaluation: "Avaliação da estação #{i + 1}",
                time: i + 1,
                difficulty: i % 4 + 1,
                score: 0,
                title: "Estação #{i + 1}",
                feedback: true,
                user: u
            }
        ])

        5.times do |j|
            q = Question.new
            q.statement = "Enunciado da questão #{j + 1}"
            q.kind = j % 3 + 1
            q.score = 10
            q.station = s.first
            q.save
        end
    end
end
