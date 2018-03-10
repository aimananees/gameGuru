from firebase import firebase

firebase = firebase.FirebaseApplication('https://gameguru-b3dba.firebaseio.com/')

result= firebase.post('/games',
	{
		"game_name":"Assassin's Creed®  III",
		"game_url":"https://www.youtube.com/embed/3WClZ1MP4Ck",
		"game_description":"The American Colonies, 1775. It’s a time of civil unrest and political upheaval in the Americas. As a Native American Assassin fights to protect his land and his people he will ignite the flames of a young nation’s revolution. In Assassin’s Creed® III, eliminate your enemies with an array of new weapons including guns, bows, tomahawks, and trusty hidden blades. The game has been in development for over 3 years and features the new Ubisoft-AnvilNext engine, a stunning technology that will revolutionize gaming with powerful graphics, lifelike animations, immersive combat, and advanced physics. With an all new setting, assassin and engine, Assassin’s Creed® III takes you back to the American Revolutionary War, but not the one you’ve read about in history books.",
		"developer":"Ubisoft",
		"publisher":"Ubisoft",
		"game_genre":"Action & Adventure",
		"game_image":"assassins",
		"game_support_image_1":"assassins_1",
		"game_support_image_2":"assassins_2",
		"game_support_image_3":"assassins_3"
	})
result_1= firebase.post('/games',
	{
		"game_name":"Battlefield Bad Company 2",
		"game_url":"https://www.youtube.com/embed/-pUhraVG7Ow",
		"game_description":"Battlefield: Bad Company™ 2 brings the award-winning Battlefield gameplay to the forefront of Xbox 360 console with best-in-class vehicular combat and unexpected 'Battlefield moments.' New vehicles like the ATV and a transport helicopter allow for all-new multiplayer tactics on the Battlefield. With the Frostbite-enabled Destruction 2.0 system, you can take down entire buildings and create your own fire points by blasting holes through cover. You can also compete in four-player teams in two squad-only game modes, fighting together to unlock exclusive awards and achievements. Battles are set across expansive maps, each with a different tactical focus. The game also sees the return of the B Company squad in a more mature single-player campaign.",
		"developer":"Digital Illusions CE AB",
		"publisher":"Electronic Arts",
		"game_genre":"Action & Adventure, Shooter",
		"game_image":"badcompany",
		"game_support_image_1":"badcompany_1",
		"game_support_image_2":"badcompany_2",
		"game_support_image_3":"badcompany_3"
	})


result_2= firebase.post('/games',
	{
		"game_name":"Assissin's Creed®  Revelations",
		"game_url":"https://www.youtube.com/embed/8-Ixo7QXw_E",
		"game_description":"In Assassin’s Creed® Revelations, master assassin Ezio Auditore walks in the footsteps of the legendary mentor Altair, on a journey of discovery and revelation. It is a perilous path – one that will take Ezio to Constantinople, the heart of the Ottoman Empire, where a growing army of Templars threatens to destabilize the region. In addition to Ezio’s award-winning story, a refined and expanded online multiplayer experience returns with more modes, more maps and more characters, allowing you to test your assassin skills against others from around the world.",
		"developer":"Ubisoft Montreal",
		"publisher":"Ubisoft",
		"game_genre":"Action & Adventure",
		"game_image":"revelations",
		"game_support_image_1":"revelations_1",
		"game_support_image_2":"revelations_2",
		"game_support_image_3":"revelations_3"
	})

result_3= firebase.post('/games',
	{
		"game_name":"Kinect Adventures!",
		"game_url":"https://www.youtube.com/embed/nee86i_vInE",
		"game_description":"(Online Interactions Not Rated by the ESRB) The Games on Demand version supports English, French, Italian, German, Spanish, Potuguese, Russian, Japanese, Korean, Chinese. Kinect Adventures! is a full-featured Kinect game where you and your friends will explore the world – and beyond – through 20 active adventures to achieve the ultimate reward: Expert Adventurer status! Jump, duck and dodge your way through roaring rapids and challenging obstacle courses. Use your skills to save a leaky underwater laboratory. Get creative by showing off and sharing your accomplishments online with Photo Moments and Living Statues. The spirit of adventure awaits!",
		"developer":"Good Science Studio",
		"publisher":"Microsoft Game Studios",
		"game_genre":"Other, Kinect",
		"game_image":"adventures",
		"game_support_image_1":"adventures_1",
		"game_support_image_2":"adventures_2",
		"game_support_image_3":"adventures_3"
	})
result_4= firebase.post('/games',
	{
		"game_name":"Minecraft Xbox360 Edition",
		"game_url":"https://www.youtube.com/embed/rvlwWiskcLk",
		"game_description":"(Online Interactions Not Rated by the ESRB) Imagine it, build it! Minecraft: Xbox 360 Edition lets you create worlds from the comfort of your sofa. Play alone or play with your friends. Explore, build and conquer! At night monsters come out, so make sure to build a shelter before that happens. After that, your world is your imagination. Turn your hours into minutes with Minecraft! To experience split-screen functionality a high-definition television is required. PHOTOSENSITIVITY SEIZURE WARNING: http://support.xbox.com/en-US/xbox-one/console/photosensitive-seizure-warning",
		"developer":"4J Studios",
		"publisher":"Mojang/Microsoft Studios",
		"game_genre":"Action & Adventure, Family",
		"game_image":"minecraft",
		"game_support_image_1":"minecraft_1",
		"game_support_image_2":"minecraft_2",
		"game_support_image_3":"minecraft_3"
	})

result_5= firebase.post('/games',
	{
		"game_name":"Batman Arkham City",
		"game_url":"https://www.youtube.com/embed/muCtJsy-d9w",
		"game_description":"The Games on Demand version supports English, French, Italian, German, Spanish, Russian, Japanese, Korean. No escape from Arkham City…the sprawling super-prison in the heart of Gotham City, home to its most violent thugs and infamous super villains. With the lives of the innocent at stake, only one man can save them and bring justice to the streets of Gotham City…The Batman.",
		"developer":"Rocksteady Studios Ltd",
		"publisher":"WB Games Inc.",
		"game_genre":"Action & Adventure, Fighting, Platformer",
		"game_image":"batman",
		"game_support_image_1":"batman_1",
		"game_support_image_2":"batman_2",
		"game_support_image_3":"batman_3"
	})

result_6= firebase.post('/games',
	{
		"game_name":"Halo 4",
		"game_url":"https://www.youtube.com/embed/-kg3yxNsSzk",
		"game_description":"The Games on Demand version supports English. The Master Chief returns to battle an ancient evil bent on vengeance and annihilation. Shipwrecked on a mysterious world, faced with new enemies and deadly technology, the universe will never be the same. Enlist aboard the Infinity to experience Halo’s original multiplayer and Spartan Ops - innovative episodic fiction-based co-op missions.",
		"developer":"343 Industries",
		"publisher":"Microsoft Studios",
		"game_genre":"Shooter",
		"game_image":"halo",
		"game_support_image_1":"halo_1",
		"game_support_image_2":"halo_2",
		"game_support_image_3":"halo_3"
	})



