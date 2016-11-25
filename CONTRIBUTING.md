# Contributing

## Before each push
I'd appreciate it if you ran the following commands before each push (And fix any problems found):
```bash
# Run test suite
rspec
# Check for style
rubocop
```
**If you added a gem:**
```bash
# Check the Gemfile for vulnerable gems
bundle-audit check --update
```
**If you added anything clients directly access:**
```bash
# Check for possible security issues
brakeman -A
```

## After each pull
After pulling other's changes it would be a good idea to run these commands:
```bash
# Install any new gems
bundle install
# Update the database schema
rails db:migrate
```

## Adding a feature
Most features should follow the procedures outlined below.

### Main steps
1. Adding a model
2. Adding abilties for that model
3. Adding a controller for that model
4. Adding views

### Adding a model
To add a model, you first should generate the necessary files.
```bash
rails g model Example name:string description:text
```
You then need to write the rspec tests and validations for that model. See previous models for an example.

### Adding abilities
This project uses the CanCanCan gem for authorization. Therefore, authorization data is stored in the abilities model. Go there and record what users can do with your model. In addition, add some tests for what you added to the User's model's spec.

### Adding a controller
First, generate the controller:
```bash
rails g controller ExamplesContoller
```
Then, add your controller and some tests for that controller. Examples can be seen on existing controllers. Don't forgot to also add a route in `config/routes.rb` for your controller.

### Adding views
Finally, you should add some views. Because this is an API, views use the JBuilder gem to help build JSON. Views should take into account the permissions of a user if applicable.

## How to contribute
If you're confident in your code, feel free to commit directly to develop on this repository. However, if you're newer to Ruby on Rails, or want to get your code checked out (Which there is **no** shame in doing, and I'll likely even do myself), feel free to open a pull request instead. I or one of the other contributers will check out your changes and suggest any changes that should be made.

## Tips
These are tips I've learned through my time working in Rails. They aren't in a particular order, maybe I'll organize them some day, but that day probably isn't today.

Please remember, **all code pushed to the develop branch is considered production ready**. If you aren't ready to put it on a production server *right now*, then don't push it to develop. You can (and should) commit it locally, but don't share unfinished work on develop. Use a feature branch or your own repo instead!

Furthermore, ***NEVER EVER COMMIT DIRECTLY TO MASTER***. The master branch should only ever be touched by merging in develop through a git-flow release.

If you use [Atom](https://atom.io) then install the 'linter' and 'linter-rubocop' plugins. I also recommend changing the settings on linter to check only on save, rather than as you type.

When you're writing tests, use FactoryGirl literally everywhere. If you need an existing model use `FactoryGirl.create` and if you need data use `FactoryGirl.build`.

**Do not commit a production secret to the repo**. Use environment variables instead.

Test everything. While tests might seem useless, they are our only tool against technical debt and regression. Testing safeguards your code while still allowing others to edit it and add on to it.

Spread out logic. Don't put logic in the controller that should be in the view or model.

Only test what the controller does in a controller spec. Don't waste time testing CanCanCan functionality.
