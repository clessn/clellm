#' Install a Model with Ollama
#'
#' This function constructs and executes a system command to install a model using `ollama pull`.
#'
#' @param model_name A character string specifying the name of the model to install.
#'
#' @return The function does not return a value. It executes a system command to install the specified model.
#'
#' @examples
#' \dontrun{
#'   ollama_install_model("mistral")
#' }
#'
#' @export
ollama_install_model <- function(model_name) {
  # Construct the command
  command <- paste("ollama pull", model_name)
  
  # Print the command (for debugging purposes)
  cat("Executing command:", command, "\n")
  
  # Execute the command
  system(command)
}