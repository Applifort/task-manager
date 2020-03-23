admin = Admin.find_or_initialize_by(first_name: 'admin', last_name: 'admin', email: 'admin@ru.ru')
admin.password = 'admin'
admin.save

30.times do |i|
  m = Manager.find_or_initialize_by(email: "manager#{i}email@mail.gen")
  m.first_name = "FN#{i}"
  m.last_name = "LN#{i}"
  m.password = "#{i}"
  m.save

  u = User.find_or_initialize_by(email: "user#{i}email@mail.gen")
  u.first_name = "FN#{i}"
  u.last_name = "LN#{i}"
  u.password = "#{i}"
  u.save
end

Task.create(author: admin, name: "test", description: "TEST TEST", state: "new_task")

