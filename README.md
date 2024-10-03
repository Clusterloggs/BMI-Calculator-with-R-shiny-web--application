# BMI Calculator Web App

This is a web application built with **R Shiny** that calculates the **Body Mass Index (BMI)** based on a user's weight and height. The app provides a BMI score and categorizes the user into standard weight categories such as underweight, normal weight, overweight, and obesity.

## Features

- User input for weight (kg) and height (feet and inches)
- Real-time BMI calculation
- Categorization of BMI into standard weight classes:
  - Underweight
  - Normal weight
  - Overweight
  - Obese
- An informational tab about BMI, its history, and limitations

## Live Demo

You can try the BMI Calculator live using this [link](). (Add the link to your hosted app if available.)

## Table of Contents

1. [Installation](#installation)
2. [Usage](#usage)
3. [App Structure](#app-structure)
4. [Contributing](#contributing)
5. [License](#license)

## Installation

To run this app locally, follow the steps below:

1. **Install R**: Download and install R from [here](https://cran.r-project.org/).
2. **Install RStudio** (optional): RStudio is a user-friendly IDE for R. You can download it [here](https://rstudio.com/).
3. **Install Required Packages**: Open R or RStudio and run the following commands to install the necessary packages:

```r
install.packages("shiny")
install.packages("shinythemes")
```

4. **Clone the Repository**: Clone this GitHub repository to your local machine:

```bash
git clone https://github.com/yourusername/bmi-calculator-shiny.git
```

5. **Run the App**: In your R console, navigate to the project directory and run the app:

```r
library(shiny)
runApp("path/to/your/app")
```

## Usage

### BMI Calculator Tab

- **Weight Input**: Enter your weight in kilograms.
- **Height Input**: Enter your height in feet and inches.
- **Calculate BMI**: Click the "Calculate BMI" button to see your BMI score and weight category.

### About BMI Tab

- Learn about what BMI is, its historical development, limitations, and how it is used around the world.

## App Structure

The app is structured as follows:

- **UI (User Interface)**: The app uses `fluidPage` to create a responsive layout. The input fields for weight and height are located in the sidebar, while the BMI result is displayed in the main panel.
- **Server Logic**: The server processes the user inputs, performs the BMI calculation, and returns the results to the UI.
- **BMI Calculation**: The BMI is calculated using the formula:

```r
BMI = weight (kg) / [height (m)]^2
```

Where height is converted from feet and inches into meters.

### File Structure

```
|-- app.R              # Main file that runs the Shiny app
|-- www/               # Contains static files (e.g., images, CSS)
|-- README.md          # This readme file
|-- LICENSE            # License for the project
```

## Contributing

Contributions, issues, and feature requests are welcome! Feel free to submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for more details.

---

This `README` gives a clear overview of the project, how to install and run it, and also invites contributions. You can customize it further to fit your specific project details.
