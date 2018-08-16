# vagrant-cucumber-testing
Testing Vagrant VMs using Cucumber

## What is included
Note: currently no Vagrantfile provided and this repo provides examples of ui, http and mysql tests run on host machine against a running Vagrant VM.

## How it works
This is intended for running cucumber tests locally. Required gems for the tests are managed via Gemfile. Use bundler to install these. For the UI test, you also need to have Firefox installed and Mozilla geckodriver from https://github.com/mozilla/geckodriver/releases on your path. Then, you should be able to run the tests in feature folder. If you are not connecting to localdb, you need to update the file in features/step_definitions/mysql.rb with the correct parameters. Note: the VM should be running when running the tests. To run all tests, or a particular test, respectively: 
```
cucumber features/
cucumber features/ui.feature
```
