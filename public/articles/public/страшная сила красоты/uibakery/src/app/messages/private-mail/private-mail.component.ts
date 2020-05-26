import { Component, OnInit, ChangeDetectionStrategy } from '@angular/core';

@Component({
  selector: 'app-private-mail',
  templateUrl: './private-mail.component.html',
  styleUrls: ['./private-mail.component.scss'],
  changeDetection: ChangeDetectionStrategy.OnPush
})
export class PrivateMailComponent implements OnInit {

  constructor() { }

  ngOnInit() {
  }

}
