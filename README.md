# 👾 bisonbackup.gitutils
BisonBackup modules for interacting with Git repositories

*Can't name the pack just ".git" cuz thats the suffix of every Git repo...*

This module package is a part of the BisonBackup project. For more information about the project and detailed usage instructions, please refer to the [project site](https://github.com/SilverLPs/BisonBackup).

---

## Requirements
This package relies on the following software:
- git

Before using the modules in this package, please ensure that the listed software and all its dependencies are installed and available on your system.

---

## Modules
Below is a list of all modules currently included in this package, along with their respective parameters:

**mirror** - Mirrors an entire Git repository via HTTPS, including all its contents.
- SOURCE = The URL of the remote repository. Example: "https://github.com/SilverLPs/BisonBackup.git"
- DESTINATION = The local path where the mirrored repository will be saved.
- USERNAME = The username for authentication with the remote repository (optional).
- PAT = The password or personal access token (PAT) for authentication with the remote repository (optional).

---

## License and Disclaimer

This software is licensed under the MIT License. See [LICENSE](LICENSE) for more details.

### Disclaimer of Warranty and Responsibility

BisonBackup is a private project developed in my spare time. It is provided "as is" without any warranty of any kind, either expressed or implied. I cannot offer any guarantees regarding its functionality, security, or suitability for a specific purpose. Anyone using the software does so entirely at their own risk.

### Use at Your Own Risk

Users are encouraged to thoroughly review the scripts and modules before using them. The software, including BisonBackup itself and all associated modules, is intended for technically proficient users who understand the potential risks and can assess whether the software meets their requirements. If you are not confident in your technical ability to understand or review the code, I strongly advise against using this software.

### Recommendations for Technical Users

- Carefully review the provided scripts and configurations before running them.
- Test the software in a safe environment before applying it to critical data or systems. 
- Use the software only if you are comfortable with its functionality and limitations.

This project is not intended for non-technical users, and I explicitly discourage anyone without a strong technical understanding from using this software.
