#!/bin/sh

# Minimal Maven Wrapper bootstrap script.

BASE_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd) || exit 1
WRAPPER_DIR="$BASE_DIR/.mvn/wrapper"
WRAPPER_JAR="$WRAPPER_DIR/maven-wrapper.jar"
WRAPPER_PROPERTIES="$WRAPPER_DIR/maven-wrapper.properties"

if [ -n "$JAVA_HOME" ]; then
  JAVACMD="$JAVA_HOME/bin/java"
else
  JAVACMD=$(command -v java 2>/dev/null)
fi

if [ ! -x "$JAVACMD" ]; then
  echo "Java executable not found. Set JAVA_HOME to a JDK 25 installation." >&2
  exit 1
fi

if [ ! -f "$WRAPPER_JAR" ]; then
  WRAPPER_URL=$(sed -n 's/^wrapperUrl=//p' "$WRAPPER_PROPERTIES")
  mkdir -p "$WRAPPER_DIR" || exit 1

  if command -v curl >/dev/null 2>&1; then
    curl -fsSL "$WRAPPER_URL" -o "$WRAPPER_JAR" || exit 1
  elif command -v wget >/dev/null 2>&1; then
    wget -q "$WRAPPER_URL" -O "$WRAPPER_JAR" || exit 1
  else
    echo "curl or wget is required to download Maven Wrapper." >&2
    exit 1
  fi
fi

# MAVEN_OPTS is intentionally expanded so callers can provide multiple JVM options.
# shellcheck disable=SC2086
exec "$JAVACMD" $MAVEN_OPTS \
  "-Dmaven.multiModuleProjectDirectory=$BASE_DIR" \
  -classpath "$WRAPPER_JAR" \
  org.apache.maven.wrapper.MavenWrapperMain "$@"
