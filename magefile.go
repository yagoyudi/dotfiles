//go:build mage

package main

import (
	"github.com/carolynvs/magex/pkg"
	"github.com/magefile/mage/sh"
)

func chezmoiApply() error {
	return sh.RunV("chezmoi", "apply", "-v")
}

func rebuildNixos() error {
	if err := sh.RunV("sudo", "cp", "-r", "./nixos", "/etc"); err != nil {
		return err
	}
	return sh.RunV("sudo", "nixos-rebuild", "switch")
}

func Deploy() error {
	if err := chezmoiApply(); err != nil {
		return err
	}
	return rebuildNixos()
}

func EnsureMage() error {
	return pkg.EnsureMage("")
}
