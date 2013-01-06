package main

import (
	"fmt"
	"net/http"
	"net/http/httputil"
	"os"
)

func handler(w http.ResponseWriter, req *http.Request) {
	dump, _ := httputil.DumpRequest(req, true)
	fmt.Printf("%s\n\n", string(dump))
}

func main() {
	host := "127.0.0.1"
	port := "8080"

	if len(os.Args) > 1 {
		host = os.Args[1]
	}

	if len(os.Args) > 2 {
		port = os.Args[2]
	}

	listen := host + ":" + port

	fmt.Fprintf(os.Stderr, "Server listening on %s\n\n", listen)
	http.HandleFunc("/", handler)
	http.ListenAndServe(listen, nil)
}
