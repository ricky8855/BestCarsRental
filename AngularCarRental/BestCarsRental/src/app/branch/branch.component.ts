import { Component, OnInit } from '@angular/core';
import { BranchService } from './../shared/services/branch.service';
import { Branch } from './../shared/models/branch.model';
//import { BranchesListComponent } from '../branches-list/branches-list.component';
//import { MngBranchesComponent } from './../../mng-branches/mng-branches.component';

@Component({
    selector: 'app-branch',
    templateUrl: './branch.component.html',
    styleUrls: ['./branch.component.css']
})

export class BranchComponent implements OnInit {
    branch: Branch = new Branch();
    branchName: string;
    addedSuccess: boolean = false;

    constructor(private branchService: BranchService) { }

    ngOnInit() {
    }

    onSearchBranch() {
        let func: (a: Branch) => void = (a: Branch) => {
            this.branch = a;
        }
        this.branchService.getBranch(this.branchName, func);
    }

    onNewBranch() {
        this.addedSuccess = false;
        let func: (b: boolean) => void = (b: boolean) => {
            this.addedSuccess = b;
        }
        this.branchService.addBranch(this.branch, func);
        this.branchService.getBranches();;
    }

    onUpdateBranch() {
        this.addedSuccess = false;
        let func: (b: boolean) => void = (b: boolean) => {
            this.addedSuccess = b;
        }
        this.branchService.updateBranch(this.branch, func);
        this.branchService.getBranches();;
    }

    onResetBranch() {
        this.addedSuccess = false;
        this.branch = new Branch();
    }

}
