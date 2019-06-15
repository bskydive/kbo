import { CommitCommands } from '../domain/commit-commands';

@Component({
   selector: 'commits-container',
   templateUrl: './commits.container.html',
   styleUrls: ['./commits.container.scss'],
   changeDetection: ChangeDetectionStrategy.OnPush
})
export class CommitsContainer implements OnInit {
   commits: Observable<Commit[]>;
     
   constructor(private commands: CommitCommands) {
      this.commands.loadCommits({username: 'christian'});
   }
}