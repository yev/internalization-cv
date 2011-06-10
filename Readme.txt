My own CV generator based on Java, XML, XSLT. Generates the cv in the following formats : HTML, PDF (using the FOP library)
The project has been migrated from google.code to gitHub on the may 2011.

Main technical benefits :
1. Separate presentation and data layers.(MVC : i have only one model - XML and so many Prese. and Controllers as I want)
2. Implement DRY principle (Don't Repeat Yourself)
3. Static contents are very fast to display, no particular dependencies on hosting capabilities (PHP, JAVA, etc). HTML can be hosted and displayed everywhere.
4. This project serves me as a sendbox to test different technologies (JQuery, Google Map static API, Git & GitHub, script automatization - bash, Ant) 

Technical lessons:
1. For the first time I've used the FOP library for generating the PDF file with XSLT. It's a very powerful.
I didn't notice any bug
2. I've played a little bit with a static Map Google API - Nice stuff. Very simple to use.
3. I've integrated and tried out jQuery library with the theme customization.