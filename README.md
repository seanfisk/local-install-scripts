# Local Install Scripts

This repository provides scripts for installing various software within a standard user account on UNIX-like machines. It was built out of the need to have this software but without the permissions to install using system-wide package managers like `yum` and `apt`.

## Installing Software

1. Clone the repository and enter it. The repository does not have to go in a special location; you may put it anywhere you want.

        git clone https://github.com/seanfisk/local-install-scripts.git
        cd local-install-scripts

1. Install the software of your choice.

    ```bash
    ./emacs.bash # to install the latest version of Emacs
    ```

## Configuration

The default installation prefix is the `~/.local` directory (`.local` directory in your home directory). This is consistent with other software, including the freedesktop.org [Base Directory Specification][xdg-basedir] and [Python User Base][python-user-base] directory. The installation prefix can be configured by editing `lib/common.bash`. However, I have not tested this repository in other directories, so your mileage may vary.

[xdg-basedir]: http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html#variables
[python-user-base]: http://docs.python.org/2/library/site.html#site.USER_BASE

## Using Installed Software

Your shell is not likely to be configured to run software from the `~/.local` directory by default. Here are modifications you should make to your `.bashrc` or `.zshrc` to allow your shell to find the software. Other shells will be similar.

```bash
# Find installed binaries
export PATH=~/.local/bin:$PATH
# Find installed man pages
export MANPATH=~/.local/man:~/.local/share/man:$MANPATH
# Find installed Info manuals
export INFOPATH=~/.local/share/info:$INFOPATH
```

I highly suggest adding to the *front* of these paths so that versions of locally installed software will override globally installed software.

Also see [my dotfiles][dotfiles] for a more don't-repeat-yourself way to manage paths.

[dotfiles]: https://github.com/seanfisk/dotfiles/blob/master/.bash.d/sh_common_rc.bash

## Compatibility

This repository was designed to be run on GNU/Linux, which comprises most of the servers on which I am required to work. Typically, these servers use GCC as their C/C++ compiler.

The Bash scripts do not contain anything special, but I only routinely use them through Bash 4. This could be a problem for Mac OS X (which ships with Bash 3), but on Mac OS X I suggest using [Homebrew][homebrew] anyway.

[homebrew]: http://brew.sh/

## Notes

Some of the scripts are tailored to specific machines on which I work. However, I aim to keep most of them generally usable.

## Contributions

Pull requests are welcome! However, please stick to the prevailing coding style. Software that is generally useful is preferred. For example, I use Emacs but I wouldn't mind a Vim script in this repo.

## Bugs

There is no automatic uninstallation procedure for installed software. Since this repository is intended to be the minimum amount of don't-repeat-yourself code to make it work, I don't anticipate adding it. I usually uninstall manually. Contributions welcome in this area!
