# Contributing

Thank you for your interest in contributing to this homelab configuration repository! Please read these guidelines carefully before making any changes.

## Code of Conduct

This repository is maintained as a personal homelab configuration. While we welcome contributions, please note that this project may have limitations:

- Some configurations are specific to personal hardware and use cases
- Not all features may be suitable for public or production environments
- Contributions should focus on improving maintainability, security, and best practices

## How to Contribute

### Reporting Issues

Before creating an issue, please search existing issues to avoid duplicates. When reporting a bug:

1. Describe the issue clearly with steps to reproduce
2. Include relevant configuration files or error messages
3. Specify your system/environment details if applicable

### Making Changes

#### Before Submitting a Pull Request

- **Run pre-commit hooks**: Ensure all git hooks pass before committing
  ```bash
  pre-commit run --all-files
  ```

- **Test locally**: If your change affects systems, test your modifications in a local environment first

- **Update documentation**: Add or update relevant documentation for new features

#### Submitting Changes

1. Fork and clone the repository
2. Create a feature branch with a descriptive name (e.g., `feature/add-certificate-renewal`)
3. Make your changes following the existing code style
4. Run pre-commit hooks and ensure tests pass
5. Submit a pull request with a clear description

### Code Style

- Format Nix code with `nixfmt`
- Format shell scripts with `prettier`
- Keep pull requests focused on a single purpose
- Update README.md for new features

### Security

- Never commit secrets or sensitive data
- Use sops to encrypt any secrets
- Run `gitleaks` before pushing changes
- Review your changes for potential security issues

## Architecture Overview

This repository is organized into three main sections:

### NixOS (`hosts/`)

- `modules/`: Shared NixOS modules usable across multiple hosts
- `servers/`: Server-specific configurations
- `workstations/`: Desktop and laptop configurations

### Kubernetes (`cluster/`)

- `base/`: Flux setup and root configuration
- `crds/`: Custom Resource Definitions
- `core/`: Infrastructure applications (cert-manager, metallb, etc.)
- `apps/`: Application deployments

### Provisioning (`provision/`)

- `ansible/`: Ansible playbooks and roles
- `scripts/`: Utility scripts
- `terraform/`: Infrastructure as Code for networking (OPNsense, libvirt)

## Git Workflow

### Pre-commit Hooks

This repository includes pre-commit hooks that run:

- `prettier` - Code formatting
- `gitleaks` - Secret detection
- Other safety checks as needed

**Do not disable these hooks.** They ensure configuration quality and security.

### Commit Messages

Use clear, concise commit messages:

```
feat: add support for certificate auto-renewal
fix: correct typo in network configuration
docs: update README with new installation steps
```

## Getting Help

- Check existing issues and documentation
- Look at previous pull requests for guidance
- Feel free to ask questions about specific configurations

## License

By contributing to this repository, you agree that your contributions will be licensed under the same license as the main repository (if applicable).

## Notes

This repository is designed for personal use and may contain:

- Hardcoded values specific to this homelab
- References to personal services and endpoints
- Experimental configurations

If you plan to use this for your own homelab, consider:

- Customizing configurations to your needs
- Reviewing and updating secrets
- Testing all configurations in your environment first

Thank you for contributing to this project!
