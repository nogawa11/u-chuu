# U-chuu

A fun space-themed marketplace app where users can rent and list fictional planets.

![Screen Shot 2022-03-14 at 5 49 39 PM](https://user-images.githubusercontent.com/94948064/158137115-8be4a19e-5025-42d8-8e4d-87ff1bc8e0c5.png)
 ![Screen Shot 2022-03-14 at 5 49 57 PM](https://user-images.githubusercontent.com/94948064/158137127-e145039a-5830-4b14-88e3-a66972030c8b.png) ![Screen Shot 2022-03-14 at 5 50 14 PM](https://user-images.githubusercontent.com/94948064/158137139-88980240-f7dd-4feb-811d-0f674b51d6ea.png)

<br>
App home: https://u-chuu.herokuapp.com/
   
## Getting Started
### Setup

Install gems
```
bundle install
```
Install JS packages
```
yarn install
```

### ENV Variables
Create `.env` file
```
touch .env
```
Inside `.env`, set these variables. 
```
CLOUDINARY_URL=your_own_cloudinary_url_key
```

### DB Setup
```
rails db:create
rails db:migrate
rails db:seed
```

### Run a server
```
rails s
```

## Built With
- [Rails 6](https://guides.rubyonrails.org/) - Backend / Front-end
- [Stimulus JS](https://stimulus.hotwired.dev/) - Front-end JS
- [Heroku](https://heroku.com/) - Deployment
- [PostgreSQL](https://www.postgresql.org/) - Database
- [Bootstrap](https://getbootstrap.com/) — Styling

## Team Members
- [Nicole Ogawa](https://github.com/nogawa11/)
- [Ayanori Toyoda](https://github.com/AyanorII/)
- [Amane Weston](https://github.com/AmaneWeston/)
- [David Yarhi](https://github.com/policiacaro/)

## Acknowledgements
Inspired by AirBnB.
