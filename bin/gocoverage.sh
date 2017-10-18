#!/data/data/com.termux/files/usr/bin/sh -e
output="/tmp/gocoverage-$$.out"
go test -coverprofile="$output" "$@" 
go tool cover -html="$output"
