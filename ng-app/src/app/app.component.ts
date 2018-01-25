import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.sass']
})
export class AppComponent {
  public title: string = 'app works!';
  public url: string = 'http://localhost:6000/users/10';
  public output: string = '';

  constructor(private _http: HttpClient) {
  }

  public fetch(): void {
    this._http.get(this.url)
      .subscribe(data => {
        console.log(data);
        this.output = JSON.stringify(data, null, 4);
      });
  }
}
