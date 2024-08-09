def create_site_admin
  1.times do |a|
    User.create(email: "super_admin@ex.com",
                password: 'asdfasdf',
                password_confirmation: 'asdfasdf',
                first_name: "Site",
                last_name: "Admin", 
                roles: [:super_admin])
  end

  puts "1 site admin created"
end

def create_admin
  
  1.times do |a|
    User.create(email: "editor@ex.com",
                password: 'asdfasdf',
                password_confirmation: 'asdfasdf',
                first_name: "Admin",
                last_name: "User", 
                roles: [:editor])
  end

  puts "1 admin created"  

  # user = User.find(2)
  # user.add_role :admin

  puts "Added admin role to first user"
end

def create_users
  5.times do |u|
    User.create(email: "user#{u+1}@ex.com",
                password: 'asdfasdf',
                password_confirmation: 'asdfasdf',
                first_name: "User#{u+1}",
                last_name: "User")
  end

  puts "#{User.count} users created"
end

create_site_admin
create_admin
create_users

Category.create!(title: "Ruby on Rails")
Category.create!(title: "Development")
Category.create!(title: "Amber")
Category.create!(title: "JavaScript")

puts "#{Category.count} categories created"

100.times do |i|
  Article.create!(
    title: "Article #{i}",
    content: "Maecenas faucibus mollis interdum. Donec id elit non mi porta gravida at eget metus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec id elit non mi porta gravida at eget metus. Curabitur blandit tempus porttitor. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Donec ullamcorper nulla non metus auctor fringilla. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sed odio dui. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Nulla vitae elit libero, a pharetra augue.",
    category: Category.all.sample,
    user: User.all.sample
  )
end

puts "#{Article.count} articles created"