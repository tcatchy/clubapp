clubapp
=======

SWEN30006 Software Modelling and Design final submission

Contributors:
* Josip Karabotic Milovac
* Anton Tkacz

Dependencies:
* Imagemagick
* Ruby on Rails

Easiest to run on an *nix system, since Imagemagick isn't best friends with Windows

Hi, Seems you are testing my project... For the seed migrations to work properly, please go ahead and do these tasks:
1. Unzip pics.zip in the folder it is now
2. Open a terminal window for the current folder and run `sh do`, or if you run a similar shell program replace that with `sh`
3. Alternatively, if you think my shell script may have malicious content, please do the following:
	a) cd clubsapp
	b) bundle install
	c) bundle update
	d) rake db:drop
	e) rake db:create
	f) rake db:migrate
	g) rake db:seed
	h) rails s

Should you have any further issues running the project or seeding it, please contact Anton at atkacza@student.unimelb.edu.au or shoot me a message here.
