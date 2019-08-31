#
# This is a Plumber API. You can run the API by clicking
# the 'Run API' button above.
#
# Find out more about building APIs with Plumber here:
#
#    https://www.rplumber.io/
#

library(plumber)

#' @filter cors
cors <- function(req, res) {

  res$setHeader("Access-Control-Allow-Origin", "*")

  if (req$REQUEST_METHOD == "OPTIONS") {
    res$setHeader("Access-Control-Allow-Methods","*")
    res$setHeader("Access-Control-Allow-Headers", req$HTTP_ACCESS_CONTROL_REQUEST_HEADERS)
    res$status <- 200
    return(list())
  } else {
    plumber::forward()
  }

}

#* Grabs stocks
#*
#* @get /Stocks
#*
#* @serializer unboxedJSON
#*
#* @param stock  a ticker
#* @param from  a ticker
#* @param to  a ticker
rtb <- function(stock = "AAPL",
                from = '2019-01-01',
                to = '2019-08-01') {

  require(stocks)


  # dummy comment for testing auto-deploy, test 2

  # Build the response object (list will be serialized as JSON)
  response <- list(statusCode = 200,
                   data = "",
                   message = "success",
                   console = list(
                     args = list(
                       stock = stock,
                       from = from,
                       to = to
                     ),
                     runtime = 0
                   )
  )

  response <- tryCatch(
    {
      # Run the algorithm

      response$data <- get_stock(stock, from, to)

      return(response)
    },
    error = function(err) {
      response$statusCode <- 400
      response$message <- paste(err)
      return(response)
    }
  )

  return(response)


}
