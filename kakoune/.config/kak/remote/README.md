Kakoune configuration

# Manually managed packages
Everything that can be managed directly is managed through kjp. For repos that contain more code than I want, clone here in ./remote and complete symlinking as needed.

### anhsirk0/kakoune-themes
codeberg; github mirror

```sh
cd ~/.local/share/repos/
git clone https://codeberg.org/anhsirk0/kakoune-themes.git
ln -s ~/.local/share/repos/kakoune-themes/colors ~/.config/kak/colors/remote/kakoune-themes
```
