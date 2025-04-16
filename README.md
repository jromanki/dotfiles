### dotfiles
##### 1. Organize Your Dotfiles

First, make sure your dotfiles are in a central location. For example, you might have a folder called ~/dotfiles:

mkdir ~/dotfiles

Then, put your configuration files in that directory, such as ~/.bashrc, ~/.tmux.conf, and files under ~/.config/:

mv ~/.bashrc ~/dotfiles/.bashrc
mv ~/.tmux.conf ~/dotfiles/.tmux.conf
mv ~/.config ~/dotfiles/.config

##### 2. Create the Symlink

Once you’ve moved your dotfiles to the ~/dotfiles directory, the next step is to create symlinks from your home directory (~/) back to the files in the ~/dotfiles directory. Here's how you can do that:
For .bashrc:

ln -s ~/dotfiles/.bashrc ~/.bashrc

This command creates a symbolic link (ln -s) from ~/.bashrc to ~/dotfiles/.bashrc.
For .tmux.conf:

ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

For .config directory:

Since ~/.config is a directory, we’ll symlink the whole directory:

ln -s ~/dotfiles/.config ~/.config

This will point ~/.config to the ~/dotfiles/.config directory, allowing you to manage all your application configurations in one place.

##### 3. Verify the Symlinks

You can verify the symlinks using the ls -l command. It should show the symbolic link pointing to the original file.

ls -l ~/.bashrc

Example output:

lrwxrwxrwx 1 user user 27 Jul  8 12:34 /home/user/.bashrc -> /home/user/dotfiles/.bashrc

This shows that ~/.bashrc is a symlink that points to ~/dotfiles/.bashrc.

# if .bashrc not empty add to existing .bashrc and make symboliclink to dotfiles/.bashrc as .bashrc.gitadditions
if [ -f "$HOME/.bashrc.gitadditions" ]; then
    source "$HOME/.bashrc.gitadditions"
fi
