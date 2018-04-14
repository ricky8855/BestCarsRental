import { Component, OnInit } from '@angular/core';
import { BranchService } from './../shared/services/branch.service';
import { Branch } from './../shared/models/branch.model';
import { BranchComponent } from './../branch/branch.component';
//import { MngBranchesComponent } from './../../mng-branches/mng-branches.component';

@Component({
    selector: 'app-branches-list',
    templateUrl: './branches-list.component.html',
    styleUrls: ['./branches-list.component.css']
})
export class BranchesListComponent implements OnInit {

    deleteSuccess: boolean = false;

    constructor(private branchService: BranchService, private branchComponent: BranchComponent) { }

    ngOnInit() {
        this.branchService.getBranches();;
    }

    showForEdit(branch: Branch) {
        Object.assign(this.branchComponent.branch, branch);
    }

    onDeleteBranch(branchName: string) {
        this.deleteSuccess = false;
        let func: (b: boolean) => void = (b: boolean) => {
            this.deleteSuccess = b;
        }
        this.branchService.deleteBranch(branchName, func);
        this.branchService.getBranches();;
    }
}
