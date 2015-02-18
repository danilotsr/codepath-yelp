//
//  DRFilterConstants.m
//  Yelp
//
//  Created by Danilo Resende on 2/17/15.
//  Copyright (c) 2015 CodePath. All rights reserved.
//

#import "DRFilterConstants.h"

@implementation DRFilterConstants

// TODO: avoid creating many objects for constants here, how to do a static const for an array?

+ (UIColor *)backgroundRedColor {
    return [UIColor colorWithRed:196/256.0 green:18/256.0 blue:0 alpha:1];
}

+ (NSString *)distanceKey {
    return @"radius_filter";
}

+ (NSString *)sortingKey {
    return @"sort";
}

+ (NSString *)categoryKey {
    return @"category_filter";
}

+ (NSString *)dealKey {
    return @"deals_filter";
}

+ (NSArray *)distanceValues {
    NSString *key = [self distanceKey];
     return @[
        @{@"name": @"Any", key: @40000},
        @{@"name": @"2 blocks", key: @300},
        @{@"name": @"6 blocks", key: @900},
        @{@"name": @"1 mile", key: @1600},
        @{@"name": @"5 miles", key: @8000},
    ];
}

+ (NSArray *)sortingValues {
    NSString *key = [self sortingKey];
    return @[
        @{@"name": @"Best Matched", key: @0},
        @{@"name": @"Distance", key: @1},
        @{@"name": @"Highest Rated", key: @2},
    ];
}

+ (NSArray *)categoryValues {
    NSString *key = [self categoryKey];
    return @[
        @{@"name" : @"Afghan", key: @"afghani" },
        @{@"name" : @"African", key: @"african" },
        @{@"name" : @"American, New", key: @"newamerican" },
        @{@"name" : @"American, Traditional", key: @"tradamerican" },
        @{@"name" : @"Arabian", key: @"arabian" },
        @{@"name" : @"Argentine", key: @"argentine" },
        @{@"name" : @"Armenian", key: @"armenian" },
        @{@"name" : @"Asian Fusion", key: @"asianfusion" },
        @{@"name" : @"Asturian", key: @"asturian" },
        @{@"name" : @"Australian", key: @"australian" },
        @{@"name" : @"Austrian", key: @"austrian" },
        @{@"name" : @"Baguettes", key: @"baguettes" },
        @{@"name" : @"Bangladeshi", key: @"bangladeshi" },
        @{@"name" : @"Barbeque", key: @"bbq" },
        @{@"name" : @"Basque", key: @"basque" },
        @{@"name" : @"Bavarian", key: @"bavarian" },
        @{@"name" : @"Beer Garden", key: @"beergarden" },
        @{@"name" : @"Beer Hall", key: @"beerhall" },
        @{@"name" : @"Beisl", key: @"beisl" },
        @{@"name" : @"Belgian", key: @"belgian" },
        @{@"name" : @"Bistros", key: @"bistros" },
        @{@"name" : @"Black Sea", key: @"blacksea" },
        @{@"name" : @"Brasseries", key: @"brasseries" },
        @{@"name" : @"Brazilian", key: @"brazilian" },
        @{@"name" : @"Breakfast & Brunch", key: @"breakfast_brunch" },
        @{@"name" : @"British", key: @"british" },
        @{@"name" : @"Buffets", key: @"buffets" },
        @{@"name" : @"Bulgarian", key: @"bulgarian" },
        @{@"name" : @"Burgers", key: @"burgers" },
        @{@"name" : @"Burmese", key: @"burmese" },
        @{@"name" : @"Cafes", key: @"cafes" },
        @{@"name" : @"Cafeteria", key: @"cafeteria" },
        @{@"name" : @"Cajun/Creole", key: @"cajun" },
        @{@"name" : @"Cambodian", key: @"cambodian" },
        @{@"name" : @"Canadian", key: @"New)" },
        @{@"name" : @"Canteen", key: @"canteen" },
        @{@"name" : @"Caribbean", key: @"caribbean" },
        @{@"name" : @"Catalan", key: @"catalan" },
        @{@"name" : @"Chech", key: @"chech" },
        @{@"name" : @"Cheesesteaks", key: @"cheesesteaks" },
        @{@"name" : @"Chicken Shop", key: @"chickenshop" },
        @{@"name" : @"Chicken Wings", key: @"chicken_wings" },
        @{@"name" : @"Chilean", key: @"chilean" },
        @{@"name" : @"Chinese", key: @"chinese" },
        @{@"name" : @"Comfort Food", key: @"comfortfood" },
        @{@"name" : @"Corsican", key: @"corsican" },
        @{@"name" : @"Creperies", key: @"creperies" },
        @{@"name" : @"Cuban", key: @"cuban" },
        @{@"name" : @"Curry Sausage", key: @"currysausage" },
        @{@"name" : @"Cypriot", key: @"cypriot" },
        @{@"name" : @"Czech", key: @"czech" },
        @{@"name" : @"Czech/Slovakian", key: @"czechslovakian" },
        @{@"name" : @"Danish", key: @"danish" },
        @{@"name" : @"Delis", key: @"delis" },
        @{@"name" : @"Diners", key: @"diners" },
        @{@"name" : @"Dumplings", key: @"dumplings" },
        @{@"name" : @"Eastern European", key: @"eastern_european" },
        @{@"name" : @"Ethiopian", key: @"ethiopian" },
        @{@"name" : @"Fast Food", key: @"hotdogs" },
        @{@"name" : @"Filipino", key: @"filipino" },
        @{@"name" : @"Fish & Chips", key: @"fishnchips" },
        @{@"name" : @"Fondue", key: @"fondue" },
        @{@"name" : @"Food Court", key: @"food_court" },
        @{@"name" : @"Food Stands", key: @"foodstands" },
        @{@"name" : @"French", key: @"french" },
        @{@"name" : @"French Southwest", key: @"sud_ouest" },
        @{@"name" : @"Galician", key: @"galician" },
        @{@"name" : @"Gastropubs", key: @"gastropubs" },
        @{@"name" : @"Georgian", key: @"georgian" },
        @{@"name" : @"German", key: @"german" },
        @{@"name" : @"Giblets", key: @"giblets" },
        @{@"name" : @"Gluten-Free", key: @"gluten_free" },
        @{@"name" : @"Greek", key: @"greek" },
        @{@"name" : @"Halal", key: @"halal" },
        @{@"name" : @"Hawaiian", key: @"hawaiian" },
        @{@"name" : @"Heuriger", key: @"heuriger" },
        @{@"name" : @"Himalayan/Nepalese", key: @"himalayan" },
        @{@"name" : @"Hong Kong Style Cafe", key: @"hkcafe" },
        @{@"name" : @"Hot Dogs", key: @"hotdog" },
        @{@"name" : @"Hot Pot", key: @"hotpot" },
        @{@"name" : @"Hungarian", key: @"hungarian" },
        @{@"name" : @"Iberian", key: @"iberian" },
        @{@"name" : @"Indian", key: @"indpak" },
        @{@"name" : @"Indonesian", key: @"indonesian" },
        @{@"name" : @"International", key: @"international" },
        @{@"name" : @"Irish", key: @"irish" },
        @{@"name" : @"Island Pub", key: @"island_pub" },
        @{@"name" : @"Israeli", key: @"israeli" },
        @{@"name" : @"Italian", key: @"italian" },
        @{@"name" : @"Japanese", key: @"japanese" },
        @{@"name" : @"Jewish", key: @"jewish" },
        @{@"name" : @"Kebab", key: @"kebab" },
        @{@"name" : @"Korean", key: @"korean" },
        @{@"name" : @"Kosher", key: @"kosher" },
        @{@"name" : @"Kurdish", key: @"kurdish" },
        @{@"name" : @"Laos", key: @"laos" },
        @{@"name" : @"Laotian", key: @"laotian" },
        @{@"name" : @"Latin American", key: @"latin" },
        @{@"name" : @"Live/Raw Food", key: @"raw_food" },
        @{@"name" : @"Lyonnais", key: @"lyonnais" },
        @{@"name" : @"Malaysian", key: @"malaysian" },
        @{@"name" : @"Meatballs", key: @"meatballs" },
        @{@"name" : @"Mediterranean", key: @"mediterranean" },
        @{@"name" : @"Mexican", key: @"mexican" },
        @{@"name" : @"Middle Eastern", key: @"mideastern" },
        @{@"name" : @"Milk Bars", key: @"milkbars" },
        @{@"name" : @"Modern Australian", key: @"modern_australian" },
        @{@"name" : @"Modern European", key: @"modern_european" },
        @{@"name" : @"Mongolian", key: @"mongolian" },
        @{@"name" : @"Moroccan", key: @"moroccan" },
        @{@"name" : @"New Zealand", key: @"newzealand" },
        @{@"name" : @"Night Food", key: @"nightfood" },
        @{@"name" : @"Norcinerie", key: @"norcinerie" },
        @{@"name" : @"Open Sandwiches", key: @"opensandwiches" },
        @{@"name" : @"Oriental", key: @"oriental" },
        @{@"name" : @"Pakistani", key: @"pakistani" },
        @{@"name" : @"Parent Cafes", key: @"eltern_cafes" },
        @{@"name" : @"Parma", key: @"parma" },
        @{@"name" : @"Persian/Iranian", key: @"persian" },
        @{@"name" : @"Peruvian", key: @"peruvian" },
        @{@"name" : @"Pita", key: @"pita" },
        @{@"name" : @"Pizza", key: @"pizza" },
        @{@"name" : @"Polish", key: @"polish" },
        @{@"name" : @"Portuguese", key: @"portuguese" },
        @{@"name" : @"Potatoes", key: @"potatoes" },
        @{@"name" : @"Poutineries", key: @"poutineries" },
        @{@"name" : @"Pub Food", key: @"pubfood" },
        @{@"name" : @"Rice", key: @"riceshop" },
        @{@"name" : @"Romanian", key: @"romanian" },
        @{@"name" : @"Rotisserie Chicken", key: @"rotisserie_chicken" },
        @{@"name" : @"Rumanian", key: @"rumanian" },
        @{@"name" : @"Russian", key: @"russian" },
        @{@"name" : @"Salad", key: @"salad" },
        @{@"name" : @"Sandwiches", key: @"sandwiches" },
        @{@"name" : @"Scandinavian", key: @"scandinavian" },
        @{@"name" : @"Scottish", key: @"scottish" },
        @{@"name" : @"Seafood", key: @"seafood" },
        @{@"name" : @"Serbo Croatian", key: @"serbocroatian" },
        @{@"name" : @"Signature Cuisine", key: @"signature_cuisine" },
        @{@"name" : @"Singaporean", key: @"singaporean" },
        @{@"name" : @"Slovakian", key: @"slovakian" },
        @{@"name" : @"Soul Food", key: @"soulfood" },
        @{@"name" : @"Soup", key: @"soup" },
        @{@"name" : @"Southern", key: @"southern" },
        @{@"name" : @"Spanish", key: @"spanish" },
        @{@"name" : @"Steakhouses", key: @"steak" },
        @{@"name" : @"Sushi Bars", key: @"sushi" },
        @{@"name" : @"Swabian", key: @"swabian" },
        @{@"name" : @"Swedish", key: @"swedish" },
        @{@"name" : @"Swiss Food", key: @"swissfood" },
        @{@"name" : @"Tabernas", key: @"tabernas" },
        @{@"name" : @"Taiwanese", key: @"taiwanese" },
        @{@"name" : @"Tapas Bars", key: @"tapas" },
        @{@"name" : @"Tapas/Small Plates", key: @"tapasmallplates" },
        @{@"name" : @"Tex-Mex", key: @"tex-mex" },
        @{@"name" : @"Thai", key: @"thai" },
        @{@"name" : @"Traditional Norwegian", key: @"norwegian" },
        @{@"name" : @"Traditional Swedish", key: @"traditional_swedish" },
        @{@"name" : @"Trattorie", key: @"trattorie" },
        @{@"name" : @"Turkish", key: @"turkish" },
        @{@"name" : @"Ukrainian", key: @"ukrainian" },
        @{@"name" : @"Uzbek", key: @"uzbek" },
        @{@"name" : @"Vegan", key: @"vegan" },
        @{@"name" : @"Vegetarian", key: @"vegetarian" },
        @{@"name" : @"Venison", key: @"venison" },
        @{@"name" : @"Vietnamese", key: @"vietnamese" },
        @{@"name" : @"Wok", key: @"wok" },
        @{@"name" : @"Wraps", key: @"wraps" },
        @{@"name" : @"Yugoslav", key: @"yugoslav" }
    ];
}

+ (NSArray *)dealValues {
    NSString *key = [self dealKey];
    return @[@{@"name": @"Deals Off", key: @"0"}, @{@"name": @"Deals On", key: @"1"}];
}

@end