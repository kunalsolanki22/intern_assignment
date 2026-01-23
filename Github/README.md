
# Git Basics: Initialize, Commit, Branch, and Merge

## Initialize and Commit

### 1. Create a new project directory
```
mkdir my-project
cd my-project
```

---

### 2. Initialize Git repository

```
git init
```

---

### 3. Create a new file and add content

```
touch README.md
echo "My first Git project" > README.md
```


### 4. Check repository status

```
git status
```


### 5. Stage the file

```
git add README.md
```


### 6. Commit the changes

```
git commit -m "Add README file"
```

---

## Branching and Merging

### 1. Create and switch to a new branch

```
git checkout -b feature-branch
```



### 2. Make changes and commit on new branch

```
echo "Feature added" >> README.md
git add README.md
git commit -m "Add new feature"
```

### 3. Switch back to main branch

```
git checkout main
```


### 4. Merge feature branch into main

```
git merge feature-branch
```

### 5. Delete feature branch (optional)

```
git branch -d feature-branch
```

---

# Handling Merge Conflicts in Git 

---


A **merge conflict** occurs when two branches modify the same lines in the same file and Git cannot automatically determine which change to keep.

When this happens, Git stops the merge process and asks the developer to resolve the conflict manually.

---

## How to Create a Merge Conflict

### Step 1: Create a Base File

```bash
echo "Base version" > file.txt
git add file.txt
git commit -m "Base commit"
```
### Step 2: Create branch A and modify the file
```
git checkout -b branch-a
echo "Change from branch A" > file.txt
git commit -am "Change from A"
```
### Step 3: Create branch B and modify the same file
```
git checkout master
git checkout -b branch-b
echo "Change from branch B" > file.txt
git commit -am "Change from B"
```

### Step 4: Merge branches to create conflict
```
git checkout master
git merge branch-a
git merge branch-b
```

Git will stop and report a conflict.

## How to Resolve a Merge Conflict
### Step 1: Check conflicted files
```
git status
```

### Step 2: Open the conflicted file

You will see conflict markers like this:
```
<<<<<<< HEAD
Base version
=======
Change from branch A
>>>>>>> branch-a
```

### Step 3: Fix the conflict manually

Choose what you want to keep and remove all markers:

Base version
Change from branch A

### Step 4: Mark conflict as resolved
```
git add file.txt
```

### Step 5: Complete the merge
```
git commit -m "Resolved merge conflict"
```
---

# Git Undo Command Comparison

| Command            | Commit     | Staging | Working Dir | Safety Level |
|--------------------|------------|---------|-------------|--------------|
| `git checkout -- file` | ❌ | ❌ | reset | medium |
| `git revert` | new commit | ✔ | ✔ | safe |
| `git reset --soft` | removed | ✔ | ✔ | medium |
| `git reset` (mixed) | removed | ❌ | ✔ | medium |
| `git reset --hard` | removed | ❌ | ❌ | dangerous |

---

## When to Use What

### 1. If changes are **not committed**
```bash
git checkout -- file.txt
# or
git restore file.txt
```
Use this to discard local edits in working directory.

### 2. If changes are committed but **NOT pushed**
```
git reset --soft HEAD~1   # keep changes staged
git reset HEAD~1          # keep changes unstaged
git reset --hard HEAD~1   # delete changes completely
```

Use reset to rewrite local history.

### 3. If changes are **already pushed**
```
git revert <commit-id>
```  

Use revert to safely undo changes without breaking shared history.

---

# Interactive Rebasing

Interactive rebasing allows you to clean up, combine, reorder, or rename commits before pushing them to a remote repository.  
It is commonly used to maintain a clear and meaningful commit history.

### Command

```bash
git rebase -i HEAD~n
````

Replace `n` with the number of last commits you want to edit.

---

### Common Actions in Interactive Rebase

When the editor opens, you will see a list of commits like this:

```text
pick a1b2c3d First commit
pick d4e5f6g Second commit
pick h7i8j9k Third commit
```

You can change `pick` to one of the following:

* **pick** – keep the commit as is
* **reword** – rename the commit message
* **squash** – combine commit with the previous one
* **fixup** – combine without keeping the message
* **drop** – remove the commit

---

### Example: Squash Commits

```text
pick a1b2c3d Add login feature
squash d4e5f6g Fix login bug
```

This combines both commits into one.

---

### Finish Rebase

After saving and closing the editor:

```bash
git rebase --continue
```

---

### Important Notes

* Use interactive rebase **only on local commits** (not already pushed).
* Rebasing rewrites commit history.
* If something goes wrong, you can abort:

```bash
git rebase --abort
```

```
```
