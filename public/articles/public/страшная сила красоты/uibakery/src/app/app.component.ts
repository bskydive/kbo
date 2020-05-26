import { Component } from '@angular/core';
import { BkLayout } from '@uibakery/kit';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {

  defaultLayout: BkLayout = {
    header: true,
    headerFixed: false,
    sidebar: false,
    sidebarFixed: false
  };

}
