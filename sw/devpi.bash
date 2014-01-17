#!/usr/bin/env bash

source lib/config.bash

# Install devpi, the caching PyPi server. Instructions adapted from here:
# <http://doc.devpi.net/latest/quickstart-server.html>

# The devpi-server install is a little quirky. One has to first install the `devpi-server' package in order to run `devpi-server --gendeploy' to create a virtualenv with all the necessary tools. This virtualenv can then run more or less isolated from everything else. Just make sure you are in the correct virtualenv / on the correct version of Python before running this command.

readonly VENV_NAME=devpi

pip install devpi-server
if hash pyenv; then
	pyenv rehash
fi

cd $PREFIX
# Just throw this virtualenv in $PREFIX/usr (the seconary hierarchy)
[[ ! -d usr ]] && mkdir usr
cd usr

devpi-server --gendeploy "$VENV_NAME" --port 4040

# We can't make a hard or soft link because the devpi-ctl script relies on knowing from where it is run. Hack around it.
mkdir "$PREFIX/bin" # create if it doesn't exist
passthru_script_path="$PREFIX/bin/devpi-ctl"
cat <<EOF > "$passthru_script_path"
#!/usr/bin/env bash
exec '$PREFIX/usr/$VENV_NAME/bin/devpi-ctl' "\$@"
EOF
chmod +x "$passthru_script_path"

pip uninstall -y devpi-server
if hash pyenv; then
	pyenv rehash
fi
