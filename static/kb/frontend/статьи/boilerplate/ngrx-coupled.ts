import { Store } from '@ngrx/store'; // <-- u are a bad habit :(
//
// CommitsContainer is holding a list of git commits of a given user
//
@Component({
   selector: 'commits-container',
   templateUrl: './commits.container.html',
   styleUrls: ['./commits.container.scss'],
   changeDetection: ChangeDetectionStrategy.OnPush
})
export class CommitsContainer {
   commits: Observable<Commit[]>;
   
   constructor(private store: Store<any>) {
      this.store.dispatch(new LoadCommitAction('christian'));
   }
}