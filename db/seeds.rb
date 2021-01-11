Comment.delete_all
User.delete_all
Post.delete_all

DATA_POSTS = [
  {
    'A dead man, surely, no longer requires that water.' => ['You do not beg the sun for mercy.', 'Arrakeenn', 'Leto Atreides'],
    'He who controls the spice, controls the universe!' => [ 'May thy knife chip and shatter.', 'Duke!', 'Caladan' ]
  }
]

USERS = [
 { email: 'nemov@mail.com', password: 'secretus' },
 { email: 'max@mail.com', password: 'secretus' },
 { email: 'dim@mail.com', password: 'secretus' }
]

USERS.each do |user|
 User.create!(user)
end

User.first.update(admin: true)

DATA_POSTS.first.each do |post, comments|
 random_user_id = User.offset(rand(User.count)).first.id
 new_post = Post.create!(title: post.truncate(20, separator: ' '), content: post, user_id: random_user_id)
 comments.each do |comment|
   random_id = User.offset(rand(User.count)).first.id
   Comment.create!(body: comment, post_id: new_post.id, user_id: random_id)
 end
end
 
FAKE_USER_DATA = 9.times { User.create( email: Faker::Internet.unique.email, password: 'secretus') }
FAKE_POST_DATA = 80.times do
  random_user_id = User.offset(rand(User.count)).first.id
  new_post = Post.create!(title: Faker::Movies::HarryPotter.spell, content: Faker::Movies::HarryPotter.quote, user_id: random_user_id)
end

FAKE_Comment_DATA = 40.times do
  random_user_id = User.offset(rand(User.count)).first.id
  random_post_id = Post.offset(rand(Post.count)).first.id
  Comment.create!(body: Faker::Movies::HarryPotter.location, post_id: random_post_id, user_id: random_user_id)
end

p "Created #{User.count} users."
p "Create #{User.where(admin: true).count} Admin user (email: #{User.find_by_admin(true).email})"
p "Created #{Post.count} posts."
p "Created #{Comment.count} comments."


# <div>
#   <% if @post.content.length > 32 %>
#     <%= truncate(@post.content, length: 32) %>
#     <%= link_to '...Read more', '', class: "read-more-#{@post.id}" %>
#     <script>
#       $('.read-more-<%= @post.id %>').on('click', function(e) {
#         e.preventDefault()
#         $(this).parent().html('<%= escape_javascript @post.content %>')
#       })
#     </script>
#   <% else %>
#     <%= @post.content %>
#   <% end %>
# </div>
# <#%= simple_format truncate((h(feed.description) + link_to("Read More", feed_path(feed))), length: 400, separator: ' ') %>

# 'And they found that many people were sleeping better.'.truncate(25, omission: '... (continued)')
# => "And they f... (continued)"

     # creators = Post.all.map(&:user_id)
     # all_users = User.all.map(&:id)
     # delta_id = all_users - creators
     # random_id = User.where(id: delta_id.sample) || random_user_id
