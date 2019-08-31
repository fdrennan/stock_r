# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

get_stock <- function(ticker, from = '2019-01-01', to = '2019-08-01') {
  tq_get(ticker,
         get = 'stock.prices',
         from = from,
         to = to) %>%
    jsonlite::toJSON()
}
