@Component({
    selector: 'commits-container',
    templateUrl: './commits.container.html',
    styleUrls: ['./commits.container.scss'],
    changeDetection: ChangeDetectionStrategy.OnPush
})
export class CommitsContainer implements OnInit, OnDestroy {
    commits$: Observable<Commit[]>;

    constructor(private actions: CommitActions,
                private selectors: CommitSelectors) {

        this.actions.loadCommits({ username: 'yanxch' });
        this.commits$ = this.selectors.selectCommits();
    }
}