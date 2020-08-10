# Continuous deployment

## Continuous integration
**Triggers**
- Pushing to the development branch

**Job**
- Testing that development changes don't break the rest of the code
- E.g. image insertion may break other code
	- Tests then automatically run and make sure code still works

**Restricts build**
- Jenkins restricts build to specific node
- sparta-ubuntu-node leads to code not running in Jenkins
