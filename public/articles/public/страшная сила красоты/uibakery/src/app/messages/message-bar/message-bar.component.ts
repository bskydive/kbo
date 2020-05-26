import { Component, OnInit, ChangeDetectionStrategy } from '@angular/core';

@Component({
  selector: 'app-message-bar',
  templateUrl: './message-bar.component.html',
  styleUrls: ['./message-bar.component.scss'],
  changeDetection: ChangeDetectionStrategy.OnPush
})
export class MessageBarComponent implements OnInit {

  constructor() { }

  ngOnInit() {
  }

}
