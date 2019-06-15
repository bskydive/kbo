// ActionCreator function
function LoadCommits(user: Pick<User, 'username'>): Action<string> {
  return {
      type: '[Commits Page] Load Commits',
      payload: user
  };
}

const user = new User('yanxch');

// within a container component where inject the ngrx store
this.store.dispatch(loadCommits(user));