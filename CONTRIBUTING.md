# Contribution Guidelines

## Commit messages

In general, commit messages should be written according to [Conventional Commits][convent-commits].

Be specially mindful of breaking changes, which WILL be used for versioning Docker
images, so **ANY** modification that causes incompatibility (>0.0.x) SHOULD be
specified in the commit subject, with the prefix `BREAKING CHANGE:` (multiple times, if needed).

[convent-commits]: https://www.conventionalcommits.org/en/v1.0.0/
[c-commits-braking]: https://www.conventionalcommits.org/en/v1.0.0/#commit-message-with-description-and-breaking-change-footer
