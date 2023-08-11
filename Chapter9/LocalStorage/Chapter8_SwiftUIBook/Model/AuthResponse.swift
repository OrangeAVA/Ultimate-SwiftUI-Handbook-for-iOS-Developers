
//
//  Created by James Thang on 09/01/2022.
//

import Foundation

struct AuthResponse: Codable {
    let access_token: String
    let token_type: String
    let scope: String
    let created_at: Int
}




