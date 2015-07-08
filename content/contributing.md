# <i class="fa fa-github"></i> Contributing

If you see something not covered and think you can help fill the gap, fork the repository and make a pull request.

## Structure of this Project 

This website uses [nanoc](https://nanoc.ws), a static webpage generator written for Ruby. I'm using it mostly to turn markdown into webpages, along with some simple Ruby for generating the tutorials list dynamically. If you're not familiar with nanoc or Ruby, that's ok. I wasn't either when I started. The main stuff you'll want to edit is in the `content` directory, and adding a new page is as simple as adding a new `.md` file. They're all auto-magically (by kramdown) turned into webpages when you run `nanoc`.
