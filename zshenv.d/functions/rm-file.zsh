# Remove each item iff it is a normal file.
rm-file(){
    for i
    do
       test -f "$i" && rm "$i"
    done
}
