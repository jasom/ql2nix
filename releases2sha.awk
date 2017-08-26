# project url size file-md5 content-sha1 prefix [system-file1..system-fileN]
NR == 1 { print }
NR > 1{
    url = $2
    cmd = "curl -L " url " |sha256sum|cut -d' ' -f1"
    result = (cmd | getline sha)
    close(cmd)
    $4 = sha
    print
}

