package main

import (
	"net/http"

	"github.com/gorilla/mux"
	"github.com/ryutah/gae-structure-sample/gae"
)

func init() {
	r := mux.NewRouter()
	r.HandleFunc("/", gae.SayHello)
	http.Handle("/", r)
}
