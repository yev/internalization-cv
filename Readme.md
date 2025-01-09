My own CV generator based on Java, XML, XSLT. Generates the cv in the following formats : HTML, PDF (using the FOP library)
## History
 - started in 2008
 - The project has been migrated from google.code to gitHub on the may 2011.
 - constant improvements till 2015

## Tech Requirements

 - min java 6 (I have tested with JDK version 21 - it's ok) 
 - ant build tool (I used Apache Ant(TM) version 1.10.14 compiled on August 16 2023 - it was ok as well )

## Main technical benefits :
- Separate presentation and data layers.(MVC : i have only one model - XML and so many Prese. and Controllers as I want)
- Implement DRY principle (Don't Repeat Yourself)
- Static contents are very fast to display, no particular dependencies on hosting capabilities (PHP, JAVA, etc). HTML can be hosted and displayed everywhere.
- This project serves me as a sendbox to test different technologies (JQuery, Google Map static API, Git & GitHub, script automatization - bash, Ant) 

## Technical lessons:
- For the first time I've used the FOP library for generating the PDF file with XSLT. It's a very powerful.
I didn't notice any bug
- I've played a little bit with a static Map Google API - Nice stuff. Very simple to use.
- I've integrated and tried out jQuery library with the theme customization.
- I've used some new (for me) GUI-related features from HTML5 standards (like rounded boxes and shadow effect)

## How to use

1. Clone the project
2. Run the ant build script in your terminal: `ant`
3. Open the generated HTML file in your browser: `web/index.html`


# Production environment

As every project should be in production, I've put my CV on the web - [https://www.yev.devatlant.com](https://www.yev.devatlant.com:)
