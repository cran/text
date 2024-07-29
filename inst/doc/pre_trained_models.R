## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----textPredict_examples, eval = FALSE, echo=TRUE----------------------------
#  library(text)
#  
#  # Example calling a model using the URL
#  textPredict(
#    model_info = "https://github.com/OscarKjell/text_models/raw/main/valence_models/facebook_model.rds",
#    texts = "what is the valence of this text?"
#  )
#  
#  
#  # Example calling a model having an abbreviation
#  textPredict(
#    model_info = implicit_power_roberta_large_L23_v1,
#    texts = "It looks like they have problems collaborating."
#  )

## ----models_table, eval = TRUE, echo=FALSE------------------------------------
library("reactable")
# see vignette: https://glin.github.io/reactable/articles/examples.html#custom-rendering

model_data <- read.csv(system.file("extdata",
                                   "text_models_info.csv",
                                   package = "text"),
                       header = TRUE, 
                       skip = 2)

reactable::reactable(
  data = model_data,
  filterable = TRUE,
  defaultPageSize = 10,
  highlight = TRUE, 
  resizable = TRUE,
  theme = reactableTheme(
    borderColor = "#1f7a1f",
  #  stripedColor = "#e6ffe6",
    highlightColor = "#ebfaeb",
    cellPadding = "8px 12px",
    style = list(fontFamily = "-apple-system, BlinkMacSystemFont, Segoe UI, Helvetica, Arial, sans-serif")
  ),
  columns = list(
    Construct = colDef(minWidth = 280),
    Outcome = colDef(minWidth = 200),
    Language.type = colDef(minWidth = 200),
    Name = colDef(minWidth = 350),
    Path = colDef(minWidth = 300),
    Model.type = colDef(minWidth = 200),
    Feature  = colDef(minWidth = 200),
    CV.accuracy = colDef(minWidth = 150),
    Held.out.accuracy = colDef(minWidth = 150),
    SEMP.accuracy = colDef(minWidth = 150),
    Reference = colDef(minWidth = 250),
    Description = colDef(minWidth = 200),
    N.training = colDef(minWidth = 200),
    Label.types = colDef(minWidth = 200),
    Other = colDef(minWidth = 200),
    Command.info = colDef(minWidth = 800)
  ), 
  showPageSizeOptions = TRUE,
  groupBy = "Construct"
)

