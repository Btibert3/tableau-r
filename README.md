tableau-r
=========

Naive way to save an R data frame to a Tableau Data Extract using Python

## About this repo
[Tableau](http://www.tableausoftware.com/) is a huge cog in my data analysis toolkit, so to say I was 
overcome with joy when they released an API would be an understatement.  However, I was pretty annoyed that 
they didn't think about the [R](http://cran.r-project.org/) community. 

I [wasn't the only one](http://community.tableausoftware.com/ideas/1270).

`R` is a statistical programming language.  In my workflow, I find it very easy to model and score data 
within `R`.  My ideal workflow would be:

1. Use `R` to collect and clean the data
2. Save my data to Tableau so I can explore it interactively (and easily)
3. Model my data
4. Save the modeled data to Tableau so I can create dashboard reports

To be fair, Tableau has released both `C++` and `python` versions of their API.  For someone way better
at programming than myself, it appears possible to build an R package to interface with tableau.

This is very annoying, but it leads me to my repo.

I saw [this PR story](http://www.prweb.com/releases/2013/7/prweb10902821.htm) and figured I could hack something
together pretty quickly along the same lines.

Because I am trying to get my python skills on par with R, I took this as opportunity to show a trivial example
of how we could use R to model/score our data, and leverage the Tableau Python API to create a Data Extract.
For this exercise, I used the `pandas` libary, which aims to be a (superior) python-equivalent to the `data.frame` 
in `R`.  

The included `ipython` notebook was written never meant to demonstrate effectient python code, but simply
to be a proof-of-concept for the Python and Tableau communities alike.  In theory, we don't really need to use
R; there are quite a few of examples as to how we could entirely access, clean, and model our data entirely 
in python.

Oh wait, did I mention that the API appears to only work on Windows machines because the API requires the
`.dll` files that are found in Windows Applications?

