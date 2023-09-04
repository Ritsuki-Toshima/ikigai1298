Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.
Project description goes here

This app was created as part of a final project for the Le Wagon Tokyo Web Development Bootcamp. The project is a health status tracking app that allows caregivers to track the health status of their elderly loved ones.  Caregivers can add medicines and appointments for their elderly relatives. This will then notify the elderly relative by SMS that they have a new medicine/appointment. Elderly users can submit their health status report and vital statistics, which will notify the caregiver by SMS that this has been completed. The elderly user can view their appointment location on a map and has their vital statistics computed into a weekly chart - which can also be viewed by a caregiver. 

_DROP SCREENSHOT HERE_
<br>
App home: https://www.ikigai.bond
   

## Getting Started
### Setup

Install gems
```
bundle install
```

### ENV Variables
Create `.env` file
```
touch .env
```
Inside `.env`, set these variables. For any APIs, see group Slack channel.
```
CLOUDINARY_URL=your_own_cloudinary_url_key
MAPBOX_API_KEY=your_own_mapbox_api_key
TWILIO_NUMBER=your_twilio_number
TWILIO_ACCOUNT_SID=your_own_twilio_account_sid
TWILIO_AUTH_TOKEN=your_own_twilio_auth_token
GOOGLE_API_KEY=your_own_google_api_key
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
- [Rails 7](https://guides.rubyonrails.org/) - Backend / Front-end
- [Stimulus JS](https://stimulus.hotwired.dev/) - Front-end JS
- [Heroku](https://heroku.com/) - Deployment
- [PostgreSQL](https://www.postgresql.org/) - Database
- [Bootstrap](https://getbootstrap.com/) — Styling
- [Figma](https://www.figma.com) — Prototyping

## Acknowledgements
The Le Wagon Tokyo Teaching Staff

## Team Members
- [Gary Topping](www.linkedin.com/in/gary-topping)
- [Alvin (Ken) Yau]()
- [James Lau]()
- [Ritsuki Toshima]()

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
