package main

import (
	"net/http"
	"path/filepath"

	"github.com/spf13/viper"
)

func getPathInDataDir(path string) string {
	cleanedPath := filepath.Clean(path)
	return filepath.Join(viper.GetString("dataDir") + cleanedPath)
}

func streamFile(w http.ResponseWriter, r *http.Request) {
	path := getPathInDataDir(r.URL.Path[7:])
	http.ServeFile(w, r, path)
}