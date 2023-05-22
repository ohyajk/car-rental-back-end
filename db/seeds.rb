#Users
admin = User.create(name: "Eddy")
#cars

# Creating a Car instances
car1 = Car.create(name: "Ford", model: "M5", description: "A luxury sedan with impressive performance.", price: 250.5, rent_per_day: 3, user_id: admin.id)
image1 = Image.create(url: "https://images.cars.com/cldstatic/wp-content/uploads/ford-f-150_lightning-lariat-exterior-front-angle-oem-scaled.jpg", car: car1)

# Creating another Car instance
car2 = Car.create(name: "Tesla", model: "Model 3", description: "An electric car with cutting-edge technology.", price: 300.9, rent_per_day: 4, user_id: admin.id)
image2 = Image.create(url: "https://images.cars.com/cldstatic/wp-content/uploads/3185-GENESISREVEALS2023G90U.S.PRICING.jpg", car: car2)

car3 = Car.create(name: "Ford", model: "Mustang", description: "A classic American muscle car.", price: 180.0, rent_per_day: 2, user_id: admin.id)
image3 = Image.create(url: "https://image.cnbcfm.com/api/v1/image/107238183-1683642530891-All-New_Ford_Ranger_Raptor_12.jpg?v=1684584001&w=1600&h=900", car: car3)

# Car 4
car4 = Car.create(name: "Hummer", model: "A4", description: "A stylish and sophisticated sedan.", price: 220.5, rent_per_day: 3, user_id: admin.id)
image4 = Image.create(url: "https://cars.usnews.com/static/images/Auto/izmo/312970/2010_hummer_h3_suv_angularfront.jpg", car: car4)

# Car 5
car5 = Car.create(name: "Mercedes-Benz", model: "G Class", description: "A luxurious and versatile SUV.", price: 280.0, rent_per_day: 4, user_id: admin.id)
image5 = Image.create(url: "https://www.mbusa.com/content/dam/mb-nafta/us/myco/my23/g/class-page/series/2023-G-SUV-HERO-DR.jpg", car: car5)

# Car 6
car6 = Car.create(name: "Honda", model: "Civic", description: "A reliable and fuel-efficient compact car.", price: 150.0, rent_per_day: 2, user_id: admin.id)
image6 = Image.create(url: "https://imgd-ct.aeplcdn.com/1056x660/n/cw/ec/27074/civic-exterior-front-view.jpeg?q=75", car: car6)

# Car 7
car7 = Car.create(name: "Jeep", model: "Wrangler", description: "An iconic off-road SUV.", price: 300.0, rent_per_day: 5, user_id: admin.id)
image7 = Image.create(url: "https://www.jeep.com/content/dam/fca-brands/na/jeep/en_us/bhp/lineup/drive_forward/Jeep-Vehicle-Lineup-2023-Grand-Cherokee-L.jpg.image.500.jpg", car: car7)


# Reservations

reservation1 = Reservation.create(
    city: 'Kigali',
    price_per_day: 20.0,
    car_id: car1.id,
    user_id: admin.id,
    start_date: '02-04-2023',
    end_date: '04-04-2023'
  )

  # Reservation 2
reservation2 = Reservation.create(
    city: 'New York',
    price_per_day: 30.5,
    car_id: car2.id,
    user_id: admin.id,
    start_date: '2023-05-10',
    end_date: '2023-05-15'
  )
  
  # Reservation 3
  reservation3 = Reservation.create(
    city: 'Paris',
    price_per_day: 25.75,
    car_id: car3.id,
    user_id: admin.id,
    start_date: '2023-06-01',
    end_date: '2023-06-05'
  )
  
  # Reservation 4
  reservation4 = Reservation.create(
    city: 'London',
    price_per_day: 40.0,
    car_id: car4.id,
    user_id: admin.id,
    start_date: '2023-07-15',
    end_date: '2023-07-25'
  )
