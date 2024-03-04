#!/bin/bash

source $HOME/dotfiles/bin/utils.sh

u_header "Psql DBA Toolkit"

install() {
  mkdir -p ${HOME}/.config/psql/
  cp -fr ${HOME}/dotfiles/psql/config/psql/* ${HOME}/.config/psql/
  cp -fr ${HOME}/dotfiles/psql/config/.psqlrc ${HOME}/
  return $?
}

if [ ! -d ${HOME}/.config/psql ];
then
    u_bold_read "Press any key to continue the install process..."
    install
    RETVAL=$?
else
    u_warning "Psql already installed..."
    u_bold "Creating backup to reinstall..."
    mv -f ${HOME}/.config/psql ${HOME}/.config/psql_backup
    mv -f ${HOME}/.psqlrc ${HOME}/.psqlrc_backup

    u_bold_read "Press any key to continue the install process..."
    install
    RETVAL=$?
fi

u_success "Install finished"

exit ${RETVAL}
