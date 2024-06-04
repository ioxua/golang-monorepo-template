package main

import (
	"fmt"

	"github.com/gin-gonic/gin"
	"github.com/ioxua/golang-monorepo-template/packages/foo"
	"github.com/ioxua/golang-monorepo-template/packages/health"
)

func main() {
  fmt.Println("huuuge change here...")
	r := gin.Default()
	r.Use(gin.Recovery())
	r.GET("/health", health.Check("App One"))
	r.GET("/foo", foo.Foo("App One"))
	r.Run() // listen and serve on 0.0.0.0:8080
}
