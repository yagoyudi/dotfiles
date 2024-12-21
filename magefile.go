//go:build mage

package main

import (
	"github.com/carolynvs/magex/pkg"
	"github.com/magefile/mage/sh"
)

var Aliases = map[string]any{
	"rn": RebuildNixos,
	"ca": ChezmoiApply,
}

func ChezmoiApply() error {
	return sh.RunV("chezmoi", "apply", "-v")
}

func RebuildNixos() error {
	if err := sh.RunV("sudo", "cp", "-r", "./nixos", "/etc"); err != nil {
		return err
	}
	return sh.RunV("sudo", "nixos-rebuild", "switch")
}

func Deploy() error {
	if err := ChezmoiApply(); err != nil {
		return err
	}
	return RebuildNixos()
}

func EnsureMage() error {
	return pkg.EnsureMage("")
}
