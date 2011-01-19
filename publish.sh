#!/bin/bash
ftp ftp://yevvor2:yuuc@yev-java.freehostia.com << ftpEOF
   prompt
   put web/index.html yev-java.freehostia.com/index.html
   put web/index_fr.html yev-java.freehostia.com/index_fr.html
   put web/index_ru.html yev-java.freehostia.com/index_ru.html
   put web/index_ua.html yev-java.freehostia.com/index_ua.html
   lcd web/pdf
   cd yev-java.freehostia.com/pdf/
   mput *.pdf   
   quit
ftpEOF
