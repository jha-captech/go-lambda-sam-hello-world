package main

import (
	"fmt"
	"net/http"

	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
)

type (
	Response = events.APIGatewayProxyResponse
	Request  = events.APIGatewayProxyRequest
)

func handler(request Request) (Response, error) {
	fmt.Println("starting handler")
	return Response{
		Body:       "Hello world!",
		StatusCode: http.StatusOK,
	}, nil
}

func main() {
	fmt.Println("starting main")
	lambda.Start(handler)
}
