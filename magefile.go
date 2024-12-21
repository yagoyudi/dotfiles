//go:build mage

package main

import (
	"github.com/carolynvs/magex/pkg"
	"github.com/magefile/mage/sh"
)

func Deploy() error {
	return sh.RunV("chezmoi", "apply", "-v")
}

func EnsureMage() error {
	return pkg.EnsureMage("")
}
