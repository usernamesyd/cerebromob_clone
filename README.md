# Cerebro Mobile

## Introduction

Cerebro Mobile written in Dart/Flutter.

Introducing Cerebro Mobile, the mobile app for teachers and students.It's a comprehensive portal for school needs. Students can view profiles, announcements, classes, track dues, check grades, handle admissions, and request documents. Teachers access profiles, announcements, class lists, manage attendance, and grade encoding, fostering efficient communication and organization in education.

[Cerebro Mobile Application Documentation](https://docs.google.com/document/d/1gUO0kyhNNvAiqIzIlQAYlf03qvybv6Zl-vvz3mTQKt8/edit?usp=sharing)

## Getting Started

To run a development build in Android:
1. Make sure [Flutter](https://docs.flutter.dev/get-started/install) is installed.
2. Run `flutter doctor` and make sure that Android SDK is installed correctly.
3. Create an Android Emulator or connect an android phone via USB ADB. To check the device or emulator is connected, run `flutter devices` and make sure flutter can access your device.
4. Run `flutter run -v` to build and install the app. 

## Contributing
For cohesive and documented contributing, we will use the following workflow.

1. Create a **new issue** and format of the title must be the task category first and then the task name like this:
```TASK: Task Name```.
2. On the right side of the issue page, under the development, click `create a branch`.
3. Checkout the newly created branch.
4. Make [atomic](https://dev.to/samuelfaure/how-atomic-git-commits-dramatically-increased-my-productivity-and-will-increase-yours-too-4a84) changes. Don't commit a large changes. Break the commits into smaller pieces, this will make the code review easier.
5. Use [semantic commit messages](https://gist.github.com/joshbuchea/6f47e86d2510bce28f8e7f42ae84c716). Making a semantic commit message creates a clear description what type of changes in the commit. Here's the some of the types of commits you will encounter.

- `feat`: (new feature for the user, not a new feature for build script)
- `fix`: (bug fix for the user, not a fix to a build script)
- `docs`: (changes to the documentation)
- `style`: (formatting, missing semi colons, etc; no production code change)
- `refactor`: (refactoring production code, eg. renaming a variable)
- `test`: (adding missing tests, refactoring tests; no production code change)
- `chore`: (updating grunt tasks etc; no production code change)

6. After committing, push the changes and submit a [pull request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request).
7. Assign a reviewer for the pull request. When the reviewer agreed, he/she must `Accept changes`
8. Merge the changes to `dev` branch.
