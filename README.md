# Personal Emacs Config with Documentation

**Work in Progress**

A while ago I realized that these configs were a mess and could use a clean up.
I also wanted to maintain the same configs between work and home, so I've made
them publicly available here, viewable for other emacs enthusiasts to look at,
question, and critique.

This repository can probably provide as a reference but is not intended to be a
"starter kit" for emacs.  Rather, I'd recommend one of the following:

* [Batzov's Prelude](https://github.com/bbatsov/prelude)
* [Purcell's .emacs.d](https://github.com/purcell/emacs.d)
* [Higginbotham's .emacs.d](https://www.braveclojure.com/basic-emacs/#Installation)
* [Spacemacs](https://github.com/syl20bnr/spacemacs)

Additionally, I've found the following resources excellent guidance in
learning emacs and emacs-lisp:

* [Mastering Emacs](https://www.masteringemacs.org/)
* [Emacs Rocks](http://emacsrocks.com/) highly recommend the ['magit' module](http://emacsrocks.com/e17.html).
* [Emacs is Sexy (Obviously)](http://emacs.sexy/)
* [Magnar's .emacs.d](https://github.com/magnars/.emacs.d)
* ["tuhdo"'s .emacs.d for C/C++](https://tuhdo.github.io/emacs-tutor.html)

### Usability

A few quick notes before jumping in:

* Currently this has only been tested on GNU/Linux and FreeBSD.
* For installation, just clone this repository under `~/.emacs.d/`
* When starting emacs after cloning this repo, packages will install.
   This *will* be slow the first time and could require [proxy settings](https://www.emacswiki.org/emacs/UrlPackage#toc6).

### Documentation

Most of the documentation for how this is layed out and organized can
be found in `init.el`.  Open up the [init file](https://www.gnu.org/software/emacs/manual/html_node/emacs/Init-File.html) as a jumping-off point
to other settings and their documentation.

#### Loading Changes w/out Restart

Instructions for customizing emacs often suggest a restart for changes
to take effect.  Many customizations only require evaluating an elisp
form in place, which is done by placing the point after the closing
parenthesis of an elisp form and typing `C-x C-e` (lisp expressions
are also known as [s-expressions](http://www.gigamonkeys.com/book/syntax-and-semantics.html)).
Below are a few simple examples:

##### Point/Cursor Blinking Mode

Some of the customizations under `settings/ui.el` will require a restart
to take effect because they are intended to change start-up behavior.
There are a few simple forms in here that can be changed on the fly
though, like having the point (e.g. cursor) blink.

To do this open up the `setting/ui.el` file in a buffer, in here lives
the elisp form:

`(blink-cursor-mode 0)`

Simply change the 0 to a 1, then move the point to the right of the
closing parenthesis and type `C-x C-e` (That's `Control`+`x` and
then `Control`+`e`).  The point start blinking right away.

More on evaluating elisp in place:

** [Mastering Emacs: Evaluating Elisp in Emacs](https://www.masteringemacs.org/article/evaluating-elisp-emacs)
** [Introduction to Programming in Emacs Lisp: Evaluation](https://www.gnu.org/software/emacs/manual/html_node/eintr/How-to-Evaluate.html#How-to-Evaluate)

##### Change Window Navigation Settings

By default traversal through [windows](https://www.gnu.org/software/emacs/manual/html_node/emacs/Split-Window.html) is done by typing `C-x o`, which
is a key-binding for the function `other-window`.  Try out the
`other-window` function on it's own by running it in the minibuffer:

1. [`M-:`](https://www.gnu.org/software/emacs/manual/html_node/emacs/Lisp-Eval.html) this usually maps to `Alt-shift-;` on most keyboards.
2. Type in `(other-window)` and press ENTER.

Emacs should move the point to an adjacent window (if there is one).
Furthermore, in the minibuffer a message should flash that this
function has a shortcut key-binding `C-x o`.  More documentation and
a link too the source code for `other-window` can be found with:

1. `C-h f`
2. Type `other-window` and press ENTER.

This explains things better than I have so far but probably also seems
a bit ineffecient for navigation still.  To compliment `other-window`
there is `previous-multiframe-window`.  Under `settings/ux.el` there
is a custom key-binding for this function:

`(global-set-key (kbd "C-x O") 'previous-multiframe-window)`

This allows traversal forwards as well as backwards through windows by
using `C-x` then a lowercase or capital `o` respectively.

For some **Wind Move** is more natural; to use this instead, install
wind move through the package manager, then  paste in the elisp forms
in the [Wind Move Documentation](https://www.emacswiki.org/emacs/WindMove) in place of the key-binding for
`previous-multiframe-window`.  Make these new navigation key-bindings
live with a `C-x C-e` like before or try `M-x eval-buffer` .  Then to
unset `C-x O`:

1. `M-:`
2.  Type `(global-unset-key (kbd "C-x O"))` and hit ENTER.

On reason I don't use **Wind Move** is that it conflicts with [Org Mode](https://orgmode.org/manual/Conflicts.html)

##### Counter Example

One setting that will require a restart to test is `initial-frame-alist`
(obviously, b/c this determines start up behavior). This is also found
under `settings/ui.el`.
