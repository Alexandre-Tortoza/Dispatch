# Dispatch

Dispatch is a portfolio project focused on building a logistics system with Laravel while demonstrating backend software engineering practices in a product-like environment.

The project is intentionally developed incrementally. The goal is not only to implement logistics features, but also to make the engineering process visible through architecture, tests, documentation, observability, security, CI/CD, versioning, and delivery practices.

## Status

Dispatch is currently in its repository and engineering-foundation phase. Application code and domain capabilities will be introduced in later milestones.

## Engineering direction

- Laravel as the primary application framework.
- Modular monolith as the initial architectural style.
- Small, reviewable, and frequently delivered changes.
- Automated tests and quality gates introduced progressively.
- Explicit repository governance and documented engineering decisions.
- CI/CD designed to support rapid promotion through development, staging, and production.
- Observability, security, and operational documentation added as the system evolves.
- Architectural complexity introduced only when justified by concrete requirements.

## Branches and environments

The repository is organized around three permanent branches:

- `dev`, integration branch for development work.
- `staging`, candidate branch for pre-production validation.
- `main`, production and release branch.

Detailed promotion and merge rules are documented separately as repository governance is established.

## Documentation

The documentation index is available in [`docs/README.md`](docs/README.md).

Contribution and repository-governance policies are introduced during the repository-foundation milestone and will be linked from this README as they become available.

## License

Dispatch is licensed under the [GNU Affero General Public License v3.0](LICENSE).
