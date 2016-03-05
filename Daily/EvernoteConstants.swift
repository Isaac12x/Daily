//
//  EvernoteConstants.swift
//  Daily
//
//  Created by Isaac Albets Ramonet on 25/02/16.
//  Copyright © 2016 IncorexEnterprise. All rights reserved.
//

extension EvernoteClient{

    // MARK: Errors
    
    
    // MARK: Componentes
    struct Components {
        static let Scheme = "https"
        static let Host = ""
        static let Path = ""
    }
    
    // MARK: Methods
    struct Methods {
        static let Session = ""
        static let Users = ""
    }
    
    let url = "https://sandbox.evernote.com/oauth?oauth_callback=http://www.foo.com&oauth_consumer_key=sample-api-key-4121&oauth_nonce=3166905818410889691&oauth_signature=T0+xCYjTiyz7GZiElg1uQaHGQ6I=&oauth_signature_method=HMAC-SHA1&oauth_timestamp=1429565574&oauth_version=1.0"
    
    struct Secrets{
        static let devToken = "https://www.evernote.com/shard/s163/notestore"
        static let consumerKey = "ialbetsram"
        static let consumerSecret = "b46c0bbfd6312a86"
    }
}

/*

todo:[true|false|*] - if the argument is "true", this will match notes that have ToDo checkboxes that are currently checked. If the argument is "false", this will match notes that have ToDo checkboxes that are not currently checked. If the argument is "*", this will match notes that have a ToDo checkbox of any type.


tag:cook*
Matches any note with a tag that starts with "cook"

updated:[datetime] - will match any note that has a 'updated' timestamp that is equal to, or more recent than, the provided datetime. (See Section C.2 for details on the legal format of the datetime argument.)

reminderOrder:[integer] - matches notes that have been marked as a reminder. The actual integer attribute value is used to order reminders relative to one another and is generally not useful in search. E.g.:

reminderOrder:*
Matches all notes that have been marked as a reminder
reminderTime:[datetime] - matches notes with a reminderTime attribute that is equal to or later than the argument datetime. reminderTime is the time at which the user has requested a reminder about the note. E.g.:

reminderTime:day
Matches all notes with a reminder set for today or later
reminderTime:day -reminderTime:day+7
Matches all notes with a reminder set for the next 7 days


Find notes containing the word "chicken", tagged with "cooking", and created this year:

chicken tag:cooking created:year

*/




