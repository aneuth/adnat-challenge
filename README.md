
## Installation

Clone the project:
```
git clone git@github.com:aneuth/adnat-challenge.git
cd adnat-challenge
```

Run the following command to install the gems:

```
bundle install
```

Run the following command to install all dependencies:

```
yarn install
```

Then create a new data-base:

```
rails db:create db:migrate db:seed
```

Launch the rails server by running: 

```
rails s
```

Open your browser and go to http://localhost:3000

## Tech stack

This project uses the following technologies:

- Ruby, Ruby on Rails
- JavaScript, Stimulus
- HTML, CSS, Bootstrap

Ensure your rails version is at least 7.0 by running the following:

```
rails -v
```

## Challenge requirements summary

Created a simplified version of the Tanda web app where:
- users who sign up for the first time are prompted to join/create an organisation
- once joined, they are able to edit the organisation details or leave 
- users can also view all shifts 

## Challenge optional requirements summary

Added the following optional features:
- Users can change their own name, email address, or password (optional 1)
- Users can modify or delete existing shifts (optional 2)
- Created a way for shifts of a departed employee to be stored. Users can view all prior employees shifts by clicking 'view previous shifts'. If a departed employee     re-joins the organisation, their past shifts can be added back to current shifts (optional 3)
- Users can see which shifts are overnight; if the finish time of a shift is earlier than the start time, the shift is considered overnight (optional 5)
- Users can have have multiple breaks by clicking 'add break' in the shifts table. The sum of all these is taken into account when calculating hours worked and shift     cost (optional 7)
- Added a Stimulus controller to the project for the new shift form (optional 9)
- Wrote unit tests for organisation, shift and break model (optional 10)
- Created a profile page, where users can view their details (optional 12)






