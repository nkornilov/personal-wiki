Extracting subproject (subfolder) to a separate repository .
 .  |Clone| the |old repository|
    |{lng:bash}
    |   git clone git@git.host.com/old-repo.git

    |Checkout| to the target |branch| (ex. `delopment`), delete other unnecessary
    |{lng:bash}
    | git checkout development
    | git branch | grep -v "development" | xargs git branch -D

    Switch the remote to a |new repository|, so as not to spoil the old one
    |{lng:bash}
    | git remote set-url origin git@git.host.com/new-sub-project-repo.git

    Clearing references to other |branches|
    |{lng:bash}
    | git fetch -p

    Select the folders that we want to leave and clean the |repository| 
    .   Works quite fast when we only want to extract one `folder`
        |{lng:bash}
        | git filter-branch --prune-empty --subdirectory-filter folder development

        May take a lot of time for multiple folders. However, `CTRL + C` can be interrupted without any consequences
        |{lng:bash}
        | git filter-branch --index-filter 'git rm --cached -qr --ignore-unmatch -- . && git reset -q $GIT_COMMIT -- folderOne folderTwo --tag-name-filter cat --prune-empty -- --all

        |More information|

        `git filter-branch` - allows to re-write history of |commits| with filters
        `--index-filter` - we inform that we will work with |commit| indexes the command in quotes is our filter that will be applied to each |commit| |#1|, 
                           it will delete all files except those specified after two minutes (or rather, it will silently delete everything, 
                           and then silently restore the specified ones)
        `--tag-name-filter cat` - if a |commit| has a |tag| it would be saved
        `--prune-empty` - removes |commits| that have become empty after applying filters
        `-- --all` - should work with all |branches| and |tags|

    Clean files that are not needed in the |repository|
    |{lng:bash}
    | git fetch -p
    | git reset HEAD . 
    | git clean -fd
    | git clean -fd |Not duplicated, requires two runs|
    | git gc

    Check that the |history| for the target directories is in place
    |{lng:bash}
    | git log

    |Push| to branch
    |{lng:bash}
    | git branch --unset-upstream
    | git push --set-upstream origin development

   
    |#1| Alternatively, you can work with a commit tree, in this case you will `checkout` for each subsequent commit to a temporary folder, which is a long time.


    |More information| 
    [https://manishearth.github.io/blog/2017/03/05/understanding-git-filter-branch/]
    [https://stackoverflow.com/a/17867910]
    [https://git-scm.com/docs/git-filter-branch]