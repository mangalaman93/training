package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/ping", handlePing)
	http.ListenAndServe(":8080", nil)
}

func handlePing(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Pong\n")
}
