# containers.core

Creates a devcontainer with various tools preinstalled like python, node, dotnet, pulumi kubectl, and AI tools like claude code and codex.  Published container is available at: https://hub.docker.com/repository/docker/spritelydev/core-devcontainer

## Testing

### Automated tests

To run tests execute the following:

```bash
bats ./tests/
```

The script checks if developer tools are present and environment configuration is correct.
