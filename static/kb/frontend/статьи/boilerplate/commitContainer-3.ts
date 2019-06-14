@Component({
    selector: 'commits-container',
    templateUrl: './commits.container.html',
    styleUrls: ['./commits.container.scss'],
    changeDetection: ChangeDetectionStrategy.OnPush
})
export class CommitsContainer implements OnInit, OnDestroy {
    username$: Observable<string>;
    commits$: Observable<Commit[]>;

    constructor(private actions: CommitActions,
                private selectors: CommitSelectors) {

        this.commits$ = this.selectors.selectCommits();
        this.username$ = this.selectors.selectUsername();

        this.username$
            .pipe(
                distinctUntilChanged(),
                untilComponentDestroyed(this)
            )
            .subscribe(username => {
                this.actions.loadCommits({ username });
            });
    }

    ngOnInit() {}

    ngOnDestroy() {}
}