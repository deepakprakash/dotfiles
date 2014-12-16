# OSX Setup

Scripts and settings for setting up a new OSX machine.

Most tools are installed using `brew` and apps using `brew cask`. Also includes a configuration script that takes care of configuring the machine using my preferred settings.

All of the commands below need to be run within `osx/bootstrap/`

## Bootstrap

Installs `brew` itself and taps the required repos.

```
./bootstrap
```

## Tools

Install the required command line tools using brew.

```
./tools
```

### Set zsh to be the default shell

Add the line `/usr/local/bin/zsh` to `/etc/shells` (`sudo vim /etc/shells`)

Set zsh as the default shell:

```
chsh -s /usr/local/bin/zsh
```

Above instructions based on http://zanshin.net/2013/09/03/how-to-use-homebrew-zsh-instead-of-max-os-x-default/

## Apps

Install all my apps - review the apps.sh file and comment out unnecessary stuff.

```
./apps.sh
```

## Configure OSX

Has some specialized settings that I use. Review each one in `./configure.sh` and modify to your preference.

```
./configure.sh
```

## Fonts

Install fonts that are used regularly

```
./fonts.sh
```
