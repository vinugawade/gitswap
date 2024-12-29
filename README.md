# GitSwap - Manage Git Users Easily 🔄

![Linux](https://img.shields.io/badge/Linux-white?style=flat-square&logo=linux&logoColor=black)
![MacOS](https://img.shields.io/badge/MacOS-white?style=flat-square&logo=apple&logoColor=black)
![Bash](https://img.shields.io/badge/Bash-white?style=flat-square&logo=gnu-bash&logoColor=black)

![GitHub issues](https://img.shields.io/github/issues/vinugawade/gitswap?style=flat-square)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/vinugawade/gitswap?style=flat-square)
![GitHub last commit](https://img.shields.io/github/last-commit/vinugawade/gitswap?style=flat-square)

If you work with multiple Git users and need an easy way to switch between them, `gitswap` is the script for you. It allows you to list, add, remove, and switch Git users quickly on **Linux**, **MacOS**, and **Windows**.

---

## Installation 🚀

1. **Clone the Repository:**
    - Clone the [gitswap](https://github.com/vinugawade/gitswap) repository to your local machine using the following command:

    ```bash
    git clone https://github.com/vinugawade/gitswap.git
    ```

2. **Move the Script to a Global Location:**
    - Move the script to a global location on your system using the following command:

    ```bash
    sudo mv /location/of/gitswap /usr/local/bin
    ```

3. **Set Script Permissions:**
    - Allow everyone to execute the script by choosing one of the following commands:

    ```bash
    sudo chmod +x /location/of/gitswap
    ```

    OR

    ```bash
    sudo chmod 0755 /location/of/gitswap
    ```

4. **Add to $PATH:**
    - Add `/usr/local/bin` to your `$PATH`. If you use the Bash shell, execute the command:

    ```bash
    export PATH=$PATH:/usr/local/bin
    ```

    OR

    ```bash
    export PATH=$PATH:/location/of/gitswap
    ```

    This will set the variable name, potentially in a file like `~/.bash_profile`, `~/.bashrc`, or `~/.profile`. If you're unsure where to put it, `~/.bashrc` is a good choice.

> **You may need to restart your shell for this to take effect.**

---

## Script Options 🎛️

The `gitswap` script supports the following options:

- `--switch, -s`: Switch to a new or existing Git user.
- `--add, -a`: Add a new Git user to the list.
- `--remove, -r`: Remove a Git user from the list.
- `--show, -sh`: Display the current Git user configuration.

---

## Usage 🛠️

- **Switch User:**
  Switch to an existing Git user or add a new one if the user doesn't exist.

  ```bash
  gitswap "John Doe" "john.doe@example.com"
  ```

- **Add User:**
  Add a new Git user to the saved list.

  ```bash
  gitswap --add  # Prompts to add a new Git user to the list
  gitswap "Jane Doe" "jane.doe@example.com"  # Adds a new user if provided
  ```

- **Remove User:**
  Remove a Git user from the saved list.

  ```bash
  gitswap --remove  # Prompts to choose a user to remove
  ```

- **Show Current User:**
  Display the current Git user configuration.

  ```bash
  gitswap --show  # Displays the current Git user configuration
  ```

- **List Users:**
  If no arguments or options are provided, `gitswap` will list all saved Git users.

  ```bash
  gitswap  # Lists all saved Git users
  ```

---

## Features 🌟

- **Switch Users:** Easily switch between multiple Git users.
- **Add Users:** Add new Git users to the saved list.
- **Remove Users:** Remove users from the saved list.
- **Show Current User:** Quickly view the currently active Git user.
- **Auto-Add:** If no users are saved, the current Git user is automatically added to the list.

---

## Maintainer 👨🏻‍💻

<a href="https://vinux.in">
  <img
    src="https://api.daily.dev/devcards/c8457c6e687d407197d39cfaf513c57a.png?r=qqh"
    width="400"
    height=""
    alt="Vinay Gawade's Dev Card"
  />
</a>

Built With 💙✨ By <a href="https://github.com/vinugawade">Vinay Gawade</a>.

<a href="https://www.linkedin.com/in/vinu-gawade" target="_blank">
  <img
    src="https://github.com/vinugawade/vinugawade/blob/main/assets/images/media/LinkedIn.png?raw=true"
    alt="LinkedIn Logo"
    width="150"
    height=""
  />
</a>
<a href="https://www.buymeacoffee.com/vinaygawade" target="_blank">
  <img
    src="https://github.com/vinugawade/vinugawade/blob/main/assets/images/media/Bmc.png?raw=true"
    alt="Buy Me a Coffee Logo"
    width="150"
    height=""
  />
</a>
<a href="https://twitter.com/VinuGawade" target="_blank">
  <img
    src="https://github.com/vinugawade/vinugawade/blob/main/assets/images/media/Twitter.png?raw=true"
    alt="Twitter Logo"
    width="150"
    height=""
  />
</a>

---

## License 🛂

![LICENSE](https://img.shields.io/github/license/vinugawade/gitswap?style=flat-square)

This project is licensed under the [LICENSE](LICENSE) file associated with this repository.
