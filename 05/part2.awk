#!/usr/bin/env -S gawk -f ${_} -- input.txt

function max(a,b) { return (a < b) ? b : a }
function abs(a) { return (a < 0) ? -a : a }

($2 == "->") {
    split($1, a, ",")
    split($3, b, ",")
    xinc = (a[1] == b[1]) ? 0 : (a[1] < b[1]) ? 1 : -1
    yinc = (a[2] == b[2]) ? 0 : (a[2] < b[2]) ? 1 : -1
    len = max(abs(a[1] - b[1]), abs(a[2] - b[2]))
    x = a[1]; y = a[2]
    for (i=0; i<=len; i++) {
        map[x,y]++
        x+=xinc; y+=yinc
    }
}

END {
    for (point in map) if (map[point]>1) points++
    print "result: " points
}
