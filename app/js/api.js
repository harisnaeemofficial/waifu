var request = require('request')
var jar = request.jar()
var headers = {
    'authority': 'anilist.co'
}
class Api {
    constructor() {
        this.endpoint = 'http://anime.waifu.ca'
        this.api_key = 'edc5f123313769de83a71e157758030b'
        this.language = 'en'
        this.is_init = false
    }
    init(cb) {
        //get cookies
        request({
            method: 'GET',
            url: 'https://anilist.co/browse/anime',
            jar: jar
        }, (error, response, body) => {
            headers['x-csrf-token'] = jar._jar.store.idx["anilist.co"]["/"]["XSRF-TOKEN"].value
            this.is_init = true
            cb()
        })
    }
    version() {
        return {
            version: '0.1'
        }
    }
    get_season_releases(cb) {
        this.make_request(
            'GET', 
            'https://anilist.co/api/browse/anime?sort=popularity-desc&year=2017&status=Currently%20Airing&season=Fall&airing_data=true',
            (data) => {
                cb(data)
            }
        )
    }
    make_request(method, url, cb) {
        if (!this.is_init) {
            this.init(()=>{
                request({
                    headers: headers,
                    jar: jar,
                    method: method,
                    url: url
                },  (error, response, body) => {
                        if (!error) {
                            cb(JSON.parse(body))
                        }
                    }
                )              
            })
        }else {
            request({
                headers: headers,
                jar: jar,
                method: method,
                url: url
            },  (error, response, body) => {
                    if (!error) {
                        cb(JSON.parse(body))
                    }
                }
            ) 
        }

    }
}
