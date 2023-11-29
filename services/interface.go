package services

import (
	"gofr.dev/pkg/gofr"
)

type OrderSvc interface {
	Get(ctx *gofr.Context, item string) (int, error)
}
