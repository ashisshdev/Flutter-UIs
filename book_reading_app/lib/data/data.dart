import 'dart:math';

import 'models/book.dart';

List categories = [
  "Adventure",
  'Crime',
  'Fantasy',
  'Horror',
  'Drama',
  'Self Help',
  'Business',
  'Communication',
  'Finance'
];

List booknames = [
  'Spirit Run',
  'Into the Planet',
  'The Past Is Rising',
  'Life of Pi',
  'Around the World in Eighty Days',
  'Into the Wild',
  'Tarzan of the Apes',
  'The Three Musketeers',
  'Journey to the Center of the Earth',
  'The Martian',
  'The Last Thing He Told Me'
];

List bookNamesBG = [
  'SPIRIT\nRUN',
  'INTO  THE\nPLANET',
  'THE\nPAST\nIS\nRISING',
  'LIFE\nOF PI',
  'AROUND THE\nWORLD IN\nEIGHTY DAYS',
  'INTO THE\nWILD',
  'TARZAN\nOF THE\nAPES',
  'THE\nTHREE\nMUSKETEERS',
  'JOURNEY\nTO THE\nCENTER OF\nTHE EARTH',
  'THE\nMARTIAN',
  'THE LAST\nTHING HE\nTOLD ME'
];

List<List> bookNamesBGLists = [
  ['SPIRIT', 'RUN'],
  ['INTO THE', 'PLANET'],
  ['THE', 'PAST', 'IS', 'RISING'],
  ['LIFE', 'OF PI'],
  ['AROUND THE', 'WORLD IN', 'EIGHTY DAYS'],
  ['INTO', 'THE', 'WILD'],
  ['TARZAN', 'OF THE', 'APES'],
  ['THE', 'THREE', 'MUSKETEERS'],
  ['JOURNEY', 'TO THE', 'CENTER OF', 'THE EARTH'],
  ['THE', 'MARTIAN'],
  ['THE LAST', 'THING HE', 'TOLD ME']
];

List authors = [
  'Noe Alvarez',
  'Jill Heinerth',
  'Kathryn Bywaters',
  'Yann Martel',
  'Jules Verne',
  'Jon Krakauer',
  'Edgar Rice Burroughs',
  'Alexandre Dumas',
  'Jules Verne',
  'Andy Weir',
  'Laura Dave'
];

List descriptions = [
  'Growing up in Yakima, Washington, Noé Álvarez worked at an apple-packing plant alongside his mother, who “slouched over a conveyor belt of fruit, shoulder to shoulder with mothers conditioned to believe this was all they could do with their lives.” A university scholarship offered escape, but as a first-generation Latino college-goer, Álvarez struggled to fit in. \n\nAt nineteen, he learned about a Native American/First Nations movement called the Peace and Dignity Journeys, epic marathons meant to renew cultural connections across North America. He dropped out of school and joined a group of Dené, Secwépemc, Gitxsan, Dakelh, Apache, Tohono O’odham, Seri, Purépecha, and Maya runners, all fleeing difficult beginnings. Telling their stories alongside his own, Álvarez writes about a four-month-long journey from Canada to Guatemala that pushed him to his limits. He writes not only of overcoming hunger, thirst, and fear―dangers included stone-throwing motorists and a mountain lion―but also of asserting Indigenous and working-class humanity in a capitalist society where oil extraction, deforestation, and substance abuse wreck communities. \n\nRunning through mountains, deserts, and cities, and through the Mexican territory his parents left behind, Álvarez forges a new relationship with the land, and with the act of running, carrying with him the knowledge of his parents’ migration, and―against all odds in a society that exploits his body and rejects his spirit―the dream of a liberated future.',
  'More people have died exploring underwater caves than climbing Mount Everest, and we know more about deep space than we do about the depths of our oceans. From one of the top cave divers working today—and one of the very few women in her field—Into the Planet blends science, adventure, and memoir to bring readers face-to-face with the terror and beauty of earth’s remaining unknowns and the extremes of human capability.\n\nJill Heinerth—the first person in history to dive deep into an Antarctic iceberg and leader of a team that discovered the ancient watery remains of Mayan civilizations—has descended farther into the inner depths of our planet than any other woman. She takes us into the harrowing split-second decisions that determine whether a diver makes it back to safety, the prejudices that prevent women from pursuing careers underwater, and her endeavor to recover a fallen friend’s body from the confines of a cave. But there’s beauty beyond the danger of diving, and while Heinerth swims beneath our feet in the lifeblood of our planet, she works with biologists discovering new species, physicists tracking climate change, and hydrogeologists examining our finite freshwater reserves.',
  'The Past Is Rising is a compelling fantasy epic that revolves around the uprising of dark forces bent on wresting a kingdom from its rightful rulers. Several warriors will discover that their true destinies are to salvage their kingdom and defeat the rising evil.\n\nAt fourteen, Erik dreams of past glories. He was not alive when the False Kings marched against their nephew and laid siege to the city of Meraview. Now, perched on the outer wall, Erik imagines the two great armies battling on the plains outside the city. His excitement mounts as he spies a horse and rider racing to reach Meraview.\n\nThis lone messenger is Eve, cousin to the High King-and she brings troubling news. The False Kings, once again, are gaining power. When Eve leaves to spy on the False Kings, Erik and his friend Hobble follow her. Along the way, they will learn about lost regal bloodlines, battle against ancient magical forces, and make new allies in the fight against evil.\n\nSinister forces closely watch Erik and his new companions. Are these young people ready to face the return of the False Kings? Or will they simply be anonymous casualties in the coming war?',
  'Life of Pi is a Canadian philosophical novel by Yann Martel published in 2001. The protagonist is Piscine Molitor "Pi" Patel, an Indian boy from Pondicherry, India who explores issues of spirituality and metaphysics from an early age. He survives 227 days after a shipwreck while stranded on a lifeboat in the Pacific Ocean with a Bengal tiger which raises questions about the nature of reality and how it is perceived and told. \n\nThe novel has sold more than ten million copies worldwide. It was rejected by at least 5 London publishing houses before being accepted by Knopf Canada, which published it in September 2001. The UK edition won the Man Booker Prize the following year. It was also chosen for CBC Radio\'s Canada Reads 2003, where it was championed by author Nancy Lee.',
  'Around the World in Eighty Days (French: Le tour du monde en quatre-vingts jours) is an adventure novel by the French writer Jules Verne, first published in French in 1872. In the story, Phileas Fogg of London and his newly employed French valet Passepartout attempt to circumnavigate the world in 80 days on a wager of £20,000 (equivalent to £1.9 million in 2019) set by his friends at the Reform Club. It is one of Verne\'s most acclaimed works.',
  'Into the Wild is a 1996 non-fiction book written by Jon Krakauer. It is an expansion of a 9,000-word article by Krakauer on Chris McCandless titled "Death of an Innocent", which appeared in the January 1993 issue of Outside. The book was adapted to a film of the same name in 2007, directed by Sean Penn with Emile Hirsch starring as McCandless. Into the Wild is an international bestseller which has been printed in 30 languages and 173 editions and formats. The book is widely used as high school and college reading curriculum. Into the Wild has been lauded by many reviewers, and in 2019 was listed by Slate as one of the 50 best nonfiction works of the past quarter-century.',
  'Tarzan of the Apes is a 1912 story by American writer Edgar Rice Burroughs, and the first in the Tarzan series. It was first serialized in the pulp magazine The All-Story beginning October 1912 before being released as a novel in June 1914. The story follows the title character Tarzan\'s adventures, from his childhood being raised by apes in the jungle to his eventual encounters with other humans and Western society. So popular was the character that Burroughs continued the series into the 1940s with two dozen sequels. Scholars have noted several important themes in the novel: the impact of heredity on behavior; racial superiority; civilization, especially as Tarzan struggles with his identity as a human; sexuality; and escapism. \n\nIn April 2012, in advance of the novel\'s centennial anniversary, the Library of America published a hardcover edition based on Burroughs\'s original novel, with an introduction by Thomas Mallon.(ISBN 978-1-59853-164-0).',
  'The Three Musketeers (French: Les Trois Mousquetaires, [le tʁwɑ muskətɛːʁ]) is a French historical adventure novel written in 1844 by French author Alexandre Dumas. It is in the swashbuckler genre, which has heroic, chivalrous swordsmen who fight for justice.\n\nSet between 1625 and 1628, it recounts the adventures of a young man named d\'Artagnan (a character based on Charles de Batz-Castelmore d\'Artagnan) after he leaves home to travel to Paris, hoping to join the Musketeers of the Guard. Although d\'Artagnan is not able to join this elite corps immediately, he is befriended by three of the most formidable musketeers of the age – Athos, Porthos and Aramis, "the three musketeers" or "the three inseparables" – and becomes involved in affairs of state and at court.\n\nThe Three Musketeers is primarily a historical and adventure novel. However, Dumas frequently portrays various injustices, abuses and absurdities of the Ancien Régime, giving the novel an additional political significance at the time of its publication, a time when the debate in France between republicans and monarchists was still fierce. The story was first serialised from March to July 1844, during the July Monarchy, four years before the French Revolution of 1848 established the Second Republic.\n\nThe story of d\'Artagnan is continued in Twenty Years After and The Vicomte of Bragelonne: Ten Years Later.',
  'Journey to the Center of the Earth (French: Voyage au centre de la Terre), also translated with the variant titles A Journey to the Centre of the Earth and A Journey into the Interior of the Earth, is a classic science fiction novel by Jules Verne. It was first published in French in 1864, then reissued in 1867 in a revised and expanded edition. Professor Otto Lidenbrock is the tale\'s central figure, an eccentric German scientist who believes there are volcanic tubes that reach to the very center of the earth. He, his nephew Axel, and their Icelandic guide Hans rappel into Iceland\'s celebrated inactive volcano Snæfellsjökull, then contend with many dangers, including cave-ins, subpolar tornadoes, an underground ocean, and living prehistoric creatures from the Mesozoic and Cenozoic eras (the 1867 revised edition inserted additional prehistoric material in Chaps. 37–39). Eventually the three explorers are spewed back to the surface by an active volcano, Stromboli, located in southern Italy.\n\nThe category of subterranean fiction existed well before Verne. However his novel\'s distinction lay in its well-researched Victorian science and its inventive contribution to the science-fiction subgenre of time travel—Verne\'s innovation was the concept of a prehistoric realm still existing in the present-day world. Journey inspired many later authors, including Sir Arthur Conan Doyle in his novel The Lost World, Edgar Rice Burroughs in his Pellucidar series,[citation needed] and J. R. R. Tolkien in The Hobbit.',
  'The Martian is a 2011 science fiction debut novel written by Andy Weir. The book was originally self-published on Weir\'s blog, in a serialized format. In 2014, the book was re-released after Crown Publishing Group purchased the exclusive publishing rights. The story follows an American astronaut, Mark Watney, as he becomes stranded alone on Mars in 2035 and must improvise in order to survive. \n\nA film adaptation, The Martian, directed by Ridley Scott and starring Matt Damon, was released in October 2015.',
  'Before Owen Michaels disappears, he manages to smuggle a note to his beloved wife of one year: Protect her. Despite her confusion and fear, Hannah Hall knows exactly to whom the note refers: Owen’s sixteen-year-old daughter, Bailey. Bailey, who lost her mother tragically as a child. Bailey, who wants absolutely nothing to do with her new stepmother.\n\nAs Hannah’s increasingly desperate calls to Owen go unanswered; as the FBI arrests Owen’s boss; as a US Marshal and FBI agents arrive at her Sausalito home unannounced, Hannah quickly realizes her husband isn’t who he said he was. And that Bailey just may hold the key to figuring out Owen’s true identity—and why he really disappeared.\n\nHannah and Bailey set out to discover the truth, together. But as they start putting together the pieces of Owen’s past, they soon realize they are also building a new future. One neither Hannah nor Bailey could have anticipated.'
];

List<Book> allBooks = List.generate(
    11,
    (index) => Book(
        name: booknames[index],
        author: authors[index],
        image: "assets/books/b${index + 1}.jpg",
        rating: randomRating(),
        genre: "Adventure",
        duration: randomDuration(),
        overview: descriptions[index],
        titleBg: bookNamesBG[index]));

Random random = Random();

String randomDuration() => '${random.nextInt(3) + 2}h ${random.nextInt(11) * 5}min';
int randomRating() => random.nextInt(4) + 2;
