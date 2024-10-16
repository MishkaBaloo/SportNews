//
//  PreviewProvider.swift
//  SportNews
//
//  Created by Michael on 8/17/24.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    private init() { }
    
    let newsVM = NewsViewModel()
    let mySavedVM = MySavedViewModel()
    let entity = MySavedEntity()
 
    let news = NewsAPIDataModel( // mock data
        uri: "8283098620",
        lang: "eng",
        isDuplicate: false,
        date: "2024-08-20",
        time: "11:29:01",
        dateTime: "2024-08-20T11:29:01Z",
        dateTimePub: "2024-08-20T11:28:08Z",
        dataType: "news",
        url: "https://thechronicle.com.gh/renovated-tarkwa-na-aboso-stadium-handed-over-to-nsa/",
        title: "Renovated Tarkwa Na Aboso Stadium Handed Over To NSA - The Ghanaian Chronicle",
        body: "The renovated Tarkwa Na Aboso (TnA) football stadium has been handed over to the government of Ghana through the National Sports Authority (NSA).\n\nFinanced by Gold Fields Ghana Limited (GFGL) at a cost of $16.2 million, the stadium is part of the mining company's legacy project of creating value beyond mining for the people of Tarkwa.\n\nRehabilitation works on the TnA Stadium started in January 2020 and the significant investment by the Gold Fields Ghana Foundation (GFGF) has transformed the hitherto 400-seat football park into an 800-plus-seater world-class stadium, capable of hosting international matches.\n\nFacilities in the reconstructed stadium include a soccer pitch/field and FIFA standard stands (gold, white, blue and yellow).\n\nOthers are dressing rooms, offices, restrooms, parking areas, first aid treatment rooms, control, doping, media rooms, cafeterias, and shops.\n\nIt was a joyous day for the chiefs and people of Tarkwa, as they had long awaited the commissioning and handing over of the stadium, which was held on Friday, August 16, 2024.\n\nThe commission, which was performed by the Sports Minister, Mustapha Yussif, saw the Professional Footballers Association (PFA) play with Gold Fields staff, both at Damang and Trakwa. The PFA scored both Damang and Trakwa staff of GFGL.\n\nThen the climax of the day was a game between Medeamma and Asante Kotoko, which saw the stadium filled to capacity. Medeamma, the host team, defeated Kototo by 2 goals to 1.\n\nThe commissioning of the stadium saw a number of dignitaries, including politicians, traditional leaders and the clergy among others, lined up to grace the commissioning of the Gold Fields-financed football stadium.\n\nSports Minister Mustapha Yusif, Deputy Minister for Lands and Natural Resources, George Mireku Duker, Kobby Okyere Darko Mensah, Western Regional Minister, President of Ghana Footbal Association (GFA), Kurtz Okraku, Nana Adarkwa Bediako, Gyasehene of Apinto, amongst other traditional leaders, graced the commissioning.\n\nAs football tradition holds, the key of the stadium after commissioning was handed over to the Sports Minister, who later handed it over to the NSA. The facility would be maintained by both the NSA and the Municipal Assembly.\n\nMinister Mustapha Yussif, who was the Guest Speaker, after handing over the keys to the NSA, expressed hope and assured management of GFGL that the facility would be maintained well.\n\nHe admitted that management of facilities has become a challenge and maintaining the refurbished stadium would be a text case for the NSA.\n\nDescribing the facility as magnificent and historic, he said the completion of the project and subsequent handing over was a result of the power of cooperation and collaboration between the mining company and its host communities.\n\nThe facility, he said, would without doubt provide a platform for the youth to showcase their talents and skills in the area of sporting activities.\n\nThe Vice President of Gold Fields Eternal Affairs and president of the Ghana Chamber of Mines, Michael Akafia, indicated that the construction of the stadium would have a sporting impact given that the game of football has the potential of fostering social cohesion between communities.\n\n\"We decided on the investment after a comprehensive stakeholder consultative and engagement process with our host communities. The aim was also to provide a sustainable and environmentally friendly stadium for the people of Tarkwa and surrounding communities,\" he said.\n\nIt is expected to boost business activities, nurture young talent and facilitate the development of football in Ghana, including women's football,\" Akafia says.\n\nThe impact of the stadium, he added, aligned with Gold Fields' purpose of creating enduring value beyond mining.\n\nGiving background into how the idea of the stadium refurbishment was conceived, the interim managing director of GFGL, Elliot Twum, indicated that Gold Fields engaged and solicited ideas from the local communities to find out what projects were needed, and they settled on the TnA refurbishment.\n\nEnumerating the impact the stadium would have on the host communities, Elliot Twum indicated that under proper guidance, the stadium may be used as a venue for non-sporting social events to the extent that it could accommodate without negatively affecting the sporting facilities or usage.\n\nHe reiterated that the game of football has the potential of fostering social cohesion and peace between communities, which was a major reason why Gold Fields embarked on this project.\n\n\"This is not just an international standard stadium, but a facility built with material from sustainable sources and developed with an innovative legacy plan,\" Elliot said.\n\nHe added the intention was for a design capacity of 10,400 seats. However, \"to ensure we met safety standards and requirements for other facilities, seating capacity was reduced to a little over 8,000.\"\n\nThe MP for the area, George Mireku Duker, applauded the mining company for single-handedly financing the stadium refurbishment.\n\nHe admitted that transforming the TnA park underscored how Corporate Social responsibility (CSR) could be used to create a good impression in the minds of the people.\n\nThe legislator used the occasion to present citations to both GFGL and the former Vice President of GFGL West Africa, Alfred Baku.",
        image: "https://bunny-wp-pullzone-vufvp0bs6b.b-cdn.net/wp-content/uploads/2024/08/Sports-Minister-Mustapha-Yusif-receiving-the-keys-to-the-stadium.jpg"
    )
}
