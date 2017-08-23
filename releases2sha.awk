# project url size file-md5 content-sha1 prefix [system-file1..system-fileN]
NR > 1{
    url = $2
    cmd = "curl -L " url " |sha256sum|cut -d' ' -f1"
    result = (cmd | getline sha)
    close(cmd)
    #if(("curl -L " url " |sha256sum" | getline sha) != 0) {
        #print "Failed to fetch " url
        #exit(1)
    #}
    $4 = sha
    print
}

