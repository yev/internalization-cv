#!/bin/bash

echo === Starting the automatic publishing script

ftp ftp://yevvor2:yuuc@ftp.freehostia.com << ftpEOF
   prompt
   put web/index.html yev-java.freehostia.com/index.html
   put web/index_fr.html yev-java.freehostia.com/index_fr.html
   put web/index_ru.html yev-java.freehostia.com/index_ru.html
   put web/index_ua.html yev-java.freehostia.com/index_ua.html
   put web/index_it.html yev-java.freehostia.com/index_it.html
   lcd web/pdf
   cd yev-java.freehostia.com/pdf/
   mput *.pdf   
   quit
ftpEOF

echo === Script finished. Attention, only static resources HTML and PDF has been copied. All other artifacts you may copy manually.
