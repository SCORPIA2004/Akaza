import { Component, Input } from '@angular/core';

@Component({
  selector: 'app-square',
  template: `
  <button>{{ value }}</button>
  `,
  styleUrls: ['./square.component.scss'],
})
export class SquareComponent {
  @Input() value: '❌' | '⭕';
  
}
