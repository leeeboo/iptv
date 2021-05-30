package main

import (
	"io/ioutil"
	"net/http"
	"net/url"
	"strings"
)

func main() {
	http.HandleFunc("/channel", channel)
	err := http.ListenAndServe(":8090", nil)

	if err != nil {
		panic(err)
	}
}

func channel(w http.ResponseWriter, r *http.Request) {

	source := r.URL.Query().Get("source")

	u, err := url.Parse(source)

	if err != nil {
		panic(err)
	}

	resp, err := http.Get(u.String())

	if err != nil {
		panic(err)
	}

	defer resp.Body.Close()
	body, err := ioutil.ReadAll(resp.Body)

	if err != nil {
		panic(err)
	}

	new := []byte(strings.ReplaceAll(string(body), "rtp://", "http://192.168.1.231:8012/rtp/"))

	_, err = w.Write(new)

	if err != nil {
		panic(err)
	}
}
