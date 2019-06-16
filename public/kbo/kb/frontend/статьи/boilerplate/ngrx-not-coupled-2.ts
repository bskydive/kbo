import { CommitActions } from '../domain/commit-actions';
@Component({
   selector: 'commits-container',
   templateUrl: './commits.container.html',
   styleUrls: ['./commits.container.scss'],
   changeDetection: ChangeDetectionStrategy.OnPush
})
export class CommitsContainer implements OnInit {
   commits: Observable<Commit[]>;
     
   constructor(private commitActions: CommitActions) {
      this.commitActions.loadCommits({username: 'christian'});
   }
}