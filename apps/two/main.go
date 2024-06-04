package main

import (
	"github.com/gin-gonic/gin"
	"github.com/ioxua/golang-monorepo-template/packages/health"
	"github.com/ioxua/golang-monorepo-template/packages/ping"
)

func main() {
	r := gin.Default()
	r.Use(gin.Recovery())
	r.GET("/", health.Check("App Two"))
	r.GET("/ping", ping.Ping("App One"))
	r.Run() // listen and serve on 0.0.0.0:8080
}
