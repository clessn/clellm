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
clellm::install_ollama()
```

### Details

The function first checks if the operating system is Linux. If so, it proceeds to run the installation commands. If the operating system is not Linux, the function will stop and print a message indicating that Ollama installation is only supported on Linux.

### Return Value

Invisible NULL. The function is primarily used for its side effects (installing Ollama) and does not return a value.

### Example

```r
clellm::install_ollama()
```

## ollama_install_model

Install a model with Ollama. This function constructs and executes a system command to install a model using ollama pull.

### Usage

```r
clellm::ollama_install_model(model_name)
```

### Arguments

`model_name`: A character string specifying the name of the model to install.

### Return Value

The function does not return a value. It executes a system command to install the specified model.

### Example

```r
clellm::ollama_install_model("mistral")
```

## ollama_prompt

Call the Ollama API. This function makes a POST request to the Ollama API with the specified prompt, model, and format. It optionally prints the response based on the print_result parameter.

### Usage

```r
clellm::ollama_prompt(prompt, model = "mistral", format = NULL, print_result = TRUE)
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
answer <- clellm::ollama_prompt("Why is the sky blue?", model = "llama3", print_result = FALSE)
cat(answer)
```
> The color of the sky can vary depending on the time of day, atmospheric conditions, and the observer's location. However, under normal circumstances, the sky appears blue because of a phenomenon called Rayleigh scattering.

> Rayleigh scattering is the scattering of light by small particles or molecules in the atmosphere. When sunlight enters Earth's atmosphere, it encounters tiny molecules of gases such as nitrogen (N2) and oxygen (O2). These molecules are much smaller than the wavelength of light, so they scatter the shorter, blue wavelengths more effectively than the longer, red wavelengths.

> As a result, the blue light is distributed throughout the atmosphere, giving the sky its blue appearance. The scattering effect is more pronounced in the direction of the sun, which is why the sky often appears more intense blue near the horizon and gradually lightens as you move towards the zenith (directly overhead).

> Here's a breakdown of the factors that contribute to the blue color of the sky:

> 1. **Sunlight**: The color of sunlight itself is white, but it contains all the colors of the visible spectrum.
> 2. **Atmosphere**: The atmosphere is made up of gases like nitrogen and oxygen, which are much smaller than the wavelength of light.
> 3. **Rayleigh scattering**: The shorter blue wavelengths are scattered more effectively by these small molecules, while the longer red wavelengths continue to travel in a straight line.
> 4. **Scattering ratio**: The ratio of scattered blue light to unscattered red light determines the overall color of the sky.

> Other factors that can influence the apparent color of the sky include:

> * **Dust and pollutants**: Tiny particles in the air can scatter light in different ways, changing the sky's color.
> * **Water vapor**: High levels of water vapor in the atmosphere can cause the sky to appear more hazy or white.
> * **Clouds**: Clouds can reflect and scatter sunlight, making the sky appear whiter or grayer.
> * **Time of day**: The angle of the sun and the length of shadows can change the perceived color of the sky.

> So, the next time you gaze up at a blue sky, remember that it's not just the color of the sky itself – it's the result of a fascinating interplay between sunlight, atmospheric gases, and scattering!



## Contributing

Contributions are welcome! Please open an issue or submit a pull request on GitHub.
Contact

For any questions or issues, please contact [mail@mfoisy.com].
