#!/bin/bash
content="${1}"
while IFS= read -r -d '' file; do
    if ! grep -qE '([{]{2}|[}]{2})' "${file}"; then
        continue
    fi
    if ! grep -qE '([{]{1}% raw %[}]{1}|[[{]{1}% endraw %[}]{1})' "${file}"; then
        echo -e "Appending Jekyll escape tags to ${file}"
        sed --in-place --regexp-extended --expression '2i{% raw %}' --expression '$a{% endraw %}' "${file}"
        fixes=1
    fi
done < <(find "${content}" -type f -print0)

if [[ -z "${fixes}" ]]; then
    echo -e "Jekyll's escape tags already are in place."
fi
