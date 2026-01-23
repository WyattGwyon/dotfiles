This is a repo of configuration files to facilitate my configurations for vim, neovim, bash, etc.

Some points:
gitconfig may need to have different emails based on location.
I see my Campus 42 email has asserted its presence and I dont want that on my home/personal device.

I had previously whittled out a vim config that I like little by little in the duration of a number of projects.
However, now I am branching out to neovim and those configs have not persisted. 
Need to work those configs out again and they are slightly different (great...another variation of the same things I've already worked out).
There apparently is a global register(?) that lua references and vim doesnt seem to be on the list so the linter is flagging warnings.
the 'vim' keyword seems to be functioning despite that but it is annoying. maybe not neccessary to even worry over it since it works.


-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=4 sts=4 sw=4 et
The above lines are how tabstop, shiftwidth, softtabstop and expandtab are defined
I dont understand lua's use of commented lines
In my understanding a double dash(--) is commenting out lines so they dont run but these lines run and affect the behavior as intended (???)

I found the location of these lines with the command
:verbose set tabstop?
This might be a good line to remember for locating other vim settings
