import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { NbInputModule, NbCardModule, NbButtonModule, NbIconModule } from '@nebular/theme';

@NgModule({
  declarations: [],
  imports: [
    CommonModule,
    NbInputModule,
    NbCardModule,
    NbButtonModule,
    NbIconModule
  ],
  exports: [NbInputModule, NbCardModule, NbButtonModule, NbIconModule]
})
export class SharedModule { }
