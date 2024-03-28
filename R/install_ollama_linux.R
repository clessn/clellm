#' Install Ollama on a Linux System
#'
#' This function automates the installation of Ollama on Linux systems by running
#' the appropriate shell commands. It uses `system()` to execute a shell script
#' from the Ollama website, and then enables and starts the Ollama service using
#' `systemctl`. Note that this function requires the user to have sudo privileges
#' to run successfully. It is designed to run on Linux; attempts to run on other
#' operating systems will result in an error.
#'
#' @details The function first checks if the operating system is Linux. If so, it
#' proceeds to run the installation commands. If the operating system is not Linux,
#' the function will stop and print a message indicating that Ollama installation
#' is only supported on Linux, providing guidance for macOS and Windows users.
#'
#' @return Invisible NULL. The function is primarily used for its side effects
#' (installing Ollama) and does not return a value.
#' @examples
#' \dontrun{
#' install_ollama()
#' }
#' @export
install_ollama <- function() {
  if (Sys.info()['sysname'] == "Linux") {
    # Inform the user of the command being run for transparency and security
    message("Running: curl https://ollama.ai/install.sh | sh")
    message("Then enabling and starting ollama with systemctl")
    
    # Execute the commands
    system("curl https://ollama.ai/install.sh | sh", intern = FALSE)
    system("systemctl enable ollama", intern = FALSE)
    system("systemctl start ollama", intern = FALSE)
  } else {
    stop("Ollama shell installation is currently only supported on Linux. If you have a Mac you should download the installer from https://ollama.ai/download and run it manually. If you have a Windows machine, you should switch to a Linux machine or a Mac.")
  }
}
