Lazy VIM Setup

This repository contains a comprehensive lazy VIM setup designed for optimal productivity. It includes configuration for various tools like ESLint, Prettier, Stylua, Git, and more to enhance your development experience.
Prerequisites

Before you begin, ensure you have the following software installed:

    Node.js (v16 or above)
    Git
    NPM
    Prettier
    ESLint
    Stylua

Installation

Follow the steps below to get your environment up and running:
1. Clone the Repository

Clone this repository to your local machine:

```
git clone https://github.com/mdnihal5/dotfiles.git
cd dotfiles
```

2. Install Node.js and NPM

Make sure you have Node.js and NPM installed globally. You can download them from here.

Install dependencies using npm:

``` 
npm install -g prettier eslint 
```

3. Install Git

If you don't have Git installed, you can install it by following the instructions here.
4. Install Prettier

Prettier is an opinionated code formatter. It can be installed globally via npm:

npm install -g prettier

5. Install ESLint

ESLint is a tool for identifying and reporting on patterns found in ECMAScript/JavaScript code. Install it globally:

npm install -g eslint

6. Install Stylua

Stylua is a Lua code formatter. Install it globally:

https://github.com/JohnnyMorganz/StyLua

7. Install VIM Plugins

This setup uses lazy.vim for plugin management. To install all the required plugins:

    Open your terminal and launch vim or nvim.
    Run the command:

:Lazy sync

This will install all the plugins specified in the lazy.vim configuration.
8. Setting Up VIM

Make sure your .vimrc or init.vim points to this repository's configuration file:

ln -s /path/to/dotfiles/vimrc ~/.vimrc

9. Configuring Git

Make sure you have your Git username and email configured:

```
git config --global user.name "Your Name"
git config --global user.email "your_email@example.com"
```
Usage

Once everything is installed, you can start using your VIM setup for coding, linting, formatting, and version control.
VIM Commands

    :Lazy sync - Syncs the plugins.
    :Eslint - Runs ESLint on the current project.
    :Prettier - Formats the current file using Prettier.
    :Stylua - Formats Lua files using Stylua.

Git Commands

    git add . - Add changes to the staging area.
    git commit -m "message" - Commit changes.
    git push - Push changes to the remote repository.

Troubleshooting

    Error when running plugins: Ensure you have the required dependencies installed and properly configured in your vimrc.
    Issues with formatting: Check the Prettier, ESLint, and Stylua configurations to ensure they match your project's needs.

License

This repository is licensed under the MIT License - see the LICENSE file for details.
