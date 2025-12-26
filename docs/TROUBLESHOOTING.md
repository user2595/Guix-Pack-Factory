# Troubleshooting

## Build takes a very long time

This is normal! `guix pack` can take several minutes, especially the first time.

Tip: `--cores=4` can help with the `guix pack` command (in `build-guix-image.sh`).

## "Command not found" im Container

Check whether the package is listed in `manifest.scm` and whether the package generates a binary.

## Symlink is not resolved

```bash
# Check in the container:
ls -la /workdir/guix-container-tools.tar.xz
file /workdir/guix-container-tools.tar.xz
```

### Docker image too large

Use `--compression=zstd` instead of `xz` for faster compression (but lower compression ratio).

## ðŸ“š Further resources

- [GNU Guix Manual](https://guix.gnu.org/manual/)
- [Guix Pack Documentation](https://guix.gnu.org/manual/en/html_node/Invoking-guix-pack.html)
- [Guile Hoot Documentation](https://files.spritely.institute/docs/guile-hoot/)
- [Docker Documentation](https://docs.docker.com/)