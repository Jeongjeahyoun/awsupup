# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Post.create(:title =>"안녕하세요", content:"첫글입니다")

new_posts = Post.new
new_posts.title ="글씨체가 너무 작다"
new_posts.content ="그렇죠?!"
new_posts.save