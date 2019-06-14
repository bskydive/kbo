// Selectors - Pure Functions
export const commitsSelector = (state: AppState) => state.commits.commits;

@Injectable()
export class CommitSelectors {
    constructor(private store: Store<any>) {}

    selectCommits(): Observable<Commit[]> {
        return this.store.select(commitsSelector);
    }
}