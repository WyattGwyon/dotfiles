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


VIM RECORD
##############################################################
then press 10@a to repeat those keystrokes 10 times
a is the name of a register that the keystrokes are recorded to 
you can have other names 
qb will record to a regisiter named b
then 10@b will repeat that register 10 times
#############################################################


TMUX
############################################################
prefix = ctrl b (default)

we can reconfig the prefix with a tmux config file
unbind C-b
set -g prefix ;
bind ; send-prefix

tmux 
    starts a session
tmux new -s <name>
tmux detach -t <name>
tmux attach -t <name>
tmux neww -n <name>
    creates a new window inside a session
prefix c 
    creates a new window inside a session
prefix n (next window)
prefix p (prev window)

ctrl d
    exit signal to close a terminal session

prefix <N> 
    N is the number of the window to swtich to but only single digits

prefix ' <N> <Return>
    the ' allows you to enter more than one digit like 11 or 345
    this is not realistic 

prefix w
    this is magic menu of all sessions and windows
    you can naviagte the list with vim motions
    press enter to slect one to focus on

prefix % 
    horizontal split (I don not like it because i cannot navigate the panes with vim motions is seems)
prefix "
    vertical pane split (no thanks for the same reason)

prefix q 
    shows the numbers of the panes

prefix q <N> 
    can navigate to a specfic pane number
############################################################
