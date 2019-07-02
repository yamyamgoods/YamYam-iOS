//
//  ViewController.swift
//  yamyam
//
//  Created by Jaeyoung Choi on 02/07/2019.
//  Copyright © 2019 Jaeyoung Choi. All rights reserved.
//

import UIKit
import KakaoOpenSDK

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func loginWithKakao(_ sender: Any) {
        //simpleAlert(title: "알림", message: "안드로이드와 동일한 테스트 환경을 위해 카카오톡 로그인은 현재 잠시 중단되어있습니다")
        //페이스북 열려있으면 닫기
        
        //이전 카카오톡 세션 열려있으면 닫기
        let session: KOSession = KOSession.shared();
        if session.isOpen() {
            session.close()
        }
        
        session.open(completionHandler: { (error) -> Void in
            if error == nil{
                if session.isOpen(){
                    //로그인 성공
                    let params : [String : Any] = ["access_token" : session.token.accessToken]
                    print("kakao access token is \(session.token.accessToken)")
                } else {
                    print("Login failed")
                }
            }else{
                print("Login error : \(String(describing: error))")
            }
            
            if !session.isOpen() {
                if let error = error as NSError? {
                    switch error.code {
                    case Int(KOErrorCancelled.rawValue):
                        break
                    default:
                        //간편 로그인 취소
                        print("error : \(error.description)")
                        
                    }
                }
            }
        })
    } //kakao login


}

