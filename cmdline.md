* Intro
	* Personal
	* Agenda
	* the goal
		* I want you to understand why the unix command line is useful to
		  you as a developer.
        * there are a lot of ways to solve problems. The Unix command
          line is one of them. I interact with it everyway for my job. You probably will too.
		* I want you to walk away from this not being afird of the unix command line. 
        * unfamilar / different
        * not intuative
        * a little neckbeardy
		* I want you to want to learn more about unix and the command line.
        * We only have 30 minutes here. I'm showing you a fraction of a
          fraction of  a percent of what you do with the unix command line. I hope you will investigate it further
* Primer
	* What is UNIX?
    * An operating system (windows, mac & linux are unix based)
		* Doesn't windows have a command line?
			* Yes, Its kind of similar. 
			* I will focus on Unix command line. Its the most prevalent os on 
			  production server which means that it is a prevalent developer environment.
      * unlike windows, it is well designed to give you, the developer a lot of power
	* Unix Philosophy
		* "Write programs that do one thing and do it well. Write programs to work together. Write programs to handle text streams, because that is a universal interface." ~Doug McIlroy, then head of the Bell Labs
		* small prgrams, work in an eco system, via text
			* kinda like legos.. each different brick plugs into the next
	*What is the command line?
		* the command lines wrap around unix allowing to to interact with your system
			* the same way you gui is a wrapper around your operating system.
			  You interact with mouse clicks, and images and sounds
		* The command line:
			* interact via text
			* runs programs
			* keeps track of state 
			* it takes in text as input and prints out text as output
		* this might seem similar to the python consose REPL.. because it is.
* Demo
	* create a mailing list (pwd, cd, ls, cat, grep  and >)
      pwd
      cd contacts
      ls
      cat Bob_Breznak.txt
      man grep
      grep "@" will return all lines of text with the @ sign
      grep "@" *
      cat *
      grep with a regular expression.
      man grep /regular
      -E mean interprest what we have in quotes is a regular express
      google regular expression email grep
      grep -E "\b[a-zA-Z0-9.-]+@[a-zA-Z0-9.-]+\.[a-zA-Z0-9.-]+\b" *
      man /filename
      grep -Eh "\b[a-zA-Z0-9.-]+@[a-zA-Z0-9.-]+\.[a-zA-Z0-9.-]+\b" *
      Talk about pipes  
      grep -Eh "\b[a-zA-Z0-9.-]+@[a-zA-Z0-9.-]+\.[a-zA-Z0-9.-]+\b" * > emails.txt
      ls
      cat emails.txt
      history
      history > contacts_demo.txt
	* sorting cards (pwd, cd, ls, )
		* all spades, hearts, diamonds and clubs into a directory
      ls *spades*
      mkdir only_spades
      ls *spades*
      man mv
      mv *spades* only_spades
      cd only_spades
      ls 
      pwd
      cd ..
      ls (note spades are gone)
      repeat a bunch
      ls -R
      history > cards_demo.txt
	* create bash script
      vi sort.sh
        keyword = $1
        echo Sorting by $keyword
      sh sort.sh
      ls -l sort.sh
        three sets of premissions for each file. user, group and others
        each user can do 3 things, read write and execute.
      chmod sort.sh u+x
      ls -l sort.sh
      vi sort.sh
        mkdir only_$keyword
      sh sort.sh flowers
      ls
      pwd  ...thats not where we want it
      cd cards
      vi sort.sh
        mv *$keyword* only_$keyword/
    improvments... 
        pass in the file
        add to path
      
* Where to next?
	* Google is your friend
	* man
	* help (-h / --help)
	* history
* Q & A
