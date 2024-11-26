#!/usr/bin/env sh

echo "## Update global .gitignore file"
gibo update && gibo dump \
	Ansible \
	Archives \
	Backup \
	Diff \
	GPG \
	Linux \
	macOS \
	Mercurial \
	Terraform \
	Vagrant \
	Vim \
	VisualStudioCode \
	Windows \
	Xcode >~/.config/git/ignore
