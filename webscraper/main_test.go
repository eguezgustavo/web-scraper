package main

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestGreetingsFunctionReturnsTheHelloWorldString(t *testing.T) {
	result := greetings()

	assert.Equal(t, result, "hello world")
}
