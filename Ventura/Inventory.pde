PImage weapon;
String usedweapon = "weap_sword_basic";

void checkinv(){
  checkweapon();
}

void checkweapon(){
  if(usedweapon.equals("weap_sword_basic")){ weapon = weap_sword_basic; }
  weapon = weap_sword_basic;
}