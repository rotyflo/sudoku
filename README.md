# Sudoku

## Installation

### 0 - Install Ruby (if not yet installed)

**Step 1:**
```brew install rbenv```

**Step 2:**

if on pre-Catalina OS use:
```
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc
echo 'source ~/.bashrc' >> ~/.bash_profile
```
else use:
```
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(rbenv init -)"' >> ~/.zshrc
source ~/.zshrc
```

**Step 3:**
```
rbenv install 2.5.1
rbenv global 2.5.1
rbenv rehash
ruby -v # => 2.5.1
which ruby # => /Users/your-username/.rbenv/shims/ruby
```

### 1 - Download program

1. Download zip file

2. Open terminal

3. ```cd Downloads```

4. ```unzip sudoku-master.zip```

5. ```cd sudoku-master```

### 2 - Install dependencies
```gem install colorize```

### 3 - Run program
```ruby sudoku.rb```


## How to use
Value: n
Position: xy

**EXAMPLE**

To place a '2' in top right corner:
```
Value: 2
Position: 91
```
