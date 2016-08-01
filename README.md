# Rcdk - The Ruby Interface for the Chemistry Development Kit (CDK)
RCDK makes it possible to use the Chemistry Development Kit (CDK) from Ruby. [CDK](https://sourceforge.net/projects/cdk/) is a Java library for chemical informatics.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rcdk', :git => "https://github.com/HITS-SDBV/rcdk.git", :version => "v0.4.0"
```

And then execute:

    $ bundle install

## Usage

<pre>
require 'rubygems'
require_gem 'rcdk'
require 'rcdk/util'
mol = RCDK::Util::Lang.read_smiles 'c1ccccc1'
puts mol.getAtomCount # =>6
</pre>

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## development environment with vagrant

You can use the provided vagrant environment to develop in the project:
<pre>
git submodule update --init --recursive
cd vagrant
vagrant --extra-vars-file=../ansible_vars.yml --ansible-playbook=../ansible_site.yml --vmname=rcdk --cpus=2 --memory=4096 --nfs up
vagrant ssh
</pre>

If the provision process appears to be hanging (e.g. does not make progress) you can temrinate the process (Ctrl+C) and provision again:
<pre>
vagrant halt
vagrant --extra-vars-file=../ansible_vars.yml --ansible-playbook=../ansible_site.yml --vmname=rcdk --cpus=2 --memory=4096 --nfs up --provision
</pre>
This will restart the provisioning process - and ansible will take care of finishing unfinished steps.

<pre>
vagrant ssh
</pre>
You are in the virtual machine and you can find this project mounted in /project
You can start eclipse with
<pre>
cd /project # this is important to set the proper ruby version and GEM_HOME
~/sw/eclipse/4.5/eclipse/eclipse
</pre>

To shutdown (after logout) and resume use:
<pre>
vagrant halt
vagrant --vmname=rcdk --cpus=2 --memory=4096 --nfs up
</pre>

With every git pull, it might be necessary to update the submodule also; git status should show if it is necessary
also, since the roles might be installed from ansible-galaxy in new versions, the 'old' ones need to be removed
ansible-galaxy does not have a lock feature with versions yet
<pre>
git submodule update
rm -r -- vagrant/ansible/roles/*/
</pre>

#

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/HITS-SDBV/rcdk. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

CDK is distributed under the GNU LGPL version 2.1 (see 'LICENSE').
It contains bytecode from the following sources:
-Chemistry Development Kit (CDK), licensed under the LGPL: http://cdk.sf.net
-OPSIN, licensed under the Artistic License: http://sourceforge.net/projects/oscar3-chem/
-Structure-CDK, licensed under the LGPL: http://sf.net/projects/structure
