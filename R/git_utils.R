#' Cleanup Local Git Repo
#'
#' Prunes branches (removes them from list of remote branches) from your local repo that are removed in the remote (origin).
#' Deletes branches locally that have status "merged" (removes them from list of local branches).
#'
#' @param main_branch name of the master branch
#'
#' @examples
#' \dontrun{
#' git_cleanup_local()
#' }
#'
#' @export
git_cleanup_local <- function(main_branch = "main") {
  message("\nSwitching to main branch:")
  system(paste0("git checkout ", main_branch))
  Sys.sleep(.0005)
  # drop branches from remote list if they are no longer in the remote
  system("git remote prune origin")
  Sys.sleep(.0005)
  # list local branches
  message("\nThe following branches are local:")
  system("git branch -v")
  Sys.sleep(.0005)
  # list remote branches
  message("\nThe following branches are remote:")
  system("git branch -r")
  Sys.sleep(.0005)
  if(length(suppressWarnings(system("git branch --merged | grep -v \\*", intern = TRUE)))==0){
    message("\nThere was nothing to clean up.")
  } else {
    message("\nCleaning up:")
    # remove non-main local branches that have no commits
    system("git branch --merged | grep -v \\* | xargs git branch -D")
  }
}


#' Show Git Commit History
#'
#' Presents git commit history and where each branch is located.
#'
#' @examples
#' \dontrun{
#' git_commit_history()
#' }
#'
#' @export
git_commit_history <- function() {
  system("git log --decorate --graph --oneline")
}
