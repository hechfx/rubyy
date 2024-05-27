require 'discordrb'

bot = Discordrb::Commands::CommandBot.new token: "token", prefix: "!"

bot.command :ping do |event|
    m = event.respond('Pong!')

    m.edit "Pong! Time taken: #{Time.now - event.timestamp} seconds."
end

bot.command :user do |event, *args|
    user = bot.users.values.find { |u| u.id == args.join(' ').to_i }
    event << "usuário: #{user.username}"
    event << "id do usuario: #{user.id}"
    event << "avatar do usuario: #{user.avatar_url}"
    event << "status: #{user.status}"
end

bot.run