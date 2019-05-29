Add-PathVariable "${env:ProgramFiles}\nodejs"

# Add relative node_modules\.bin to PATH - this allows us to easily use local bin files and less things installed globally
Add-PathVariable '.\node_modules\.bin'

# git also provides tools like 'patch' which is used by snyk
Add-PathVariable "${env:ProgramFiles}\Git\usr\bin"

###### UNCERTAIN IF I WANT TO USE - COMMENTED OUT FOR NOW ######

# # yarn bin folder
# # Disabled until https://github.com/yarnpkg/yarn/issues/6318 is fixed
# #Add-PathVariable "${env:ProgramFiles(x86)}\Yarn\bin"
# #Add-PathVariable "${env:LOCALAPPDATA}\yarn\bin"

# # npm global bin folder
# Add-PathVariable ${env:APPDATA}\npm

# # Python is used to install binary node modules
# Add-PathVariable $HOME\.windows-build-tools\python27


# # $env:NODE_PATH = "${env:APPDATA}\npm"

# # We use a locally installed mocha rather than a global one
# # Scope private do we don't call mocha recursively (just in case there is one in path)
# function Private:mocha() {
# 	& node ..\..\node_modules\mocha\bin\mocha --ui tdd --bail --exit $args
# }

# # Scope private do we don't call yarn recursively!
# function Private:yarn() {
# 	$modifiedArgs = @()
# 	foreach ( $arg in $args ) {
# 		# yarn broke 'ls'
# 		if ( $arg -cmatch '^ls' ) {
# 			$arg = 'list'
# 		}
# 		$modifiedArgs += $arg
# 		# we're using a monorepo, and only add packages to
# 		# our workspace if we write them ourselves
# 		if ( $arg -cmatch 'add' ) {
# 			$modifiedArgs += '--ignore-workspace-root-check'
# 		}
# 	}
# 	& yarn $modifiedArgs
# }
