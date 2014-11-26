# Remove each item iff it is a normal file.
rm-file(){
    for path; do
       test -f "$path" && rm "$path"
    done
}
