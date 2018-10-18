#!/bin/bash

allow='define("WP_ALLOW_MULTISITE", true );'


sed -i -E "s/\/\* That.+\*\//$allow/g" ./html/wp-config.php


