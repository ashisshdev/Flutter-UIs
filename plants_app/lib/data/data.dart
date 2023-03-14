import 'dart:math';

import '../models/plant_preview.dart';

List<String> plantCategories = [
  "All",
  'Flowers',
  'Indoor',
  'Outdoor',
  'Succulents',
  'Seasonal',
  'Edible',
  'Office',
  'Air Plants',
  'Cacti',
  'Medicinal',
  'Tropical Plants',
];

List<String> allPlantsImages = List.generate(
    10, (index) => "assets/images/plant${index + 1}.png");

List<String> allPlantsNames = [
  "Monstera deliciosa",
  "Chamaedorea elegans",
  "Dypsis lutescens",
  "Phalaenopsis",
  "Rosa chinensis",
  "Dracaena trifasciata",
  "Polyscias scutellaria",
  "Bellis perennis",
  "Salix babylonica",
  "Dicksonia antarctica",
];

List<String> allPlantsExternalLinks = [
  "https://en.wikipedia.org/wiki/Monstera_deliciosa",
  "https://en.wikipedia.org/wiki/Chamaedorea_elegans",
  "https://en.wikipedia.org/wiki/Dypsis_lutescens",

  "https://en.wikipedia.org/wiki/Phalaenopsis",
  "https://en.wikipedia.org/wiki/Rosa_chinensis",
  "https://en.wikipedia.org/wiki/Dracaena_trifasciata",
  "https://en.wikipedia.org/wiki/Polyscias_scutellaria",
  "https://en.wikipedia.org/wiki/Bellis_perennis",
  "https://en.wikipedia.org/wiki/Salix_babylonica",
  "https://en.wikipedia.org/wiki/Dicksonia_antarctica"
];

List<String> allPlantsDescriptions = [
  "Monstera deliciosa, the Swiss cheese plant, is a species of flowering plant native to tropical forests of southern Mexico, south to Panama. It has been introduced to many tropical areas, and has become a mildly invasive species in Hawaii, Seychelles, Ascension Island and the Society Islands. It is very widely grown in temperate zones as a houseplant. The plant may be confused with Thaumatophyllum bipinnatifidum, known as the Split-leaf Philodendron or Tree Philodendron, as they have similar leaves and growing habits. However, the ingestion of Thaumatophyllum bipinnatifidum may cause irritation to the digestive tract and will induce internal swelling. The sap is also known to irritate the skin.",
  "Chamaedorea elegans, the neanthe bella palm or parlour palm, is a species of small palm tree native to the rainforests in Southern Mexico and Guatemala. The parlor palm is one of the most heavily sold houseplant palms in the world. It is one of several species with leaves that are harvested as xate. This plant has gained the Royal Horticultural Society's Award of Garden Merit.",
  "Dypsis lutescens, also known as golden cane palm, areca palm, yellow palm, or butterfly palm, is a species of flowering plant in the family Arecaceae, native to Madagascar and naturalized in the Andaman Islands, Réunion, El Salvador, Cuba, Puerto Rico, the Canary Islands, southern Florida, Haiti, the Dominican Republic, Jamaica, the Leeward Islands and the Leeward Antilles.",

  "Phalaenopsis Blume (1825), commonly known as moth orchids, is a genus of about seventy species of plants in the family Orchidaceae. Orchids in this genus are monopodial epiphytes or lithophytes with long, coarse roots, short, leafy stems and long-lasting, flat flowers arranged in a flowering stem that often branches near the end. Orchids in this genus are native to India, Taiwan, China, Southeast Asia, New Guinea and Australia with the majority in Indonesia and the Philippines.",
  "Rosa chinensis (Chinese: 月季; pinyin: yuèjì), known commonly as the China rose or Chinese rose, alternatively known as Bengal rose or Bengal Crimson or Bengal Beauty is a member of the genus Rosa native to Southwest China in Guizhou, Hubei, and Sichuan Provinces. The first publication of Rosa chinensis was in 1768 by Nikolaus Joseph von Jacquin in Observationum Botanicarum, 3, p. 7, p. 55.",
  "Dracaena trifasciata is a species of flowering plant in the family Asparagaceae, native to tropical West Africa from Nigeria east to the Congo. It is most commonly known as the snake plant, Saint George's sword, mother-in-law's tongue, and viper's bowstring hemp, among other names. Until 2017, it was known under the synonym Sansevieria trifasciata.",
  "Polyscias scutellaria, the shield aralia, or plum aralia, is a tropical shrub or small tree reaching 2–6 meters tall. A native of the Southwest Pacific Islands, it is commonly grown in gardens. The leaves and root can be used as an antiseptic and deodorant.",
  "Bellis perennis is a common European species of daisy, of the family Asteraceae, often considered the archetypal species of that name. Many related plants also share the name \"daisy\", so to distinguish this species from other daisies it is sometimes qualified as common daisy, lawn daisy or English daisy. Historically, it has also been commonly known as bruisewort and occasionally woundwort (although the common name woundwort is now more closely associated with Stachys). Bellis perennis is native to western, central and northern Europe, including remote islands such as the Faroe Islands but widely naturalised in most temperate regions including the Americas and Australasia.",
  "Salix babylonica (Babylon willow or weeping willow; Chinese: 垂柳; pinyin: chuí liǔ) is a species of willow native to dry areas of northern China, but cultivated for millennia elsewhere in Asia, being traded along the Silk Road to southwest Asia and Europe.",
  "Dicksonia antarctica, the soft tree fern or man fern, is a species of evergreen tree fern native to eastern Australia, ranging from south-east Queensland, coastal New South Wales and Victoria to Tasmania.",
];

List<PlantPreview> allPlants = List.generate(
    10,
    (i) => PlantPreview(
        name: allPlantsNames[i],
        description: allPlantsDescriptions[i],
        externalLink: allPlantsExternalLinks[i],
        image: allPlantsImages[i],
        rating: Helpers().randomRating(),
        price: Helpers().randomPrie()));

class Helpers {
  final Random random = Random();

  randomRating() => random.nextInt(2) + 3;

  randomPrie() => random.nextInt(8) + 10;

  
}
