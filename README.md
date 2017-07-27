
> WARNING: This project is in development, code may not run. Please wait until a released version is created.

# pr-project: Commands to streamline Phoenix Rising projects

These commands are to help manage photography projects for [Phoenix Rising](http://www.sheisphoenixrising.com/).

# Installation

First step is to install [Git](https://git-scm.com/downloads). Then to install
these programs, open up a terminal and run these commands:

```bash
# download pr-projects
git clone https://github.com/lwjohnst86/pr-project.git ~/pr-project 

# install it!
sh ~/pr-project/bin/pr_install.sh
```

# Usage

The following commands are found in the pr-projects program (with more detail 
about them in the next section)

- `pr_new_client`: Create a folder and file structure for a new client.
- `pr_selection_add_proof`: Add a watermark to the photos to indicate they are
proofs before sending to client for them to choose their picks.
- `pr_move_to_choice`: Move the clients chosen photos into the `Photos/choice/raw/` folder.
- `pr_choice_add_logo_*` range of commands: Add the logo of the company to the
`bottom_right`, `bottom_left`, `top_right`, and `top_left` corners of the chosen
photos.
- `pr_move_to_branding`: Move the photographers chosen photos (from the
`choice/` or `selection/` photos) into the master company folder for
branding/marketing purposes. <!-- TODO confirm this -->
- `pr_client_finished`: Once the contract has been completed, package and
compress the client folder to archive.

Commands to update the pr-project program, just run this command!

```bash
pr_update_program
```

## More details about use

For any new client, you'll want to run the `pr_new_client` command. This will 
create a new folder with the following folders and files:

## How your new project will look like

This is how the new project folders and files will look like.

```
JimmyTimmy/
├── Documents/
└── Photos/
    ├── client-choice/
    │   ├── full-res/
    │   ├── raw/
    │   │   ├── bottom-left/
    │   │   ├── bottom-right/
    │   │   ├── top-left/
    │   │   └── top-right/
    │   ├── with-logo/
    │   │   ├── bottom-left/
    │   │   ├── bottom-right/
    │   │   ├── top-left/
    │   │   └── top-right/
    │   ├── photo-numbers-for-branding.txt
    │   └── photo-numbers-from-selection.txt
    └── photographer-selection/
        ├── logo/
        ├── proofs/
        └── raw/
```

<!-- use: tree filepath/ -avFn --dirsfirst > file_structure.txt -->
