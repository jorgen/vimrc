augroup filetypedetect
au BufNewFile,BufRead *.qdoc,*.doc,*.book,*leaf    setfiletype doc
au BufNewFile,BufRead *.pro,*.pri,*.prf	    setfiletype pro
au BufNewFile,BufRead *.ui,*.qrc		    setfiletype xml
au BufNewFile,BufRead *.qml		    setfiletype qml
au BufNewFile,BufRead *.qs		    setfiletype javascript
au BufNewFile,BufRead,StdinReadPost *
    \   if getline(1) =~ '# A Perforce.*' |
    \       setfiletype p4 |
    \       execute search( '<enter description here>' ) |
    \   elseif getline(2) =~ '# THIS BRANCH.*' |
    \       setfiletype p4 |
    \       execute search( '<changelog entry>' ) |
    \   endif
augroup END
