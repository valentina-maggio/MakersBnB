Space.create(user_id: 1, name: 'Makers', description: 'Big warehouse', price: 10000, picture: '', available_from: Time.now, available_to: Time.now)
Space.create(user_id: 3, name: 'Buckingham Palace', description: 'Queens House', price: 898979, picture: '', available_from: Time.now, available_to: Time.now)
Space.create(user_id: 2, name: 'The Shard', description: 'Pointy', price: 14440, picture: '', available_from: Time.now, available_to: Time.now)
Space.create(user_id: 5, name: 'Big Ben', description: 'BONG', price: 100400, picture: '', available_from: Time.now, available_to: Time.now)

Status.create(status_value: 'confirmed')

User.create(first_name: 'Rob', last_name: 'Makers', email: 'r@r.com', password_digest: 'r')
User.create(first_name: 'Joe', last_name: 'Makers', email: 'j@j.com', password_digest: 'j')
User.create(first_name: 'Phil', last_name: 'Makers', email: 'p@p.com', password_digest: 'p')
User.create(first_name: 'Felix', last_name: 'Makers', email: 'f@f.com', password_digest: 'f')
User.create(first_name: 'Valentina', last_name: 'Makers', email: 'v@v.com', password_digest: 'v')


Booking.create(space_id: 1 ,user_id: 1,date: Time.new(2022, 5, 2, 12) ,status_id: 1)
Booking.create(space_id: 2 ,user_id: 3,date: Time.new(2022, 5, 7, 12) ,status_id: 1)
Booking.create(space_id: 3 ,user_id: 2,date: Time.new(2022, 8, 2, 12) ,status_id: 1)
Booking.create(space_id: 4 ,user_id: 5,date: Time.new(2022, 3, 2, 12) ,status_id: 1)
