//
//  main.m
//  NSLTagger
//
//  Created by Munkhbat, Anujin on 12/18/18.
//  Copyright © 2018 Munkhbat, Anujin. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *results = [NSMutableArray arrayWithObject: @""];
        
        NSLinguisticTagger *tagger = [[NSLinguisticTagger alloc] initWithTagSchemes:@[NSLinguisticTagSchemeNameType, NSLinguisticTagSchemeLexicalClass] options:0];
        
        NSString *textBody = @"John's Gospel is rather different from the other three. Whether or not he knew them (or any one of them) continues to be debated. In any event, his witness to Jesus goes its own way, highlighting matters that in the other Gospels remain implicit and underdeveloped. The literary style of this witness of Jesus is also unique among the Gospels; here focus is on the John begins with the profound announcement that Jesus is thecreative Word of God who had become embodied (incarnated) as a human being to be the light of life for the world. After this comes the proclamation that this Jesus is the Son of God sent from the Father to finish the Father's work in the world (see 4:34 and note). God's own glory is made visible in him  14:9), and what he does glorifies the Father. In him the full grace and truth of God has shown itself. Strikingly, a series of claims on Jesus' lips echoes God's naming of himself in Ex 3:14, further strengthening the link between the Father and the Son (see 6:35; 8:12; 9:5; 10:7,9,14; 11:25; 14:6; 15:1,5). Jesus' words to Nicodemus nicely summarize this Gospel's central theme: For God so loved the world that he gave his one and only Son, that whoever believes in him shall not perish but have eternal life (3:16). Although a variety of motivations for the composition of John's Gospel have been posited by interpreters (such as to supplement the other Gospels, to combat some form of heresy, to oppose the continuing followers of John the Baptist), the author himself states his main purpose clearly in 20:31: that you may believe that Jesus is the Christ, the Son of God, and that by believing you may have life in his name.";
        
        [tagger setString:textBody];
        
        NSRange range = NSMakeRange(0, textBody.length);
        NSLinguisticTaggerOptions options = NSLinguisticTaggerOmitWhitespace | NSLinguisticTaggerOmitPunctuation | NSLinguisticTaggerJoinNames;
        
        NSArray* tags = @[NSLinguisticTagPersonalName, NSLinguisticTagPlaceName, NSLinguisticTagOrganizationName, NSLinguisticTagNoun];
        
        
//        [tagger enumerateTagsInRange:range unit:NSLinguisticTaggerUnitWord scheme:NSLinguisticTagSchemeLexicalClass
//            options:options
//            usingBlock:^(NSLinguisticTag  _Nullable tag, NSRange tokenRange, BOOL * _Nonnull stop)
//         {
//             if ([tags containsObject:tag]) {
//                 NSString *name = [textBody substringWithRange:tokenRange];
//                 if(![results containsObject:name])
//                     [results addObject:name];
//                 NSLog(@"tagger results: %@, %@", name, tag);
//             }
//        }];
        
        
        [tagger enumerateTagsInRange:range unit:NSLinguisticTaggerUnitWord scheme:NSLinguisticTagSchemeNameType
            options:options
            usingBlock:^(NSLinguisticTag  _Nullable tag, NSRange tokenRange, BOOL * _Nonnull stop)
         {
             if ([tags containsObject:tag]) {
                 NSString *name = [textBody substringWithRange:tokenRange];
                 
                 if(![results containsObject:name])
                     [results addObject:name];
                NSLog(@"tagger results: %@, %@", name, tag);
             }
         }];
        NSLog(@"Results: %@", results);
    }
    return 0;
}
