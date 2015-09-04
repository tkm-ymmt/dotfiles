#!/bin/sh

git subtree pull --prefix=backend/ hant-backend master
git subtree pull --prefix=client/ hant-client master
git subtree pull --prefix=websocket/ hant-websocket master
