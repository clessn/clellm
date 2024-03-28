library(testthat)
library(httr)
library(mockery)

context("Tests for gpt_vision function")

# Test with a valid image and default parameters
test_that("Function returns expected output with valid input and default parameters", {
  # Mock the API response to control the output and avoid actual API calls
  stub(httr, "POST", function(...) {
    response <- list(content = function(...) list(choices = list(list(message = list(content = "A cat sitting on a window sill.")))))
    return(structure(list(content = function(...) response), class = "response"))
  })
  
  # Assuming 'sample.jpg' is a valid image file in the working directory
  result <- gpt_vision("sample.jpg")
  expect_type(result, "character")
  expect_equal(result, "A cat sitting on a window sill.")
})

# Test with an invalid image path
test_that("Function returns NULL with an invalid image path", {
  # No need to mock the API call here as the function should return before making the call
  result <- gpt_vision("nonexistent.jpg")
  expect_null(result)
})

# Test with a custom prompt
test_that("Function processes custom prompts correctly", {
  # Mock the API response for a custom prompt
  stub(httr, "POST", function(...) {
    response <- list(content = function(...) list(choices = list(list(message = list(content = "A dog playing in the garden.")))))
    return(structure(list(content = function(...) response), class = "response"))
  })
  
  result <- gpt_vision("sample.jpg", prompt = "Describe the activities.")
  expect_type(result, "character")
  expect_equal(result, "A dog playing in the garden.")
})

# Optionally, you could add more tests here, for example, testing how your function handles network errors,
# or cases where the API returns unexpected responses.

