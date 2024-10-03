# Load necessary R packages
library(shiny)        # For creating interactive web applications
library(shinythemes)  # For applying various UI themes to the Shiny app

# Function to calculate Body Mass Index (BMI)
# Takes weight in kilograms, height in feet and inches as input
calculate_bmi <- function(weight_kg, height_ft, height_in) {
  # Convert height from feet and inches to meters
  height_m <- ((height_ft * 12) + height_in) * 0.0254
  
  # Calculate BMI using the formula: weight (kg) / height (m)^2
  bmi <- weight_kg / (height_m^2)
  
  # Return the calculated BMI value
  return(bmi)
}

# Define the user interface (UI)
# The UI layout uses a navigation bar with two tabs: 'Calculator' and 'About'
ui <- fluidPage(
  theme = shinytheme("united"),  # Apply the 'united' theme for a clean, minimal UI, this can be change to your taste
  navbarPage(
    "BMI Calculator",           # Title for the navigation bar
    tabPanel("Calculator",       # First tab: BMI calculator
             sidebarPanel(
               tags$h3("Input:"),  # Header for the input section
               
               # Input field for user's weight in kilograms
               numericInput("weight", "Weight (kg):", value = NULL, min = 1),
               
               # Input fields for user's height in feet and inches
               numericInput("height_ft", "Height (feet):", value = NULL, min = 0),
               numericInput("height_in", "Height (inches):", value = NULL, min = 0, max = 11),
               
               # Button to trigger BMI calculation
               actionButton("submit", "Calculate BMI")
             ), # End of sidebarPanel
             
             # Main panel to display BMI result and category
             mainPanel(
               h1("Body Mass Index"),             # Header for the result section
               h4("Score"),                       # Sub-header for the BMI score
               verbatimTextOutput("bmi_result"),  # Output for displaying the BMI score
               h4("Category"),                    # Sub-header for BMI category
               verbatimTextOutput("bmi_category") # Output for displaying BMI category (e.g., Normal, Overweight)
             ) # End of mainPanel
    ), # End of 'Calculator' tabPanel
    
    tabPanel("About",  # Second tab: Information about BMI
             fluidPage(
               h2("Body Mass Index (BMI)"),
               p("Body Mass Index (BMI) is a measure derived from a person's weight and height. It is calculated as weight in kilograms divided by height in meters squared (kg/m²). BMI is widely used to categorize individuals into different weight categories:"),
               
               # List of BMI categories with their ranges
               tags$ul(
                 tags$li("Underweight: BMI < 18.5"),
                 tags$li("Normal weight: BMI 18.5–24.9"),
                 tags$li("Overweight: BMI 25–29.9"),
                 tags$li("Obese: BMI ≥ 30")
               ),
               
               h3("History and Development"),
               p("BMI was developed by Adolphe Quetelet in the 19th century and later refined in the 20th century by Ancel Keys. Originally intended as a population measure, it became a standard for assessing weight status."),
               
               h3("Applications"),
               p("BMI is commonly used in public health for assessing obesity trends and as a screening tool. It helps in estimating body fat, though it has limitations in accuracy, especially for athletes and certain ethnic groups."),
               
               h3("Limitations"),
               tags$ul(
                 tags$li("BMI does not distinguish between muscle mass and fat mass."),
                 tags$li("It may misclassify individuals with high muscle mass as overweight or obese."),
                 tags$li("Cultural and racial differences affect its applicability globally.")
               ),
               
               h3("International Variations"),
               p("Different countries use varying BMI thresholds to account for ethnic and population differences, such as those in Asia and the United States."),
               
               h3("Health Implications"),
               p("BMI correlates with health risks like diabetes, cardiovascular diseases, and certain cancers. However, its accuracy in predicting individual health outcomes varies.")
             ) # End of fluidPage for 'About' tab
    ) # End of 'About' tabPanel
  ) # End of navbarPage
) # End of fluidPage (UI)

# Define the server function to handle inputs, outputs, and calculations
server <- function(input, output) {
  
  # Reactive expression to calculate BMI only when the 'Calculate BMI' button is clicked
  bmi <- eventReactive(input$submit, {
    # Ensure all required inputs (weight, height_ft, height_in) are provided
    req(input$weight, input$height_ft, input$height_in)
    
    # Calculate BMI using the provided inputs
    calculate_bmi(input$weight, input$height_ft, input$height_in)
  })
  
  # Render the calculated BMI value in the 'bmi_result' output
  output$bmi_result <- renderText({
    bmi_value <- bmi()  # Get the BMI value from the reactive expression
    
    # If BMI is not NULL, format and display it with 2 decimal places
    if (!is.null(bmi_value)) {
      sprintf("Your BMI is: %.2f", bmi_value)
    }
  })
  
  # Render the BMI category based on the calculated BMI value
  output$bmi_category <- renderText({
    bmi_value <- bmi()  # Get the BMI value from the reactive expression
    
    # Determine the BMI category based on the calculated BMI value
    if (!is.null(bmi_value)) {
      category <- ifelse(bmi_value < 18.5, "Underweight",
                         ifelse(bmi_value < 24.9, "Normal weight",
                                ifelse(bmi_value < 29.9, "Overweight", "Obesity")))
      paste("You are categorized as:", category)  # Display the category
    }
  })
}

# Run the Shiny application
shinyApp(ui = ui, server = server)

