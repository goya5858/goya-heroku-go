package main

import (
	"net/http"
	"os"

	"github.com/labstack/echo"
)

func main() {
	e := echo.New()
	e.GET("/", func(c echo.Context) error {
		return c.String(http.StatusOK, "Hello, 世界")
	})
	e.Logger.Fatal(e.Start(":" + os.Getenv("PORT")))
}
