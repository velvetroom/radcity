#!/bin/bash


build=$(($(git rev-list HEAD --count) + 1))
version=$(git describe --tags $(git rev-list --tags --max-count=1))

if [[ $version == *"."* ]]; then

    version_major_minor=${version%.*}
    version_major=${version_major_minor%.*}

    if [[ $version_major_minor == *"."* ]]; then

        version_minor=${version_major_minor##*.}

    else

        version_minor="0"
    fi
fi

new_version="$version_major.$version_minor.$build"

echo "Version: $new_version"
echo "Build: $build"
