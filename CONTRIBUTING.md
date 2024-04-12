# Contribute
​
This article explains how to contribute to the GCP Landing Zone.
Please read through the following guidelines.
​
> **Note**: before participating in our community, please read our
> [code of conduct][coc].
> By interacting with this repository, organization, or community you agree to
> abide by its terms.
​
## Contributions
​
There’s several ways to contribute, not just by writing code.
If you have questions, see [support](https://github.com/ollionorg/gcp-landing-zone/blob/main/SUPPORT.md).
​
### Improve docs
​
As a user you’re perfect for helping us improve our docs.
Typo corrections, error fixes, better explanations, new examples, etcetera.
​
If you identified an inaccuracy please raise a documentation issue.
​
### Improve issues
​
Some issues lack information, aren’t reproducible, or are just incorrect.
You can help by trying to make them easier to resolve.
Existing issues might benefit from your unique experience or opinions.
Before creating bug reports, please check [here](https://github.com/ollionorg/gcp-landing-zone/issues) as you might find out that you don't need to create one. When you are creating a bug report, please [include as many details as possible](#how-do-i-submit-a-good-bug-report).

​
### Write code
​
Code contributions are very welcome.
It’s probably a good idea to first post a question or open an issue to report a
bug or suggest a new feature before creating a pull request.
​
## Submitting an issue
​
*   The issue tracker is for issues.
*   Search the issue tracker (including closed issues) before opening a new
    issue
*   Ensure you’re using the latest version of our packages
*   Use a clear and descriptive title
*   Include as much information as possible: steps to reproduce the issue,
    error message, version, operating system, etcetera
*   The more time you put into an issue, the better we will be able to help you
​
## Submitting a pull request
​
*   Run `terraform plan` and `terraform validate` locally to format, and test your changes
*   Non-trivial changes are often best discussed in an issue first, to prevent
    you from doing unnecessary work
*   For ambitious tasks, you should try to get your work in front of the
    community for feedback as soon as possible
*   New features should be accompanied by tests and documentation
*   Don’t include unrelated changes
*   Test before submitting code by running `terraform plan` and `terraform validate`
*   Write a convincing description of why we should land your pull request:
    it’s your job to convince us

## Styleguides

### Git Commit Messages

* Use the present tense ("Add feature" not "Added feature")
* Use the imperative mood ("Move cursor to..." not "Moves cursor to...")
* Limit the first line to 72 characters or less
* Reference issues and pull requests liberally after the first line
* Pull request title should be: <type>([optional scope]): <description>

```
          feat(ui): Add `Button` component
                ^    ^    ^
                |    |    |__ Subject
                |    |_______ Scope
                |____________ Type
```
**Type**  
 ```
build - Changes that affect the build system or external dependencies (dependencies update)
ci - Changes to our CI configuration files and scripts (basically directory .github/workflows)
docs - Documentation only changes
feat - A new feature
fix - A bug fix
chore - Changes which does not touch the code (ex. manual update of release notes). It will not generate release notes changes
refactor - A code change that contains refactor
style - Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
test - Adding missing tests or correcting existing tests and also changes for our test app
perf - A code change that improves performance (I do not think we will use it)
```
**Example**
```
feat: Add locales description command for ios and android 
fix: rate limit exceeded 
ci: Added leading V to version name 
refactor: config entities and arguments 
docs: Add secrets and vision doc 
build: Disable Auto Doc Generation 
test: added multi modules to test app 
chore: Release v20.08.1 
```

​
## Resources
​
*   [How to contribute to open source](https://opensource.guide/how-to-contribute/)
*   [Making your first contribution](https://medium.com/@vadimdemedes/making-your-first-contribution-de6576ddb190)
*   [Using pull requests](https://help.github.com/articles/about-pull-requests/)
*   [GitHub help](https://help.github.com)
*   [Ollion](https://ollion.com/)
​
## License
​
[Apache 2.0](https://www.apache.org/licenses/LICENSE-2.0)  
​
## Definitions
​
[license]: https://creativecommons.org/licenses/by/4.0/  
​
[author]: https://ollion.com/  
​
[coc]: https://github.com/remarkjs/.github/blob/main/code-of-conduct.md  
​
[support]: [support.md](https://github.com/ollionorg/gcp-landing-zone/blob/main/SUPPORT.md)  
​
[collective]: https://opencollective.com/unified  
