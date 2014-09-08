# Anchorcms cookbook
A chef cookbook for [Anchorcms](http://www.anchorcms.com) testing.

**This is not ment for production deployments!**.

It uses php's built-in webserver which isn't suitable for any meaningful task except testing.
# Prerequisites
- You should have [Bundler](http://bundler.io) installed
- Also needed are Ruby (1.9+), [Virtualbox](http://www.virtualbox.org) and [Vagrant](http://www.vagrantup.com).

# Installation
- Clone this repository and `cd` into the created directory
- `$ bundle install`
- `$ bundle exec kitchen converge`

# Usage
Once the installation is complete you can access Anchorcms at

http://localhost:7000

The **password** for the **root** user is **root**. The name of the database is **anchor** (it's the default).
