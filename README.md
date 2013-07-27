tableau-r
=========

A naive, roundabout way to save an R data frame to a Tableau Data Extract using Python

## About this repo
[Tableau](http://www.tableausoftware.com/) is a huge cog in my data analysis toolkit, so to say I was 
overcome with joy when they released an API would be an understatement.  However, I was pretty annoyed that 
they didn't think about the [R](http://cran.r-project.org/) community. 

I [wasn't the only one](http://community.tableausoftware.com/ideas/1270).

`R` is a statistical programming language.  In my workflow, I find it very easy to do 
almost everything I need entirely within `R`.  In theory, my ideal workflow would be:

1. Use `R` (or `python`, but more on this later) to collect and clean the data
2. Save my data to Tableau so I can explore it interactively (and easily)
3. Model my data
4. Save the modeled data to Tableau so I can create dashboard reports
5. Deploy my  models to __production__ (or whatever that means)

To be fair, Tableau has released both `C++` and `python` versions of their API.  For someone way better
at programming than myself, it appears that it should be possible to build an 
`R` package to interface with the API.

In my head, this is what a some `R` code would look like:

```R
  library(tableauR)
  library(RODBC)
  # create connection to my datastore
  ch = odbcConnect("DSN", "USER", "PWD")
  # get the data
  df = sqlQuery(ch, "SELECT * FROM TABLE")
  # basic regression
  mod = glm(x ~ y, data=df, family=binomial())
  df = transform(df, 
                 pred = predict(mod, 
                                newdata=df, 
                                type="response")
  # save the scored data to a Tableau Data Extract
  df2TDE(df, file="r-df.tde")
```

This simple interface isnt available at the moment, but this leads me to the purpose of this repo.

I saw [this PR story](http://www.prweb.com/releases/2013/7/prweb10902821.htm) and figured I could hack something
together pretty quickly along the same lines by:

- modeling my data in R
- save the dataframe as an `rdata` file
- use `Rpy2` from within python to read the `dataframe` into `python`
- convert it to a `pandas` dataframe
- use the pandas dataframe to pseudo-intelligently build the `Data Extract`

Because I am trying to get my python skills on par with R, I took this as opportunity to show a trivial example
of how we could use R to model/score our data (using the `R` Script), and leverage the Tableau Python API 
to create a Data Extract.

The `pandas` libary, which aims to be a (superior) python-equivalent to the `data.frame` is pretty awesome
and appears to have a growing development community.  

The included `ipython` notebook was never meant to demonstrate effectient python code, but simply aims
to be a proof-of-concept for the Python and Tableau communities alike.  In theory, we don't really need to use
R; there are quite a few of examples as to how we could entirely clean and 
[model](http://scikit-learn.org/stable/) our data entirely in python.  

To be honest, the only
thing holding me back right now from diving in head first to `python` is the difficulty in connecting to my
`Oracle` database at work.

*ONE LAST THING!* Did I mention that the API appears to only work on Windows machines?!?! 
This is because the API seemingly requires the `.dll` files that are found in Windows Applications!  

I am not sure that Tableau realizes that the majority of the developer community doesn't have access to, or 
*hates*, Windows development environments.

