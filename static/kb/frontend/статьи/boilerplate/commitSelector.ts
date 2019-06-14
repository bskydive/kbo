@Injectable()
export class CommitSelectors {
    constructor(private store: Store<any>) {}

    selectUsername(): Observable<string> {
        return this.store.select(usernameSelector);
    }

    selectCommits(): Observable<Commit[]> {
        return this.store.select(commitsSelector);
    }
}