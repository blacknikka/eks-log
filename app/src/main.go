package main

import (
	"fmt"
	"io"
	"net/http"
)

func main() {
	defaultHandler := func(w http.ResponseWriter, _ *http.Request) {
		fmt.Println("default")
		io.WriteString(w, "default\n")
	}
	helloHandler := func(w http.ResponseWriter, _ *http.Request) {
		fmt.Println("hello")
		io.WriteString(w, "hello\n")
	}
	http.HandleFunc("/", defaultHandler)
	http.HandleFunc("/hello", helloHandler)

	listen := ":8080"
	fmt.Printf("listening: [%s]\n", listen)

	if err := http.ListenAndServe(listen, nil); err != nil {
		panic(err)
	}
}
