/*

This is a global accessed database. accessed by any copies of the teleporter
scripts you use if you host multi/realm multi/build .
You can add new Menu's and entries plus set there limits to build, level, team.
 allowing the script to filter out any menus or entries that may not exsist in lower
 builds or may be team specific.
 
 By Slp13at420 of EmuDevs Om Nom Nom Nom nom nom nom
*/

DROP DATABASE IF EXISTS `grumboz_quantum_teleporter`;
CREATE DATABASE IF NOT EXISTS `grumboz_quantum_teleporter` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `grumboz_quantum_teleporter`;

DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `menu_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT 'This id is used to link a menu to its entries.',
  `menu_title` varchar(50) NOT NULL DEFAULT 'menu_name' COMMENT 'Menu name.',
  `menu_icon` tinyint(2) unsigned NOT NULL DEFAULT '2' COMMENT 'Gossip Menu icon id.',
  `menu_team` tinyint(1) unsigned NOT NULL DEFAULT '2' COMMENT 'team id required to access this menu. 0=ally//1=horde//2=both//3=GM',
  `menu_level` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'minimum player level to access this menu',
  `menu_expansion_low` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'lowest expansion supported by this menu.',
  `menu_expansion_high` tinyint(1) unsigned NOT NULL DEFAULT '4' COMMENT 'highest expansion supported by this expansion',
  UNIQUE KEY `menu_id` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='This table stores the individual Main Menu''s data.\r\nThis is where you will add any new Menus you want to add.';

INSERT INTO `menus` (`menu_id`, `menu_title`, `menu_icon`, `menu_team`, `menu_level`, `menu_expansion_low`, `menu_expansion_high`) VALUES
	(1, 'Eastern Kingdoms', 2, 2, 1, 0, 4),
	(2, 'Kalimdor', 2, 2, 1, 0, 4),
	(3, 'Outland', 2, 2, 1, 1, 4),
	(4, 'Northrend', 2, 2, 1, 1, 4),
	(5, 'Classic Dungeons', 9, 2, 1, 0, 4),
	(6, 'Burning Crusades Dungeons', 9, 2, 1, 1, 4),
	(7, 'Wotlk Dungeons', 9, 2, 1, 2, 4),
	(8, 'Cataclysm Instances', 9, 2, 1, 3, 4),
	(9, 'Cataclysm Raid Locations', 9, 2, 1, 3, 4),
	(10, 'Raid Locations', 9, 2, 1, 0, 4),
	(11, 'Malls', 10, 2, 1, 0, 4),
	(12, 'Custom Location', 10, 2, 1, 0, 4),
	(13, 'Event areas', 10, 2, 1, 0, 4),
	(14, 'GM Locations', 10, 3, 1, 0, 4),
	(15, 'Locations 1', 10, 2, 1, 0, 4),
	(16, 'Locations 2', 10, 2, 1, 0, 4),
	(17, 'Locations 3', 10, 2, 1, 0, 4);

DROP TABLE IF EXISTS `entries`;
CREATE TABLE IF NOT EXISTS `entries` (
  `menu_id` tinyint(4) NOT NULL COMMENT 'Menu_Id from menus table this entry will belong to.',
  `entry_title` varchar(255) NOT NULL DEFAULT 'ENTRY_TITLE' COMMENT 'tele location name.',
  `entry_icon_id` tinyint(2) NOT NULL DEFAULT '9' COMMENT 'gossip menu icon id - for tele points its usually 9.',
  `entry_team_id` tinyint(1) NOT NULL DEFAULT '2' COMMENT 'id of team allowed to access tele entry . 0=ally//1=horde/2=both/3=GM',
  `entry_min_level` tinyint(3) NOT NULL DEFAULT '1' COMMENT 'minimum player level required to access tele location.',
  `map_id` mediumint(9) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `o` float NOT NULL,
  `expansion_low` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'lowest expansion this entry will support.',
  `expansion_high` tinyint(1) NOT NULL DEFAULT '4' COMMENT 'highest this entry will support.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table stores individual teleport location data.\r\nThis is where you will enter new teleport locations.';

INSERT INTO `entries` (`menu_id`, `entry_title`, `entry_icon_id`, `entry_team_id`, `entry_min_level`, `map_id`, `x`, `y`, `z`, `o`, `expansion_low`, `expansion_high`) VALUES
	(1, 'GuruBashi Arena', 9, 2, 1, 0, -13232.2, 220.996, 32.1451, 1.09563, 0, 4),
	(1, 'Elwynn Forest', 2, 2, 1, 0, -9449.06, 64.8392, 56.112, 3.07047, 0, 4),
	(1, 'Dun Morogh', 2, 0, 1, 0, -5603.76, -482.704, 396.98, 5.23499, 0, 4),
	(1, 'Loch Modan', 2, 0, 1, 0, -5405.85, -2894.15, 341.972, 5.48238, 0, 4),
	(1, 'Westfall', 2, 0, 1, 0, -10684.9, 1033.63, 32.5389, 6.07384, 0, 4),
	(1, 'RedRidge Mountains', 2, 0, 1, 0, -9447.8, -2270.85, 71.8221, 6.26073, 0, 4),
	(1, 'Duskwood', 2, 0, 1, 0, -10531.7, -1281.91, 38.8595, 1.45571, 0, 4),
	(1, 'EverSong Woods', 2, 2, 1, 530, 9024.37, -6682.55, 16.8973, 3.14131, 1, 4),
	(1, 'TirisFal Glades', 2, 1, 1, 0, 2274.95, 323.918, 34.1142, 4.24367, 0, 4),
	(1, 'Ghostlands', 2, 1, 1, 530, 7595.73, -6819.6, 84.3718, 2.56561, 1, 4),
	(1, 'SilverPine Forest', 2, 1, 1, 0, 505.126, 1504.63, 124.808, 1.77987, 0, 4),
	(1, 'Hillsbrad Foothills', 2, 2, 1, 0, -385.805, -787.954, 54.6655, 1.03926, 0, 4),
	(1, 'Wetlands', 2, 0, 1, 0, -3517.75, -913.401, 8.86625, 2.60705, 0, 4),
	(1, 'Alterac Mountains', 2, 2, 1, 0, 275.049, -652.044, 130.296, 0.502032, 0, 4),
	(1, 'Arathi HighLands', 2, 2, 1, 0, -1581.45, -2704.06, 35.4168, 0.490373, 0, 4),
	(1, 'StrangleThorn Vale', 2, 2, 1, 0, -11921.7, -59.544, 39.7262, 3.73574, 0, 4),
	(1, 'BadLands', 2, 2, 1, 0, -6782.56, -3128.14, 240.48, 5.65912, 0, 4),
	(1, 'Swamp of Sorrows', 2, 2, 1, 0, -10368.6, -2731.3, 21.6537, 5.29238, 0, 4),
	(1, 'The HinterLands', 2, 2, 1, 0, 112.406, -3929.74, 136.358, 0.981903, 0, 4),
	(1, 'Searing Gorge', 2, 2, 1, 0, -6686.33, -1198.55, 240.027, 0.916887, 0, 4),
	(1, 'The Blasted Lands', 2, 2, 1, 0, -11184.7, -3019.31, 7.29238, 3.20542, 0, 4),
	(1, 'Burning Steppes', 2, 2, 1, 0, -7980.85, -2106.82, 127.944, 5.50989, 0, 4),
	(1, 'Western PlagueLands', 2, 2, 1, 0, 1745.39, -1723.41, 59.6716, 4.97019, 0, 4),
	(1, 'Eastern PlagueLands', 2, 2, 1, 0, 2280.64, -5275.05, 82.0166, 4.7479, 0, 4),
	(1, 'Isle of Quel`Danas', 2, 2, 1, 530, 12806.5, -6911.11, 41.1156, 2.22935, 1, 4),
	(2, 'Azuremyste Isle', 2, 0, 1, 530, -4192.62, -12576.7, 36.7598, 1.62813, 1, 4),
	(2, 'Teldrassil', 2, 0, 1, 1, 9887.54, 918.219, 1307.43, 0.31333, 0, 4),
	(2, 'Bloodmyst Isle', 2, 0, 1, 530, -2095.7, -11841.1, 51.1557, 6.19288, 1, 4),
	(2, 'Durotar', 2, 1, 1, 1, -601.652, -4238.58, 38.9562, 4.61878, 0, 4),
	(2, 'Mulgore', 2, 1, 1, 1, -2473.87, -501.225, -9.42465, 0.6525, 0, 4),
	(2, 'The Barrens', 2, 1, 1, 1, -575.772, -2652.45, 95.6384, 0.006469, 0, 4),
	(2, 'DarkShore', 2, 0, 1, 1, 6463.25, 683.986, 8.92792, 4.33534, 0, 4),
	(2, 'StoneTalon Mountains', 2, 2, 1, 1, 1577.1, 1031.69, 137.104, 4.5867, 0, 4),
	(2, 'Ashenvale Forest', 2, 2, 1, 1, 1919.77, -2169.68, 94.6729, 6.14177, 0, 4),
	(2, 'Thousand Needles', 2, 1, 1, 1, -5375.53, -2509.2, -40.432, 2.41885, 0, 4),
	(2, 'Desolace', 2, 2, 1, 1, -656.056, 1510.12, 88.3746, 3.29553, 0, 4),
	(2, 'Dustwallow Marsh', 2, 2, 1, 1, -3350.12, -3064.85, 33.0364, 5.22876, 0, 4),
	(2, 'Feralas', 2, 0, 1, 1, -4808.31, 1040.51, 103.769, 2.90655, 0, 4),
	(2, 'Tanaris Desert', 2, 0, 1, 1, -6940.91, -3725.7, 48.9381, 3.11174, 0, 4),
	(2, 'Azshara', 2, 0, 1, 1, 3117.12, -4387.97, 91.9059, 5.49897, 0, 4),
	(2, 'Felwood', 2, 0, 1, 1, 3898.8, -1283.33, 220.519, 0.757063, 0, 4),
	(2, 'Un`Goro Crater', 2, 2, 1, 1, -6291.55, -1158.62, -258.138, 0.457099, 0, 4),
	(2, 'Silithis', 2, 2, 1, 1, -6815.25, 730.015, 40.9483, 2.39066, 0, 4),
	(2, 'Winterspring', 2, 2, 1, 1, 6658.49, -4558.61, 717.373, 2.98569, 0, 4),
	(3, 'HellFire Peninsula', 2, 2, 1, 530, -207.335, 2035.92, 96.464, 1.59676, 1, 4),
	(3, 'Zangarmarsh', 2, 2, 1, 530, -220.297, 5378.58, 23.3223, 1.61718, 1, 4),
	(3, 'Terokkar Forest', 2, 2, 1, 530, -2266.23, 4244.73, 1.47728, 3.68426, 1, 4),
	(3, 'Nagrand', 2, 2, 1, 530, -1610.85, 7733.62, -17.2773, 1.33522, 1, 4),
	(3, 'Blade`s Edge Mountains', 2, 2, 1, 530, 2029.75, 6232.07, 133.495, 1.30395, 1, 4),
	(3, 'NetherStorm', 2, 2, 1, 530, 3271.2, 3811.61, 143.153, 3.42531, 1, 4),
	(3, 'ShadowMoon Valley', 2, 2, 1, 530, -3681.01, 2350.76, 76.587, 4.25995, 1, 4),
	(3, 'Shattrath', 2, 2, 1, 530, -1822, 5417, 1, 3, 1, 4),
	(4, 'Borean Tundra', 2, 2, 1, 571, 2954.24, 5379.13, 60.4538, 2.55544, 1, 4),
	(4, 'Howling Fjord', 2, 2, 1, 571, 682.848, -3978.3, 230.161, 1.54207, 1, 4),
	(4, 'Dragonblight', 2, 2, 1, 571, 2678.17, 891.826, 4.37494, 0.101121, 1, 4),
	(4, 'Grizzly Hills', 2, 2, 1, 571, 4017.35, -3403.85, 290, 5.35431, 1, 4),
	(4, 'Zul`Drak', 2, 2, 1, 571, 5560.23, -3211.66, 371.709, 5.55055, 1, 4),
	(4, 'Sholazar Basin', 2, 2, 1, 571, 5614.67, 5818.86, -69.722, 3.60807, 1, 4),
	(4, 'Crystalsong Forest', 2, 2, 2, 1, 571, 5411.17, -699.37, 167.082, 2, 1),
	(4, 'Storm Peaks', 2, 2, 1, 571, 6120.46, -1013.89, 408.39, 5.12322, 1, 4),
	(4, 'Icecrown', 2, 2, 1, 571, 8323.28, 2763.5, 655.093, 2.87223, 1, 4),
	(4, 'Wintergrasp', 2, 2, 1, 571, 4522.23, 2828.01, 389.975, 0.215009, 1, 4),
	(5, 'Gnomeregan', 2, 0, 1, 0, -5163.54, 925.423, 257.18, 1.47213, 0, 4),
	(5, 'The Deadmines', 2, 0, 1, 0, 11209.6, 1666.54, 24.6974, 1.42053, 1, 4),
	(5, 'The Stockade', 2, 0, 1, 0, -8799.15, 832.718, 97.6348, 6.04085, 0, 4),
	(5, 'RageFire Chasm', 2, 1, 1, 1, 1811.78, -4410.5, -18.4704, 5.20165, 1, 4),
	(5, 'Razorfen Downs', 2, 1, 1, 1, -4657.3, -2519.35, 81.0529, 4.54808, 0, 4),
	(5, 'Razorfen Kraul', 2, 1, 1, 1, -4470.28, -1677.77, 81.3927, 1.16302, 0, 4),
	(5, 'Scarlet Monastery', 2, 1, 1, 0, 2873.15, -764.523, 160.332, 5.10447, 0, 4),
	(5, 'ShadowFang Keep', 2, 1, 1, 0, -234.675, 1561.63, 76.8921, 1.24031, 0, 4),
	(5, 'Wailing Caverns', 2, 1, 1, 1, -731.607, -2218.39, 17.0281, 2.78486, 0, 4),
	(5, 'Blackfathom Deeps', 2, 2, 1, 1, 4249.99, 740.102, -25.671, 1.34062, 0, 4),
	(5, 'Blackrock Depths', 2, 2, 1, 0, -7179.34, -921.212, 165.821, 5.09599, 0, 4),
	(5, 'Blackrock Spire', 2, 2, 1, 0, -7527.05, -1226.77, 285.732, 5.29626, 0, 4),
	(5, 'Dire Maul', 2, 2, 1, 1, -3520.14, 1119.38, 161.025, 4.70454, 0, 4),
	(5, 'Maraudon', 2, 2, 1, 1, -1421.42, 2907.83, 137.415, 1.70718, 0, 4),
	(5, 'Scholomance', 2, 2, 1, 0, 1269.64, -2556.21, 93.6088, 0.620623, 0, 4),
	(5, 'Stratholme', 2, 2, 1, 0, 3352.92, -3379.03, 144.782, 6.25978, 0, 4),
	(5, 'Sunken Temple', 2, 2, 1, 0, -10177.9, -3994.9, -111.253, 6.01885, 0, 4),
	(5, 'Uldaman', 2, 2, 1, 0, -6071.37, -2955.16, 209.782, 0.015708, 0, 4),
	(5, 'Zul`Farrak', 2, 2, 1, 1, -6801.19, -2893.02, 9.00388, 0.158639, 0, 4),
	(6, 'Auchindoun', 2, 2, 1, 530, -3324.49, 4943.45, -101.239, 4.63901, 1, 4),
	(6, 'Caverns of Time', 2, 2, 1, 1, -8369.65, -4253.11, -204.272, 3.57792, 1, 4),
	(6, 'Coilfang Reservoir', 2, 2, 1, 530, 738.865, 6865.77, -69.4569, 6.27655, 1, 4),
	(6, 'Hellfire Citadel', 2, 2, 1, 530, -347.29, 3089.82, 21.394, 5.68114, 1, 4),
	(6, 'Magisters Terrace', 2, 2, 1, 530, 12884.6, -7317.69, 65.5023, 4.799, 1, 4),
	(6, 'Tempest Keep', 2, 2, 1, 530, 3100.48, 1536.49, 190.3, 4.62226, 1, 4),
	(7, 'Azjol-Nerub', 2, 2, 1, 571, 3707.86, 2150.23, 36.757, 3.22, 2, 4),
	(7, 'The Culling of Stratholme', 2, 2, 1, 1, -8756.39, -4440.68, -199.489, 4.66289, 2, 4),
	(7, 'Trial of the Champion', 2, 2, 1, 571, 8590.95, 791.792, 558.235, 3.11949, 2, 4),
	(7, 'Drak`Tharon Keep', 2, 2, 1, 571, 4759.8, -2045.65, 229.395, 0.062958, 2, 4),
	(7, 'Gundrak', 2, 2, 1, 571, 6722.44, -4640.67, 450.632, 3.91123, 2, 4),
	(7, 'IceCrown Citidel Dungeons', 2, 2, 1, 571, 5637.35, 2067.71, 798.058, 4.62206, 2, 4),
	(7, 'The Nexus Dungeons', 2, 2, 1, 571, 3771.22, 6948.19, 105.802, 0.443879, 2, 4),
	(7, 'The Violet Hold', 2, 2, 1, 571, 5693.08, 502.588, 652.672, 4.07631, 2, 4),
	(7, 'Halls of Lightning', 2, 2, 1, 571, 9136.52, -1311.81, 1066.29, 5.19113, 2, 4),
	(7, 'Halls of Stone', 2, 2, 1, 571, 8922.12, -1009.16, 1039.56, 1.57044, 2, 4),
	(7, 'Utgarde Keep', 2, 2, 1, 571, 1203.41, -4868.59, 41.2486, 0.283237, 2, 4),
	(7, 'Utgarde Pinnacle', 2, 2, 1, 571, 1203.41, -4868.59, 41.2486, 0.283237, 2, 4),
	(8, 'The Deadmines', 2, 2, 1, 0, -11207.5, 1668.63, 24.6236, 1.57653, 3, 4),
	(8, 'Shadowfang Keep', 2, 2, 1, 0, -245.125, 1534.57, 76.8901, 1.19669, 3, 4),
	(8, 'Grim Batol', 2, 2, 1, 0, -4062.23, -3450.43, 280.571, 0.390264, 3, 4),
	(8, 'Zul`Aman', 2, 2, 1, 530, 6851.17, -7948.45, 170.062, 4.69422, 3, 4),
	(8, 'Zul`Gurub', 2, 2, 1, 0, -11916.5, -1204.58, 92.2878, 4.72916, 3, 4),
	(8, 'The Stone Core', 2, 2, 1, 646, 1020.98, 654.497, 156.671, 4.93353, 3, 4),
	(8, 'Hour of Twilight', 2, 2, 1, 1, -8292.75, -4554.54, -222.483, 4.71085, 3, 4),
	(8, 'Well of Eternity', 2, 2, 1, 1, -8602.99, -4031.28, -208.407, 1.24782, 3, 4),
	(8, 'End Time', 2, 2, 1, 1, -8327.62, -4475.43, -208.856, 0.500819, 3, 4),
	(8, 'The Vortex Summit', 2, 2, 1, 1, -11505.6, -2303.35, 608.394, 3.8142, 3, 4),
	(8, 'Throne of the Tides', 2, 2, 1, 0, -5598.15, 5412.42, -1798.71, 5.56149, 3, 4),
	(8, 'Hall of Origination', 2, 2, 1, 1, -10188.5, -1837.93, 20.1277, 3.14146, 3, 4),
	(8, 'Blackrock Caves', 2, 2, 1, 0, -7571.9, -1317.19, 245.536, 4.84243, 3, 4),
	(9, 'Blackwing Decent', 2, 2, 1, 0, -7533.68, -1209.04, 477.726, 1.95362, 3, 4),
	(9, 'Throne of the 4 Winds', 2, 2, 1, 1, -11355.2, 58.1521, 723.884, 1.97667, 3, 4),
	(9, 'Baradin Hold', 2, 2, 1, 732, -1251.94, 1050.39, 106.995, 3.15848, 3, 4),
	(9, 'The Twilight Bastion', 2, 2, 1, 0, -4884.35, -4253.97, 827.764, 2.06074, 3, 4),
	(9, 'The Firelands', 2, 2, 1, 1, 3993.74, -2956.99, 1002.55, 1.96621, 3, 4),
	(9, 'Dragon Soul Entrance', 2, 2, 1, 1, -8273.35, -4517.36, -219.334, 0.558964, 3, 4),
	(10, 'Black Temple', 2, 2, 1, 530, -3649.92, 317.469, 35.2827, 2.94285, 1, 4),
	(10, 'BlackWing Lair', 2, 2, 1, 229, 152.451, -474.881, 116.84, 0.001073, 0, 4),
	(10, 'Hyjal Summit', 2, 2, 1, 530, -8177.89, -4181.23, -167.552, 0.913338, 1, 4),
	(10, 'Serpentshrine Cavern', 2, 2, 1, 530, 797.855, 6865.77, -65.4165, 0.005938, 1, 4),
	(10, 'Trial of the Crusader', 2, 2, 1, 571, 8515.61, 714.153, 558.248, 1.57753, 1, 4),
	(10, 'Gruul`s Lair', 2, 2, 1, 530, 3530.06, 5104.08, 3.50861, 5.51117, 1, 4),
	(10, 'ICC', 2, 2, 1, 571, 5786.5, 2069.9, 636.065, 3.57899, 1, 4),
	(10, 'Karazhan', 2, 2, 1, 0, -11118.9, -2010.33, 47.0818, 0.649895, 0, 4),
	(10, 'Molten Core', 2, 2, 1, 230, 1126.64, -459.94, -102.535, 3.46095, 0, 4),
	(10, 'Naxxramas', 2, 2, 1, 571, 3668.72, -1262.46, 243.622, 4.785, 1, 4),
	(10, 'Onyxia`s Lair', 2, 2, 1, 1, -4708.27, -3727.64, 54.5589, 3.72786, 0, 4),
	(10, 'Ruins of Ahn`Qiraj', 2, 2, 1, 1, -8409.82, 1499.06, 27.7166, 2.41265, 0, 4),
	(10, 'Sunwell Platue', 2, 2, 1, 530, 12574.1, -6774.81, 15.0904, 3.13788, 1, 4),
	(10, 'The Eye', 2, 2, 1, 530, 3088.49, 1381.57, 184.863, 4.61973, 1, 4),
	(10, 'Temple of Ahn`Qiraj', 2, 2, 1, 1, -8240.09, 1991.32, 129.072, 0.941603, 0, 4),
	(10, 'The Eye of Eternity', 2, 2, 1, 571, 3784.17, 7028.84, 161.258, 5.79993, 1, 4),
	(10, 'The Obsidian Sanctum', 2, 2, 1, 571, 3472.43, 264.923, -120.146, 3.27923, 1, 4),
	(10, 'Ulduar', 2, 2, 1, 571, 9333.45, -1114.74, 1245.15, 6.24408, 1, 4),
	(10, 'Vault of Archavon', 2, 2, 1, 571, 5453.72, 2840.79, 421.277, 0, 1, 4),
	(10, 'Zul`Gurub', 2, 2, 1, 0, -11916.2, -1215.71, 92.289, 4.72454, 0, 4),
	(10, 'Zul`Aman', 2, 0, 1, 530, 6851.78, -7972.57, 179.242, 4.64691, 1, 4),
	(11, 'Orgrimmar', 1, 1, 1, 1, 1600.98, -4378.82, 9.99832, 5.24819, 0, 4),
	(11, 'IronForge', 1, 0, 1, 0, -4902, -960.816, 501.459, 2.20724, 0, 4),
	(11, 'Shattrath', 1, 2, 1, 530, -1887.62, 5359.09, -12.4279, 1.25883, 1, 4),
	(12, 'StormWind', 2, 0, 1, 0, -8842.09, 626.358, 94.0866, 0.44062, 0, 4),
	(12, 'Darnassus', 2, 0, 1, 1, 9870.21, 2493.47, 1315.88, 5.97454, 0, 4),
	(12, 'Exodar', 2, 0, 1, 530, -3864.92, -11643.7, -137.644, 2.41023, 1, 4),
	(12, 'Thunder Bluff', 2, 1, 1, 1, -1274.45, 71.8601, 128.159, 0.707645, 0, 4),
	(12, 'Undercity', 2, 1, 1, 0, 1637.21, 240.132, -43.1034, 3.13147, 0, 4),
	(12, 'Silvermoon City', 2, 1, 1, 530, 9741.67, -7454.19, 13.5572, 3.14231, 1, 4),
	(12, 'Dalaran', 2, 2, 1, 571, 5807.06, 506.244, 657.576, 5.54461, 1, 4),
	(12, 'Booty Bay', 2, 2, 1, 0, -14282, 552.414, 8.90494, 4.06379, 0, 4),
	(12, 'GuruBashi Arena', 9, 2, 1, 0, -13232.2, 220.996, 32.1451, 1.09563, 0, 4),
	(14, 'GM Island', 1, 3, 1, 1, 16205.7, 16215.5, 1.10999, 1.06495, 0, 4);