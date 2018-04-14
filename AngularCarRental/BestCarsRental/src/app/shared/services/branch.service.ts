import { Injectable } from '@angular/core';
import { Branch } from './../models/branch.model';
import { HttpClient } from '@angular/common/http';
import { WebApiUrl } from './web-api-url';

@Injectable()
export class BranchService {
    webApiUrl: WebApiUrl = new WebApiUrl();
    branchesList: Branch[];
    constructor(private myHttpClient: HttpClient) { }

    getBranches(): void {
        let func: (a: Array<Branch>) => void = (a: Array<Branch>) => {
            this.branchesList = a;
        }
        this.myHttpClient.get<Array<Branch>>(this.webApiUrl.url + "/api/branch/all")
            .subscribe(
            func
            );
    }

    getAllBranchesNames(callBack: (b: Array<string>) => void): void {
        this.myHttpClient.get<Array<string>>(this.webApiUrl.url + "/api/branch/names")
            .subscribe(
            callBack
            );
    }

    getBranch(branchName: string, callBack: (b: Branch) => void): void {
        this.myHttpClient.get<Branch>(this.webApiUrl.url + "/api/branch/" + branchName)
            .subscribe(
            callBack
            );
    }


    deleteBranch(branchName: string, callBack: (b: boolean) => void): void {
        this.myHttpClient.delete<boolean>(this.webApiUrl.url + "/api/branch/" + branchName)
            .subscribe(
            callBack
            );
    }

    addBranch(branch: Branch, callBack: (b: boolean) => void): void {
        this.myHttpClient.post<boolean>(this.webApiUrl.url + "/api/branch/add", branch)
            .subscribe(
            callBack
            );
    }


    updateBranch(branch: Branch, callBack: (b: boolean) => void): void {
        this.myHttpClient.put<boolean>(this.webApiUrl.url + "/api/branch/edit", branch)
            .subscribe(
            callBack
            );
    }
}