//go:build mage

package main

import (
	"github.com/carolynvs/magex/pkg"
	"github.com/magefile/mage/sh"
)

func Deploy() error {
	if err := sh.RunV("chezmoi", "apply", "-v"); err != nil {
		return err
	}

	if err := sh.RunV("sudo", "nixos-rebuild", "switch"); err != nil {
		return err
	}

	return nil
}

func EnsureMage() error {
	return pkg.EnsureMage("")
}
