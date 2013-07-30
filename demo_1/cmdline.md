###Getting our bearings

Where are we? `pwd` prints out the **p**resent **w**orking
**d**irectory. When you open your Unix shell you are brought to your
home directory. This will be differnt from computer to computer but
should look something like /Users/[your account name]  or /home/[your
account name]

    $ pwd
    /Users/test_account/



Whats in here? `ls` **l**i<b>s</b>ts the files in the directory. Again, the
output will vary, but on OS X, it should look something like this:

    $ ls
    Applications    Movies  cmdline_talk
    Archive         Music
    Desktop         Pictures
    Documents       Library
    Downloads
    Dropbox
    



###Demo 1
> I have a bunch of files with people’s email addresses in them. I want a list of all the email addresses in one file.

Naviagte to the directory with the contacts. To start, **c**hange
**d**irectories (`cd`) into the cmdline_talk directory and list out the
files.

    $ cd cmdline_talk/
    $ ls
    commandline.ppt demo_1  demo_2  demo_3  sample_files 
    $ cd demo_1
    $ ls
    contacts
    $ cd contacts/
    $ ls
    Bob_Traub.txt   Hikaru_Sulu.txt     Leonard_McCoy.txt   Nyota_Uhura.txt Spock.txt
    Galia_Traub.txt James_T_Kirk.txt    Montgomery_Scott.txt Pavel_Chekov.txt

There are serveral commands to view the contents of the file. `cat` is
one way.

    $ cat Bob_Traub.txt 
    Bob Traub
    bob.traub@gmail.com
    617 555 3422
    @bobtraub

We want to be able to isloate the line with the email address. There is
a commands called `grep` that is good at matching patterns. Lets find
out more about it by looking at the **man**ual page for it

    $ man grep
    NAME
       grep, egrep, fgrep - print lines matching a pattern
    SYNOPSIS
       grep [options] PATTERN [FILE...]
       grep [options] [-e PATTERN | -f FILE] [FILE...]
    ...
    :
Type `q` to **q**uit the man page.

The synopsys lets us know to use the command we type grep, then a
pattern and then the file name. It'll print all lines that contain the
pattern. Since all email addeses have an @ sign, we'll start off by
using that as the pattern.

    $ grep @ Bob_Traub.txt
    bob.traub@gmail.com
    @bobtraub

Twitter handles also have an @ sign. We need a better way of specifying
an email address. We can use a regular expression. Regular Expressions
are a great tool for searching for patterns. Rather than write it out
here, I used google to find a regex that matches an email address. The
pattern is `"\b[a-zA-Z0-9.-]+@[a-zA-Z0-9.-]+\.[a-zA-Z0-9.-]+\b"`

    grep "\b[a-zA-Z0-9.-]+@[a-zA-Z0-9.-]+\.[a-zA-Z0-9.-]+\b" Bob_Traub.txt 
    #returns nothing
Grep has a bunch of options. We want to specify that we are using a
regex.

    $ man grep
    # type /regex to search within the man page
    ...
      -E, --extended-regexp
              Interpret PATTERN as an extended regular expression (see below).
    ...

Again, type `q` to quit. We'll use the `-E` option with the regex.

    $ grep -E "\b[a-zA-Z0-9.-]+@[a-zA-Z0-9.-]+\.[a-zA-Z0-9.-]+\b" Bob_Traub.txt
    bob.traub@gmail.com
Awesome, this prints out what we want, but it only does it for one file.
Often Unix commands allow you list out a whole bunch of files. We'll use
the same command as before, but specify out more files.

    $ grep -E "\b[a-zA-Z0-9.-]+@[a-zA-Z0-9.-]+\.[a-zA-Z0-9.-]+\b" Bob_Traub.txt  Galia_Traub.txt
    Bob_Traub.txt:bob.traub@gmail.com
    Galia_Traub.txt:galiat@gmail.com

If we had a lot of files, it would be cumbersome to type out all the file names. Unix has something called wildcards. The `*` wildcard means everything. Rather than listing out all the files, we can use the `*` to grep thru everything in this directory.

    $ grep -E "\b[a-zA-Z0-9.-]+@[a-zA-Z0-9.-]+\.[a-zA-Z0-9.-]+\b" *
    Bob_Traub.txt:bob.traub@gmail.com
    Galia_Traub.txt:galiat@gmail.com
    Hikaru_Sulu.txt:sulu@startfleet.gov
    James_T_Kirk.txt:kirk@starfleet.gov
    Leonard_McCoy.txt:bones@startfleet.edu
    Montgomery_Scott.txt:scotty@starfleet.gov
    Spock.txt:spock@starfleet.gov

This output it almost what we want, but grep is printing out the file name. Again I'm going to `man grep` and this time I'm going to type `/filename`.  You could also use Google to figure out which options to use. It really comes down to personal preferance. 

       -h, --no-filename
              Suppress the prefixing of filenames on output when multiple files are searched.

`-h` it is. We could do `grep -E -h …` or `grep -Eh …` Its the same thing.

    $ grep -Eh "\b[a-zA-Z0-9.-]+@[a-zA-Z0-9.-]+\.[a-zA-Z0-9.-]+\b" *
    bob.traub@gmail.com
    galiat@gmail.com
    sulu@startfleet.gov
    kirk@starfleet.gov
    bones@startfleet.edu
    scotty@starfleet.gov
    spock@starfleet.gov
Perfect. This is the exact output we want. To move the output into a
file we'll use Unix pipes. Pipes take the output of a command and
redirect it to somewhere else. The `>` pipe puts the text into a file. 

    $ grep -Eh "\b[a-zA-Z0-9.-]+@[a-zA-Z0-9.-]+\.[a-zA-Z0-9.-]+\b" * > emails.txt
    #no output
So far, all the grep commands have printed something out. This time
rather than printing it out, it put it into a file called emails.txt.
Note that if there were already a file named emails.txt, this would
overwrite the contents, so be careful with `>`. An other pipe, `>>`
would append the file.

    $ ls
    Bob_Traub.txt   Hikaru_Sulu.txt     Leonard_McCoy.txt   Nyota_Uhura.txt Spock.txt
    Galia_Traub.txt James_T_Kirk.txt    Montgomery_Scott.txt    Pavel_Chekov.txt    emails.txt
Lets view the contents of the file we just created.

    $ cat emailsls.txt 
    bob.traub@gmail.com
    galiat@gmail.com
    sulu@startfleet.gov
    kirk@starfleet.gov
    bones@startfleet.edu
    scotty@starfleet.gov
    spock@startrfleet.gov
Done! To see the commands we executed, we can use the `history` command
and pipe it into a file to save it.

    history
    history > history.txt
