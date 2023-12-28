package main

import "gofr.dev/pkg/gofr"

func main() {
	// initialize gofr object
	app := gofr.New()

	// register route greet
	app.GET("/greet", func(ctx *gofr.Context) (interface{}, error) {
		return "Hello World!", nil
	})

	app.Start()
}
