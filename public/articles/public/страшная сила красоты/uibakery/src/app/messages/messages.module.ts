import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { MessagesRoutingModule } from './messages-routing.module';
import { MessagesComponent } from './messages.component';
import { MessageBarComponent } from './message-bar/message-bar.component';
import { WorkMailComponent } from './work-mail/work-mail.component';
import { PrivateMailComponent } from './private-mail/private-mail.component';
import { ContactsComponent } from './contacts/contacts.component';
import { UpdatesComponent } from './updates/updates.component';
import { MessageListComponent } from './message-list/message-list.component';
import { SharedModule } from '../shared/shared.module';

@NgModule({
  declarations: [MessagesComponent, MessageBarComponent, WorkMailComponent, PrivateMailComponent, ContactsComponent, UpdatesComponent, MessageListComponent],
  imports: [
    CommonModule,
    MessagesRoutingModule,
    SharedModule
  ]
})
export class MessagesModule { }
