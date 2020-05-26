import { Component, OnInit, ChangeDetectionStrategy } from '@angular/core';

@Component({
  selector: 'app-updates',
  templateUrl: './updates.component.html',
  styleUrls: ['./updates.component.scss'],
  changeDetection: ChangeDetectionStrategy.OnPush
})
export class UpdatesComponent implements OnInit {

  constructor() { }

  ngOnInit() {
  }

}
