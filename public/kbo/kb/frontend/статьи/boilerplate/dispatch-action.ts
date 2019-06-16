import { Store } from '@ngrx/store'; 
import { CommitActions } from '../store/actions';

@Component({
   selector: 'commits-container',
   templateUrl: './commits.container.html',
   styleUrls: ['./commits.container.scss'],
   changeDetection: ChangeDetectionStrategy.OnPush
})
export class CommitsContainer {
   commits: Observable<Commit[]>;
   
   constructor(private store: Store<any>) {
      this.store.dispatch(CommitActions.LoadCommits({ username: 'christian' }));
   }
}