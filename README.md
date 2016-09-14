# eSportsMatcher
Ruby on Rails web app to match participants in CSM eSports tournaments more fairly and automatically. or will this one create a merge conflict? AHHH MERGES....

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
* Tuesday, September 20: Write an extensive rails style guide to prevent style-induced vomitting 
* Tuesday, September 27: User pages to register and view/edit profiles
* Tuesday, October 4: TBD
* Tuesday, October 11: Admins can create League of Legends tournaments, Users can register for the tournaments
* Tuesday, October 18: TBD
* Tuesday, October 25: Admin can generate teams
* Tuesday, November 1: TBD
* Tuesday, November 8: Admin can generate brackets and control their progression as the tournament progresses
* Tuesday, November 15: TBD
* Tuesday, November 22: TBD
* Tuesday, November 29: Improve UX (User Experience)
* Tuesday, Devember 6: Beta Release Party!

## Dependencies
* Ruby (version 2.2.2 or newer)
* Ruby on Rails (version 5 or newer)
* sqlite3

## Installation Instructions
### For Debian/Ubuntu Systems
* Install ruby version 2.3 `sudo apt-get install ruby2.3 ruby2.3-dev`
* Install sqlite3 `sudo apt-get install sqlite3`
* Install rails `sudo gem install rails`
* Once complete you should be able to successfully run `sqlite3 --version`, `ruby -v`, and `rails --version` and ensure your versions meet the dependency requirements of the previous section.

## Usage Instructions
* Rails comes with the [puma](http://puma.io/) out of the box. Puma is a ruby webserver, and can be started by running `bin/rails server` from the root directory of the rails project.
* With Puma running, running the app should be as simple as opening a browser and navigating to [localhost:3000](http://localhost:3000/)
* If you have never used Ruby on Rails before, there is a great tutorial located [here, and is a great place to start!](http://guides.rubyonrails.org/getting_started.html).

## Contributors
* C. Travis Johnson [cjohnso0@mymail.mines.edu](mailto:cjohnso0@mymail.mines.edu)
* Alan Champion
* Will Kelly
* Kevin Pham [kpham@mymail.mines.edu](mailto:kpham@mymail.mines.edu)
* Yash Sinha

