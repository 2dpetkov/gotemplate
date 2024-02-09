package service

import (
	"database/sql"
	"log"
	"net/http"
)

type Service struct {
	DB *sql.DB
}

func NewService(db *sql.DB) *Service {
	return &Service{DB: db}
}

func (s *Service) HandleRequest(w http.ResponseWriter, r *http.Request) {
	// Log request details
	log.Printf("Received request: %s %s from %s", r.Method, r.URL.Path, r.RemoteAddr)

	// Optionally, you can log more details about the request, like headers
	for name, values := range r.Header {
		// Loop over all values for the name.
		for _, value := range values {
			log.Printf("Header: %s: %s", name, value)
		}
	}

	// Return an HTTP 200 status to the client
	w.WriteHeader(http.StatusOK)
	w.Write([]byte("OK"))
}
