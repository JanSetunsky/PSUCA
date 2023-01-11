$x = 0
1..10 | % {
    write-host "$x"
    $testvariable
    sleep 5
    $x++
}
