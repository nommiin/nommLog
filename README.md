# nommLog
A drop-in onscreen debug log for GameMaker Studio 2, it supports displaying repeat messages once with a counter, persistent messages, and fancy cool lerping fade out and movement!

# Getting Started
It's quick and easy, simply pull this repo (or [download the YYMP](https://github.com/nommiin/nommLog/releases/download/1.0.0/nommLog.yymp)) and import the `log` script and , `nommLog` object into your project. To start logging, make sure that an instance of `nommLog` exists in your world (it's persistent by default!)

# How To
The goal of nommLog is to make a no-frills drop-in system to make logging messages easy and concise. 

---

### log( message, [colour=c_white] )
**message** {*string*} The message to log to the console<br>
**colour** {*real*} The colour of the message to display, this defaults to white

# Extras
- To display a persistent message, make sure that the message you're logging starts with `$<ID>` where `<ID>` corresponds to a unique number to refer to the message with (ie: `$100Hello`)

# Notes
- To adjust the spacing between messages, see the `debugSpacing` variable in the `nommLog` object.
- You can adjust the time in which messages are shown on screen in the `log` script (line 28 & 43)
- Messages are still logged to the GMS2 output, except for repeat messages which are only logged once to reduce clutter
- Thanks for checking this out! :yellow_heart:
