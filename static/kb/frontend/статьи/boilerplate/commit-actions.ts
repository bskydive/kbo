export class CommitActions {
    /*  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
    /*              TYPE DEFINITIONS                */
    /*  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
   static LOAD_COMMITS =           createType('[Commits List] Load Commits');
   static LOAD_COMMITS_SUCCESS =   createType('[Commits List API] Load Commits Succeeded');
   static LOAD_COMMITS_FAILURE =   createType('[Commits List API] Load Commits Failed');
    /*  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
    /*              ACTION CREATORS                 */
    /*  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
   static LoadCommits = createActionCreator<Pick<User, 'username'>>(CommitActions.LOAD_COMMITS);
   static LoadCommitsSuccess = createActionCreator<Commit[]>(CommitActions.LOAD_COMMITS_SUCCESS);
   static LoadCommitsFailure = createActionCreator<{}>(CommitActions.LOAD_COMMITS_FAILURE);
}