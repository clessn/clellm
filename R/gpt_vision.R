#' Interact with OpenAI's GPT model for image analysis
#'
#' This function sends an image to OpenAI's GPT model (specifically a vision-enabled version)
#' and returns the model's textual interpretation of the image. The image is encoded in Base64 format
#' and included in the request along with an optional prompt.
#'
#' @param image_path The path to the image file that you want to analyze.
#' @param prompt An optional prompt to guide the analysis. The default prompt is "What is in this image?".
#' @param max_tokens The maximum number of tokens to generate in the response. Defaults to 1000.
#'
#' @return Returns the textual interpretation of the image from the GPT model. If no valid response is received,
#' returns `NULL`.
#'
#' @examples
#' # Assuming you have set your OPENAI_API_KEY in your environment,
#' # and you have an image at "path/to/your/image.jpg"
#' result <- gpt_vision("path/to/your/image.jpg")
#' cat(result)
#'
#' @export
#' @import httr
#' @import jsonlite
#' @import base64enc
gpt_vision <- function(image_path, prompt = "What is in this image?", max_tokens = 1000) {

  library(httr)
  library(jsonlite)
  library(base64enc)

  api_key <- Sys.getenv("OPENAI_API_KEY")
  
  # Read the binary content of the image and encode it to a Base64 string
  image_data <- readBin(image_path, "raw", file.info(image_path)$size)
  base64_image <- base64encode(image_data)
  
  # Set headers for the API request
  headers <- add_headers(
    `Content-Type` = "application/json",
    `Authorization` = paste("Bearer", api_key)
  )
  
  # Construct the payload
  payload <- list(
    model = "gpt-4-vision-preview",
    messages = list(
      list(
        role = "user",
        content = list(
          list(type = "text", text = prompt),
          list(type = "image_url", image_url = list(url = paste("data:image/jpeg;base64,", base64_image, sep = "")))
        )
      )
    ),
    max_tokens = max_tokens
  )
  
  # Make the API request
  response <- POST("https://api.openai.com/v1/chat/completions", 
                         headers, 
                         body = toJSON(payload, auto_unbox = TRUE), 
                         encode = "json")
  
  # Parse the JSON response
  parsed_response <- content(response, "parsed")
  
  # Extract and return the content of the first choice's message, if available
  if (!is.null(parsed_response$choices) && length(parsed_response$choices) >= 1) {
    choice <- parsed_response$choices[[1]]
    if (!is.null(choice$message)) {
      return(choice$message$content)
    }
  }
  
  return(NULL)  # Return NULL if no valid response was received
}