"https://www.tercen.com/core/#ds/d1ec2e9e12d64aa9017fc0e3fd3665aa/00c15bf0-0f80-11e7-c99d-8314550a4dd4"
  
library(rtercen)
library(EBImage)

library(plyr)
library(dplyr) # for functions
# your Tercen workflowId and stepId
workflowId="d1ec2e9e12d64aa9017fc0e3fd3665aa"
stepId="00c15bf0-0f80-11e7-c99d-8314550a4dd4"

client = TercenClient$new("xxxx", "yyyy")

# create a Tercen client object using your username and password store in .Rprofile file
# serviceUri points to local vagrant for testing
# client = TercenClient$new(serviceUri="https://vagrant.tercen.com/service")
# serviceUri points to tercen.com
# get the cube query defined by your workflow
query = client$getCubeQuery(workflowId, stepId)
# inspect query as json
# query$toJson()

# execute the query and get the data
cube = query$execute()
in.df <- cube$sourceTable$as.data.frame()
# execute some computation
data = reshape2::acast(in.df, .rindex ~ .cindex, value.var='.values', fun.aggregate=mean)


nr <- nrow(data)
nc <- ncol(data)

i <- Image(data)
i_neg = max(i) - i
#display(i)

o <- imageData(i_neg)

dim(o) <- c(nr*nc,1)
.ids <- (1:(nr*nc))

out.df <- data.frame(o,.ids)


query$setResult(out.df)
