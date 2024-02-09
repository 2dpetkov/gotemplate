package main

import (
	"fmt"
	"gotemplate/pkg/db"
	"gotemplate/pkg/service"
	"log"
	"net/http"
)

func main() {
	// Initialize database connection
	database, err := db.InitDB()
	if err != nil {
		log.Fatalf("Could not set up database: %v", err)
	}
	defer database.Close()

	// Initialize service
	srv := service.NewService(database)

	// Example endpoint (adjust according to your needs)
	http.HandleFunc("/", srv.HandleRequest)

	// Start server
	fmt.Println("Starting server on port 8080...")
	if err := http.ListenAndServe(":8080", nil); err != nil {
		log.Fatalf("Failed to start server: %v", err)
	}
}
