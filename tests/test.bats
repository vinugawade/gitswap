#!/usr/bin/env bats

# Setup and teardown functions
setup() {
  set -eu -o pipefail
  initialize_environment
  prepare_test_data
}

initialize_environment() {
  # Set up necessary environment variables for the test
  export GIT_USER_FILE="$HOME/.git-user"
  export gitswap="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )/../gitswap"

  mkdir -p "$BATS_TMPDIR"
  touch "$GIT_USER_FILE"
  chmod 600 "$GIT_USER_FILE"

  # Check if ~/.gitconfig exists before backing it up
  if [[ -f "$HOME/.gitconfig" ]]; then
    cp "$HOME/.gitconfig" "$HOME/.gitconfig.bak"
  else
    echo "No .gitconfig found, proceeding without backup"
  fi

  # Set up gitswap binary
  cp $gitswap /usr/local/bin/gitswap
  chmod +x /usr/local/bin/gitswap
}

prepare_test_data() {
  # Clean up any previous test data
  echo "🧹 Cleaning up previous test data..." >&3
  rm -f "$GIT_USER_FILE"
}

# Teardown function
teardown() {
  set -eu -o pipefail
  mv ~/.gitconfig.bak ~/.gitconfig
  rm -f "$GIT_USER_FILE"
  rm -f /usr/local/bin/gitswap
}

# Test for listing, adding, and showing users
@test "List, add, and show users" {
  run bash $gitswap
  [ "$status" -eq 0 ]
  echo -e "\n👤 List users output:\n$output" >&3
  [[ "$output" == *"No Git users available."* ]]

  run bash $gitswap "Test User" "test@example.com"
  [ "$status" -eq 0 ]
  echo -e "\n✅ User added output:\n$output" >&3
  [[ "$output" == *"Switched to user: Test User <test@example.com>"* ]]

  run bash $gitswap --show
  [ "$status" -eq 0 ]
  echo -e "\n📋 Current user output:\n$output" >&3
  [[ "$output" == *"Current Git user: Test User <test@example.com>"* ]]

  run bash $gitswap
  [ "$status" -eq 0 ]
  echo -e "\n👥 Users listed:\n$output" >&3
  [[ "$output" == *"user.name=Test User,user.email=test@example.com"* ]]
}

# Test for switching and dynamically adding users
@test "Switch and dynamically add users" {
  echo "user.name=Existing User,user.email=existing@example.com" >> "$GIT_USER_FILE" >&3

  run bash $gitswap "Existing User" "existing@example.com"
  [ "$status" -eq 0 ]
  echo -e "\n🔄 Switched to existing user output:\n$output" >&3
  [[ "$output" == *"Switched to user: Existing User <existing@example.com>"* ]]

  run bash $gitswap "New User" "new@example.com"
  [ "$status" -eq 0 ]
  echo -e "\n➕ New user added output:\n$output" >&3
  [[ "$output" == *"User New User <new@example.com> not found. Adding to the list."* ]]
  [[ "$output" == *"Switched to user: New User <new@example.com>"* ]]
}

# Test removing a user
@test "Remove users" {
  echo "user.name=Remove User,user.email=remove@example.com" >> "$GIT_USER_FILE"
  echo "user.name=Keep User,user.email=keep@example.com" >> "$GIT_USER_FILE"

  # Debug output before removal
  run cat "$GIT_USER_FILE"
  echo -e "\n🔍 Before removal:\n$output" >&3

  # Remove user 1
  run echo 1 | bash $gitswap --remove
  [ "$status" -eq 0 ] # Ensure the status is 0 (success)

  # Debug output after removal
  run cat "$GIT_USER_FILE"
  echo -e "\n✅ After removal:\n$output" >&3

  # Check that "Remove User" has been removed and "Keep User" remains
  ! grep -q "user.name=Remove User,user.email=remove@example.com" "$GIT_USER_FILE"
  grep -q "user.name=Keep User,user.email=keep@example.com" "$GIT_USER_FILE"
}
