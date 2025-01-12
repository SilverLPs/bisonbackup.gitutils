VAR_SOURCE=""
VAR_DESTINATION=""
VAR_USERNAME=""
VAR_PAT=""

for arg in "$@"; do
  case $arg in
    SOURCE=*)
      VAR_SOURCE="${arg#*=}"
      shift
      ;;
    DESTINATION=*)
      VAR_DESTINATION="$(realpath "${arg#*=}")"
      shift
      ;;
    USERNAME=*)
      VAR_USERNAME="${arg#*=}"
      shift
      ;;
    PAT=*)
      VAR_PAT="${arg#*=}"
      shift
      ;;
  esac
done

echo "MODULE INFO:"
echo
echo "Module:      bisonbackup.git.mirror"
echo "Path:        $(pwd)"
echo "SOURCE:      $VAR_SOURCE"
echo "DESTINATION: $VAR_DESTINATION"
echo "USERNAME:    $VAR_USERNAME"
if [[ -n "$VAR_PAT" ]]; then
  echo "PAT:         MD5=$(echo -n $VAR_PAT | md5sum | awk '{print $1}')"
else
  echo "PAT:         "
fi
echo

mirror_clone() {
  local repo_url=$1
  repo_name=$(basename "$repo_url" .git)
  if [[ -n "$VAR_USERNAME" && -n "$VAR_PAT" ]]; then
    repo_url=$(echo "$repo_url" | sed -E "s|https?://|https://$VAR_USERNAME@|")
  fi
  GIT_TERMINAL_PROMPT=0 git clone --mirror "$repo_url" "$VAR_DESTINATION"/"${repo_name}"
  echo "$repo_url"
}

if [[ -n "$VAR_USERNAME" && -n "$VAR_PAT" ]]; then
  export GIT_ASKPASS=$(mktemp)
  echo '#!/bin/bash' > "$GIT_ASKPASS"
  echo "echo \"$VAR_PAT\"" >> "$GIT_ASKPASS"
  chmod +x "$GIT_ASKPASS"
fi
if [[ "$VAR_SOURCE" =~ ^https?:// ]]; then
  echo "Detected a single repository URL"
  echo
  mirror_clone "$VAR_SOURCE"
else
  if [[ ! -f "$VAR_SOURCE" ]]; then
    echo "Error: SOURCE file does not exist" >&2
    unset GIT_ASKPASS
    exit 1
  fi
  echo "Detected a file, searching for repository URLs..."
  while IFS= read -r repo_url; do
    [[ -z "$repo_url" || "$repo_url" =~ ^# ]] && continue
    echo
    mirror_clone "$repo_url"
  done < "$VAR_SOURCE"
fi
rm -f "$GIT_ASKPASS"
unset GIT_ASKPASS

#ONLY HTTPS, CANT'T DO HTTP LINKS
