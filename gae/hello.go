package gae

import (
	"html/template"
	"net/http"
)

func SayHello(w http.ResponseWriter, r *http.Request) {
	t, err := template.ParseFiles("index.html")
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}
	if err := t.Execute(w, struct{ Body string }{Body: "Hello world!!"}); err != nil {
		http.Error(w, err.Error(), 500)
	}
}
