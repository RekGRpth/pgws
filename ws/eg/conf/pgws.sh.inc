#!/usr/bin/env bash
#
# Copyright (c) 2010, 2012 Tender.Pro http://tender.pro.
# This file is part of PGWS - Postgresql WebServices.
#
# pgws.sh - PGWS control script

PGWS_ROOT=$PWD

# PGWS core setup

# Path to PGWS core dirs from project root
PGWS="pgws"

# Path to PGWS ws package from project root
PGWS_WS="ws"

# Path to PGWS ws package from project root
PGWS_DB="pg"

# List of installed PGWS core packages in install order
PGWS_PKG="pg ws"

# ------------------------------------------------------------------------------
# PGWS app setup

# Path to PGWS application packages
PGWS_APP="pkg"

# ------------------------------------------------------------------------------

# Directory of Postgresql binaries (psql, pg_dump, pg_restore)
# Empty if they are in search path
# Command to check: dirname "$(whereis -b psql)"
PG_BINDIR=""

# ------------------------------------------------------------------------------
[[ "$1" == "noop" ]] && exit
. $PGWS_ROOT/$PGWS/$PGWS_WS/bin/pgwsctl.sh "$@"
