#!/bin/bash
# File: scripts/install-hooks.sh
# This script is tracked by Git and shared with the team

echo "🔧 Installing commit message validation hooks..."

# Create the commit-msg hook
cat > .git/hooks/commit-msg << 'EOF'
#!/bin/bash

# Conventional commit pattern
conventional_pattern='^(feat|fix|docs|style|refactor|perf|test|build|ci|chore|revert)(\(.+\))?: .{1,50}'

# Read commit message
commit_message=$(cat "$1")

# Validate format
if ! echo "$commit_message" | grep -qE "$conventional_pattern"; then
    echo ""
    echo "❌ Commit message does not follow conventional commit format!"
    echo ""
    echo "Required format: <type>[optional scope]: <description>"
    echo ""
    echo "Valid types: feat, fix, docs, style, refactor, perf, test, build, ci, chore, revert"
    echo ""
    echo "Examples:"
    echo "  feat: add user authentication"
    echo "  fix(auth): resolve login issue"  
    echo "  docs: update README"
    echo ""
    echo "Your message: '$commit_message'"
    echo ""
    exit 1
fi

echo "✅ Commit message follows conventional format"
exit 0
EOF

# Create pre-push hook
cat > .git/hooks/pre-push << 'EOF'
#!/bin/bash

conventional_pattern='^(feat|fix|docs|style|refactor|perf|test|build|ci|chore|revert)(\(.+\))?: .+'

echo "🔍 Validating commit messages before push..."

while read local_ref local_sha remote_ref remote_sha; do
    if [ "$local_sha" != "0000000000000000000000000000000000000000" ]; then
        # Determine range
        if [ "$remote_sha" = "0000000000000000000000000000000000000000" ]; then
            range="$local_sha"
        else
            range="$remote_sha..$local_sha"
        fi
        
        # Check each commit
        invalid_commits=()
        while IFS= read -r commit; do
            message=$(git log --format=%s -n 1 "$commit")
            if ! echo "$message" | grep -qE "$conventional_pattern"; then
                invalid_commits+=("$commit: $message")
            fi
        done < <(git rev-list "$range")
        
        # Report invalid commits
        if [ ${#invalid_commits[@]} -gt 0 ]; then
            echo ""
            echo "❌ Push rejected! Invalid commit messages found:"
            echo ""
            for invalid in "${invalid_commits[@]}"; do
                echo "  $invalid"
            done
            echo ""
            echo "Please fix these commit messages and try again."
            echo ""
            exit 1
        fi
    fi
done

echo "✅ All commit messages are valid"
exit 0
EOF

# Make hooks executable
chmod +x .git/hooks/commit-msg
chmod +x .git/hooks/pre-push

echo "✅ Hooks installed successfully!"