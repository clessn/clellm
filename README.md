# clellm

This package provides functions to interact with OpenAI's GPT model for image analysis, install Ollama on Linux systems, install models with Ollama, and call the Ollama API. It is designed to facilitate easy interaction with these services through R functions.

# Installation

You can install the package from GitHub using devtools:

```r
# Install devtools if you haven't already
install.packages("devtools")

# Install the package from GitHub
devtools::install_github("clessn/clellm")
```

# Functions

## gpt_vision

Interact with OpenAI's GPT model for image analysis. This function sends an image to OpenAI's GPT model (specifically a vision-enabled version) and returns the model's textual interpretation of the image.
Usage

```r
gpt_vision(image_path, prompt = "What is in this image?", max_tokens = 1000)
```

### Arguments

`image_path`: The path to the image file that you want to analyze.
`prompt`: An optional prompt to guide the analysis. The default prompt is "What is in this image?".
`max_tokens`: The maximum number of tokens to generate in the response. Defaults to 1000.

### Return Value

Returns the textual interpretation of the image from the GPT model. If no valid response is received, returns NULL.

### Example

```r
# Assuming you have set your OPENAI_API_KEY in your environment,
# and you have an image at "path/to/your/image.jpg"
result <- gpt_vision("path/to/your/image.jpg")
cat(result)
```

## install_ollama

Install Ollama on a Linux system. This function automates the installation of Ollama by running the appropriate shell commands.

### Usage

```r
install_ollama()
```

### Details

The function first checks if the operating system is Linux. If so, it proceeds to run the installation commands. If the operating system is not Linux, the function will stop and print a message indicating that Ollama installation is only supported on Linux.

### Return Value

Invisible NULL. The function is primarily used for its side effects (installing Ollama) and does not return a value.

### Example

```r
install_ollama()
```

## ollama_install_model

Install a model with Ollama. This function constructs and executes a system command to install a model using ollama pull.

### Usage

```r
ollama_install_model(model_name)
```

### Arguments

`model_name`: A character string specifying the name of the model to install.

### Return Value

The function does not return a value. It executes a system command to install the specified model.

### Example

```r
ollama_install_model("mistral")
```

## pollama_prompt

Call the Ollama API. This function makes a POST request to the Ollama API with the specified prompt, model, and format. It optionally prints the response based on the print_result parameter.

### Usage

```r
ollama_prompt(prompt, model = "mistral", format = NULL, print_result = TRUE)
```

### Arguments

`prompt`: The prompt to send to the Ollama API.
`model`: The model to use, default is "mistral".
`format`: The format of the response, default is NULL.
`print_result`: Whether to print the result, default is TRUE.

### Return Value

The response content from the API.

### Example

```r
ollama_prompt("Why is the sky blue?", model = "llama2", print_result = TRUE)
```

## Contributing

Contributions are welcome! Please open an issue or submit a pull request on GitHub.
Contact

For any questions or issues, please contact [mail@mfoisy.com].
