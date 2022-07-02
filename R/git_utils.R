#' Cleanup Local Git Repo
#'
#' Prunes branches (removes them from list of remote branches) from your local repo that are removed in the remote (origin).
#' Deletes branches locally that have status "merged" (removes them from list of local branches).
#'
#' @examples
#' \dontrun{
#' git_cleanup_local()
#' }
#'
#' @export
git_cleanup_local <- function() {
  system("git remote prune origin")
  system("git branch --merged | grep -v \\* | xargs git branch -D")
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
