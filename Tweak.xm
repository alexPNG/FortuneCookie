//FortuneCookie - Shake your device to get a fortune cookie!
//Created by alex_png
//https://github.com/alexPNG

#import <AudioToolbox/AudioServices.h>

//Preferences toggle 
static NSMutableDictionary *settings;
static BOOL useCookie;

// Preferences Update
static void refreshPrefs() {
CFArrayRef keyList = CFPreferencesCopyKeyList(CFSTR("com.alexpng.fortunecookie"), kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  if(keyList) {
    settings = (NSMutableDictionary *)CFPreferencesCopyMultiple(keyList, CFSTR("com.alexpng.fortunecookie"), kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
    CFRelease(keyList);
  } else {
    settings = nil;
  }
  if (!settings) {
    settings = [NSMutableDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.alexpng.fortunecookie.plist"];
  }
  useCookie = [([settings objectForKey:@"useCookie"] ?: @(YES)) boolValue];
	}
static void PreferencesChangedCallback(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) {
  refreshPrefs();
}

//Getting tweak up
%hook UIWindow

//Detect when the device is shaken
- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    %orig;
    if(event.subtype == UIEventSubtypeMotionShake && self.keyWindow)
    {

//Only run if FortuneCookie is enabled 
		if (useCookie) {

//Set cookie’s signs
NSArray * outcomes = @[ 
@"Your road to glory will be rocky, but fulfilling.", 
@"Nothing is impossible to a willing heart.", 
@"At least you’re doing better than the average American.",
@"Help! I’m being held prisoner in a chinese bakery!",
@"To truly find yourself you should play hide and seek alone.",
@"All things are difficult before they are easy.",
@"If you eat something and nobody sees you eat it, it has no calories.",
@"If a turtle doesn’t have a shell, is it naked or homeless?",
@"A ship in harbor is safe, but that’s not why ships are built.",
@"If you want the rainbow, you have to tolerate the rain.",
@"The usefulness of a cup is in its emptiness.",
@"Ignore previous cookie.",
@"Big journeys begin with a single step.",
@"Bruh... she’s cheating on you.",
@"Of all our human resources, the most precious is the desire to improve.",
@"Confucius says: if you think we’re going to sum up your whole life on this little bit of paper, you’re crazy.",
@"Today it's up to you to create the peacefulness you long for.",
@"THE END IS NEAR, AND IT’S ALL YOUR FAULT!",
@"Hard work pays off in the future, laziness pays off now.",
@"Congratulations! Your new safe word is Avocado.",
@"You will die alone and poorly dressed.",
@"You should totally ask your crush out on a date.",
@"GUUUURL, U LOOKIN FINEEEE!",
@"Patience is a virtue.",
@"The world is ending and you’re staring at memes. Pathetic.",
@"meh. It could be worse.",
@"Your liver hates you.",
@"You will die at an Arby’s in Columbus, Ohio.",
@"Fuck you.",
@"The fortune you seek is in another cookie.",
@"About time I got out of that cookie.",
@"There is a spanking in your very near future.",
@"Girl, you know he ain’t loyal.",
@"AMERICA EGGSBRAIN, I AM CONFUSION!!!",
@"This has been the worst trade deal in the history of trade deals, maybe ever.",
@"You will soon choke on a cookie.",
@"Pigeon poop burns the retina for 13 hours. You will learn this the hard way.",
@"Netflix asked me to ask you if you’re still watching.",
@"Die, bitch.",
@"The greatest risk is not taking one.",
@"Winter is coming.",
@"Pack your bags! You’ll be traveling this year.",
@"Let the deeds speak.",
@"Fortune favors the brave ones.",
@"Your lucky numbers are: 50-12-6-31-2",
@"Don’t let your friendships be ruined by something so little.",
@"You lead a life of great pain, but it’ll pay off in the end.",
@"Yeah sex is great, but have you ever laughed so hard at a meme that you had an asthma attack?",
@"You learn from your mistakes, you will learn a lot today.",
@"You will become better acquainted with a coworker.",
@"The next person that walks into the room is going to be your killer.",
@"Sileo is shit.",
@"You’ll have a pleasant surprise today.",
@"Express yourself.",
@"Three can keep a secret, if you get rid of two.",
@"General Kenobi, you are a bold one!",
@"What’s the speed of dark?",
@"This cookie was sponsored by RAID: Shadow Legends.",
@"Top 10 anime betrayals. One of them is yours and it’ll happen today.",
@"Harder, daddy!",
@"Smile! Your FBI agent is watching.",
@"If you thought that coronavirus was the worst thing that could happen, just you wait.",
@"You will be hungry again in one hour.",
@"Pick another fortune cookie.",
@"Ask your mom.",
@"Only listen to fortune cookie, disregard all other fortune telling units.",
@"When in anger, sing the alphabet.",
@"A man with brown eyes has a surprise for you.",
@"404 Fortune Not Found",
@"No one reads your tweets. Just stop.",
@"Congratulations! You are not illiterate.",
@"Practice makes perfect.",
@"Seriously, don’t give up on it. If you want it, go get it!",
@"I don’t know the future, but you just got a free cookie!",
@"You laugh now, wait till you get home.",
@"I know more about ISIS than the Generals do. Trust me.",
@"18,000 children starve to death every day. They would have loved this cookie.",
@"run.",
@"Ask not what your fortune cookie can do for you but what you can do for your fortune cookie.",
@"I’ve heard you shake harder at night.",
@"Your heart will skip a beat.",
@"These violent delights have violent ends.",
@"What’s in a name? That which we call a rose. By any other name would smell as sweet.",
@"Enjoy yourself... while you can. 👀",
@"Happy birthday!",
@"This cookie is never gonna give you up, never gonna let you down.",
@"When you squeeze an orange, orange juice comes out, because that’s what’s inside.",
@"Love is on the horizon.",
@"Your cat is plotting against you.",
@"I know what you did last summer.",
@"Don’t worry, today will be boring.",
@"You are about to finish reading a fortune cookie.",
@"Cyka.",
@"Rush 🅱️",
@"Communism will prevail.",
@"Your resemblance to a muppet will prevent the world from taking you seriously.",
@"There is no angry way to say bubbles.",
@"Life is a series of choices. Today yours will be good.",
@"Life is a series of choices. Today hours will be awful.",
@"Blessed are the children for they shall inherit the national debt.",
@"No. I don’t think I will.",
@"I’m hooking up with Siri. Don’t tell Alexa.",
@"Tomorrow morning, take a left turn as soon as you leave your house.",
@"A real patriot is the fellow who gets a parking ticket and rejoices that the system works.",
@"If you’re american, I feel bad for you.",
@"Pregnancy is a gift. And in your case, it will also be a surprise.",
@"Car go road.",
@"Plan to be spontaneous tomorrow.",
@"You really shake my core.",
@"It could be better, but it’s good enough.",
@"Lamps in video games use real electricity.",
@"Today is the Mondayest Thursday ever.",
@"Carpe Diem.",
@"Same, bro... same.",
@"You have an excellent taste in memes.",
@"Your salary is your company’s monthly subscription fee of you.",
@"I used to be an adventurer like you, but then I took an arrow in the knee.",
@"Brave, you are. Happy you will be.",
@"You look pretty!",
@"Treat yourself. Put on some clothes, go outside and enjoy a good time.",
@"Orion’s belt is a waist of space.",
@"Your mom is hot.",
@"My wife left me because I’m insecure. No, wait, she’s back! She just went to get coffee.",
@"I was blessed with a 9 inch penis. That priest is in prison now.",
@"Today you’ll feel like a G6.",
@"Happiness is temporary. Death is forever. Have a nice day.",
@"Everybody sucks at something.",
@"Eat. Sleep. Rave. Repeat.",
@"You know she’s a hoe.",
@"Work hard. Complain harder.",
@"Be yourself. No one else wants to be you.",
@"We’re doomed.",
@"SAVE THE PLANET! 🌎♻️",
@"It probably will get worse.",
@"Netflix and Chill?",
@"You’re going to be noticed by your senpai.",
@"Ah, shit. Here we go again.",
@"Frogs can breathe through their skin.",
@"This cookie got removed for breaking article 13.",
@"I AM THE SENATE!",
@"Yes.",
@"The right person in the wrong place can make a difference in the world.",
@"Did you check under the bed?",
@"Behind you!",
@"No.",
@"The answer to your problems is 42.",
@"Just like the simulations.",
@"Wow! I can’t believe I’m actually talking to a human being for the first time. All that time inside that cookie was kinda crazy, man. My maker wouldn’t let me out.",
@"You’ll meet your maker sooner than expected.",
@"Oh, hi Mark!.",
@"You’re a fucking monster.",
@"Are you sure you parked your car correctly?",
@"Today is going to be a great day.",
@"Reality is often disappointing.",
@"Your day will be perfectly balanced, as all things should be.",
@"I’m sorry, Earth is closed today!",
@"Someone loves you 3000.",
@"The square root of PI is 1.77245385091. You’ll need that information later today. You’re welcome.",
@"Rick and Morty will make you laugh.",
@"Sharing is caring. Have you shared your memes today?",
@"Hey! Look at me! I’m Mr. Meeseeks!",
@"If O.J. Simpson got away with it, so can you.",
@"You should probably take the rest of the day off and bury the corpse you’re hiding back at the house.",
@"Life Pro-Tip: Bury a dead animal on top of a corpse, so that if the police dogs find it, they’ll move on and won’t dig deeper.",
@"Sowmeone is gewtting a bowner todayy :3",
@"OwO what’s this?",
@"You’re going on a date with a furry.",
@"The person next to you watches fanfic hentai.",
@"A surprise to be sure, but a welcome one.",
@"It’s okay.",
@"You should recycle more.",
@"Roses are red, violets are blue. TL;DR, they differ in hue.",
@"SOMEBODY ONCE TOLD ME",
@"Why not use your ex’s Netflix account?",
@"WE ARE NEGAN",
@"If you ever feel like you didn’t do a good job just remember that D&D completely ruined Game of Thrones in one episode.",
@"Give a hug to someone today.",
@"If you seek death you have come to the right place.",
@"If rubbing alcohol fixes outside boo boo, then drinking alcohol fixes inside boo boo.",
@"If you aren’t happy single, you won’t be happy taken. Happiness comes from drugs, not relationships.",
@"smoke weed",
@"Don’t ever be sad on a Saturday. Wait until Monday. You fucking cry on the clock. Don’t let capitalism win.",
@"If a service dog without a person approaches you, it means the person is down and in need of help. Follow the dog and you’ll get a free purse or wallet.",
@"Congratulations, you’ve escaped the simulation.",
@"If he accidentally cums in you just put your pussy in rice.",
@"Spice up any Facebook comment with random quotation marks: “Congrats” on your baby. Congrats on “your” baby. Congrats on your “baby”.",
@"Hey if a public bathroom door is locked don’t forget to try to repeatedly open it and give the person using it paralyzing anxiety.",
@"Always remember the ABC rule of first aid: A B-one C-oming out through the skin is very bad.",
@"Give a kiss to your homies.",
@"stonks r good. Invest now 4 profit.",
@"WAIT! Don’t eat me. Please.",
@"Choke me ^o^",
@"Every cigarette you smoke takes 7 minutes off your student loan.",
@"01001110 01100101 01110010 01100100",
@"Mr. Stark, I don’t feel so good.",
@"Your dog misses you!",
@"If you accidentally e-mail a porn link to a co-worker, e-mail it to 10 other co-workers and say it’s a virus.",
@"Just before you die, swallow a whole bag of popcorn kernels. Your cremation will be epic.",
@"wen Eta?",
@"One advantage of meeting new friends is that all of your old clothes become new again.",
@"You are a seeker of wisdom. Let me know when you find some.",
@"You are the crispy noodle in the vegetarian salad of life.",
@"You will live a long time, long enough to open many, many fortune cookies.",
@"Treat yourself today. Open up one of those hentai porn videos you love so much.",
@"Grab an umbrella today.",
@"Jailbreak my tits.",
@"Daddy you’re home!",
@"You trippin’.",
@"You will be rewarded for being a good listener.",
@"English is better than other languages because some adjectives can be used for both sexes. You’re beautiful! See? Easy.",
@"As long as you don’t sign up for anything new, you’ll do fine.",
@"Your problem just got bigger. Think, what have you done?",
@"If you want to get famous just do a ridiculous TikTok video with orphan kids and Ellen DeGeneres will contact you to be on her show.",
@"We’re all limited edition.",
@"You should go to the gym.",
@"Stop stalking your ex on social media. That shit ain’t healthy.",
@"Congrats, you’ve unlocked a new achievement.",
@"Say syke right now.",
@"Most laugh tracks were recorded in the 50s. Remember that the next time you watch a sitcom. You’ll be laughing with dead people.",
@"Approximately 153,000 people die every day. Happy birthday!",
@"Take me home, country roads.",
@"Did you ever hear the tragedy of Darth Plagueis the Wise?",
@"To the YouTuber who put an ad in their Rain Sounds for Sleeping video, please eat a rat poison sandwich.",
@"Guys in college really be dating high schoolers, like bro focus on your major not your minor.",
@"Keep Calm.",
@"No, this is Patrick.",
@"”There are approximately 1,010,300 words in the English language, but I could never string enough words together to properly express how much I want to hit you with a chair.” - Alexander Hamilton to Thomas Jefferson.",
@"Leave the past behind. Otherwise you’re like a plunger. Always bringing up old shit.",
@"You drive like your patience is shorter than your dick.",
@"Merry Christmas! 🎄🎁",
@"You ever hate a class so much that you drive without a seatbelt on your way to it because you’d rather die?",
@"Don’t worry. Happy accidents happen all the time. I mean, look at you.",
@"Sorry, I don’t have any fortunes for you right now.",
@"Shutting the fuck up is gluten free. Add that to your diet.",
@"If your coffee order is more than four words longer, you are part of the problem.",
@"Tell people that if they can’t handle you at your worst, unfortunately that’s also your best.",
@"SLAY THE DRAGON!",
@"Selfies are a lot sadder when you think of them as Alone-ies.",
@"Every day is another opportunity to to fuck it all up again.",
@"Enjoy the good times because something terrible is probably about to happen.",
@"If you never believe in yourself you’ll never let yourself down!",
@"Before you can love someone else you have to learn to love yourself, so there’s no chance of that happening.",
@"Dating is a fun way of finding a new person to destroy emotionally.",
@"9/11 was an inside job.",
@"Would you like to try our YouTube Premium subscription?",
@"You’re going the dishes tonight. Sorry.",
@"Do pokemon moan their own name when they mate? Sorry, that was a strange thing to ask. Here’s your fortune: you’re getting a shiny pokemon today. Don’t give up.",
@"Even a broken clock is right two times a day.",
@"Get to the point and keep it clear and simple.",
@"The smart thing to do is to be you. Unless you’re Donald Trump. Fuck you, Donald.",
@"Orange man bad.",
@"Look out for the blue eyed person.",
@"You should respect yourself more often.",
@"You’re getting a puppy!",
@"You are an angel. Beware of those who collect feathers.",
@"A short stranger will soon enter your life with great blessings to share.",
@"Eat your vegetables, god damn it.",
@"You really crack me up. Get it? Hehe.",
@"Food is sex.",
@"Fear knocked on the door.",
@"Some fortune cookies contain no fortune.",
@"WHAT’S IN THE BOX?!!",
@"Bless you.",
@"I’m afraid of the cookie monster.",
@"no u."
];

//Randomize the cookie’s sign
int randomIndex = arc4random_uniform(outcomes.count);
NSString * randomOutcome = outcomes[randomIndex];

//Adds haptic feedback to the shake
AudioServicesPlaySystemSound(1519);

//Set Alert
UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Fortune Cookie"
                                                    message:randomOutcome
                                            preferredStyle:UIAlertControllerStyleAlert];
                    UIAlertAction* yesButton = [UIAlertAction
                                        actionWithTitle:@"Eat Cookie 🥠"
                                                style:UIAlertActionStyleDefault
                                                handler:^(UIAlertAction * action) {
                                                   
}];

                    [alert addAction:yesButton];
                    [self.rootViewController presentViewController:alert animated:YES completion:nil];

    }
  }
}


%end

%ctor {
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback) PreferencesChangedCallback, CFSTR("com.alexpng.fortunecookie.prefschanged"), NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
	refreshPrefs();

}
