
> WARNING: This project is in development, code may not run. Please wait until a released version is created.

# pr-project: Commands to streamline Phoenix Rising projects

These commands are to help manage photography projects for [Phoenix Rising](http://www.sheisphoenixrising.com/).

# Installation

First step is to install [Git](https://git-scm.com/downloads). Then to install
these programs, open up a terminal and run these commands:

```bash
# Download pr-projects
git clone https://github.com/lwjohnst86/pr-project.git ~/pr-project 

# install it!
sh ~/pr-project/bin/pr_install.sh
```

Next, set up the configuration file. Open it by running this command for Mac OSX:

```bash
open -e ~/.pr_config.txt
```

Or in Linux:

```bash
nano ~/.pr_config.txt
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

```
JimmyTimmy/
├── Documents/
│   ├── Contract.docx
│   ├── Model-Release-Form.docx
│   └── Visioning.txt
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
    │   ├── photo-numbers-for-branding.csv
    │   └── photo-numbers-from-selection.csv
    ├── logo/
    │   └── logo.png
    ├── photographer-selection/
    │   ├── proofs/
    │   └── raw/
    └── raw/

```
<!-- use: tree filepath/ -avFn --dirsfirst > file_structure.txt -->

Next you would use the command `pr_move_to_choice path/to/JimmyTimmy`. I would 
recommend in the terminal to first run this command:

```bash
cd path/to/ClientName/
```

Then you can run all of the commands using simply `./`. For instance:

```bash
pr_move_to_choice ./
```

This command takes the photo numbers the client has chosen (found in the
`photo-numbers-from-selection.csv` file; each set of numbers must be separated
by a comma and on only one line).
