#!/bin/bash

# This initialization script allows the Flatpak variant of Spotify to autostart on
# user login by removing SingletonSocket, SingletonLock and SingletonCookie files
# within the cache directory which determines if the Spotify app is running or not

find $HOME/.var/app/com.spotify.Client/cache/spotify/ -name 'Singleton*' -delete
