# eSportsMatcher
Ruby on Rails web app to match participants in CSM eSports tournaments more fairly and automatically.

A deployment of this application is hosted by Heroku at [https://e-sports-matcher.herokuapp.com/](https://e-sports-matcher.herokuapp.com/); although, there are *some* plans to build a server at Mines on which to host the app in the future.

## Dependencies
* Ruby (version 2.2.2 or newer)
* Ruby on Rails (version 5 or newer)
* sqlite3 (Heroku, the deployment environment uses postgres)
* An API key from Riot Games

### Dependency Installation For Debian/Ubuntu Systems
* Install ruby version 2.3 `sudo apt-get install ruby2.3 ruby2.3-dev`
* Install sqlite3 `sudo apt-get install sqlite3`
* Install rails `sudo gem install rails`
* Once complete you should be able to successfully run `sqlite3 --version`, `ruby -v`, and `rails --version` and ensure your versions meet the dependency requirements of the previous section.

### Get an API Key and Setup your Environment Variables
* Get an API key from Riot Games [here](https://developer.riotgames.com), you will need to register for a League of Legends account first.
* In the eSportsMatcher/ directory, run `echo 'riot_api_key: "<YOUR_KEY>"' > config/env.development.yml` (where <YOUR_KEY> is ... your key)
* You can verify by running `echo "ENV['riot_api_key']" | rails c` and seeing that your api key is output

## Installation Instructions
* Clone the repo: `git clone https://github.com/ColoradoSchoolOfMines/eSportsMatcher.git`
* cd into the repo's directory `cd eSportsMatcher`
* Install gem dependencies `bundle install`

## Usage Instructions
* Rails comes with the [puma](http://puma.io/) out of the box. Puma is a ruby webserver, and can be started by running `bin/rails server` from the root directory of the rails project.
* With Puma running, running the app should be as simple as opening a browser and navigating to [localhost:3000](http://localhost:3000/)

### Getting Started Learning Rails
* If you have never used Ruby on Rails before, there is a great crash course located [here, and is a great place to start!](http://guides.rubyonrails.org/getting_started.html).
* If you are less familiar with software/web development in general, [this tutorial](https://www.railstutorial.org/book/beginning) gives a deeper backgroundand has more links to fill in knowledge gaps you may have. Actually, this tutorial covers great concepts like Test Driven Development and git workflows!

## Contributors
* C. Travis Johnson [cjohnso0@mymail.mines.edu](mailto:cjohnso0@mymail.mines.edu)
* Alan Champion [achampio@mymail.mines.edu](mailto:achampio@mymail.mines.edu)
* Will Kelly [wikelly@mymail.mines.edu](mailto:wikelly@mymail.mines.edu)
* Kevin Pham [kpham@mymail.mines.edu](mailto:kpham@mymail.mines.edu)
* Yash Sinha [ysinha@mymail.mines.edu](mailto:ysinha@mymail.mines.edu)

## Goals (User Stories)
1. Users can create and edit their own profiles.
2. Users can register for individual tournaments.
3. Admins should be able to automatically generate teams from registered users for a tournament
4. Admins should be able to create brackets that show in what order teams will play each other.
5. Admins can input the results of tournamnets to help improve the matching system for the next tournament.
6. For now, League of Legends team matching is the most important ... but creating a system that extends nicely to other games should be kept in mind.
7. Users should be able to view other users profiles/play histories.

## Project Schedule
* Tuesday, September 13: As a group, gain a basic understanding of web development using Ruby on Rails
* Tuesday, September 20: Intro to git, REST, MVC; trying to convince Yash not to use Windows for development
* Tuesday, September 27: User pages to register and view/edit profiles
* Tuesday, October 4: Solidify the relationship of the User and Summoner so their interactions aren't a mess
* Tuesday, October 11: Work on understanding ruby paradigms
* Tuesday, October 18: Admins can create League of Legends tournaments, Users can register for the tournaments
* Tuesday, October 25: Admin can generate teams
* Tuesday, November 1: TBD
* Tuesday, November 8: Admin can generate brackets and control their progression as the tournament progresses
* Tuesday, November 15: TBD
* Tuesday, November 22: TBD
* Tuesday, November 29: Improve UX (User Experience)
* Tuesday, Devember 6: Alpha Release Party!

## Releases
* v0.0.1 - more or less the same user registration, authentication, and authorization as the [railstutorial](https://www.railstutorial.org/book/beginning) up through chapter 12
