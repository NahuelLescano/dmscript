#!/usr/bin/env bash

main() {
    # Get processes for current user, skip header line
    selected="$(ps --user "$USER" -o pid,comm,args --no-headers | \
        fzf --prompt='Search a process to kill > ' \
            --header='PID COMMAND ARGS' \
            --preview='echo {}' \
            --preview-window=down:3:wrap)"

    if [[ -n $selected ]]; then
        # Extract PID (first column)
        pid="$(echo "$selected" | awk '{print $1}')"
        process_name="$(echo "$selected" | awk '{print $2}')"
        
        answer="$(echo -e "No\nYes" | fzf --prompt="Kill process $process_name (PID: $pid)? > ")"

        if [[ $answer == "Yes" ]]; then
            if kill -TERM "$pid" 2>/dev/null; then
                echo "Process $process_name (PID: $pid) has been terminated."
                exit 0
            else
                echo "Failed to kill process $process_name (PID: $pid)."
                exit 1
            fi
        else
            echo "Program terminated."
            exit 1
        fi
    else
        echo "No process selected."
        exit 1
    fi
}

main
