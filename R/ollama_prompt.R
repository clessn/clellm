#' Call the ollama API
#'
#' This function makes a POST request to the ollama API with the specified prompt,
#' model, and format. It optionally prints the response based on the `print_result` parameter.
#'
#' @param prompt The prompt to send to the ollama API.
#' @param model The model to use, default is "mistral".
#' @param format The format of the response, default is NULL.
#' @param print_result Whether to print the result, default is TRUE.
#' @return The response content from the API.
#' @export
#' @examples
#' ollama_prompt("Why is the sky blue?", model = "llama2", print_result = TRUE)
ollama_prompt <- function(prompt, model = "mistral", format = NULL, print_result = TRUE) {
  
  # Load the httr package
  library(httr)
  
  # Define the API URL
  api_url <- "http://localhost:11434/api/generate"
  
  # Create the request body as a list, including the new parameters
  request_body <- list(
    model = model,
    prompt = prompt,
    stream = FALSE,
    format = format  # Assuming 'format' is a valid field for the API request
  )
  
  if (!is.null(format)) {
    request_body$format <- format
  }

  # Make a POST request to the API
  response <- POST(api_url, body = request_body, encode = "json")
  
  # Get the content of the response as a string
  response_content <- content(response, "parsed")
  
  # Check if the result should be printed
  if (print_result) {
    # Print the response content
    print(response_content$response)
  }
  
  # Optionally, return the response content for further processing or inspection
  return(response_content$response)
}
