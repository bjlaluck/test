# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.create(name: "Allied Alfa", description: "Best Racing Bike - This American-made masterpiece evokes the handling and feel of an old-school steel racer in a carbon frame with the weight, stiffness, and performance of a fully modern machine. ", image_url: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/allied-alfa-1523988058.jpg" , colour: "Blue" , price: "7920.22")

Product.create(name: "Kona Sutra
", description: "Best Touring Bike - If you are planning a long distance tour on a bicycle, and have the budget to buy a really good one, then the Kona Sutra should definitely be a front runner. Has hearstapps, integrated mud guards and a rear pannier rack, the touring-focused tiers and saddle.", image_url: "https://i0.wp.com/tomsbiketrip.com/wp-content/uploads/2017/01/kona-sutra-2018.jpg" , colour: "Navy" , price: "1861.95")

Product.create(name: "Budnitz No. 3", description: "Best Commuter Bike - The Budnitz No. 3 is a commuter bike that has a mean streak and likes to be ridden fast. The steel (or titanium) frame has a semi-racy geometry and accommodates 29-inch wheels which allow you to run tires up to 2.35-inches wide.", image_url: "https://budnitzbicycles.com/media/bike_images/2223/large_budnitz-bicycles_No.3.3_Ti_Hero.jpg" , colour: "Gray" , price: "4450.45")

Product.create(name: "Evil Following MB", description: "Best All-Terrain Bike - Unbelievable control and freakish speed breeding meet epic efficiency and practical versatility.  Benchmark-resetting short-travel control and speed; efficient and agile enough for XC singletrack hustling; carbon-rich kit collection.", image_url: "https://www.outsideonline.com/sites/default/files/styles/img_850-width_flex-height/public/2018/05/13/evil-the-following-mb-goty_h.jpg" , colour: "Dark Gray" , price: "7399.76")

Order.create(user_id: 1, product_id: 1, total: 10.0)
Order.create(user_id: 1, product_id: 2, total: 5.0)
