/*

   bodyOs

   ##### what is it #####

   This source is a simple multi-task Operating system you can use to control micro chips inside your body to : 
   Apply drug electricly ,see visions or send vocal messages from the inside of the body , or detect and save new drugs signals to apply after
   The system contains master microchips in the bones with batteries charged by electric induction ,
   and most small microchips placed where dont have space like eye nerve and alimented by the master notes by induction like rfid
   All the system is open-source you can verify sec because can have big danger like controll by another 
   
   ##### technical details ######

   the hardware system is composed of one or many master nodes 
   for the master nodes you can choose between differents microchip pic like 16f2550
   have too many little sto23 pic nodes like 10f222

   the masters pics and slaves are connected between them with simple radio waves
   the masters have wifi gsm and simple radio waves connection possibility
   a micro sd card is used in the system
   the software have a boot-loader and the ide with the sub-programme uploader : http://www.pinguino.cc/
   you must first put pinguino boot-loader on pic with a pic programmer and after you can upload the os by usb before  
	kernel : multitask and finger nerve sequence command detection or another nerve you can choose
	user apps : play saveds sinusoidal signals on nerves like vagus for drugs electric administration , eye and hear to see visions and hearing voices
		    automatic traduction of hearing voices from the inside of the body
		    wifi and gsm tcp/ip streaming server for eye vision or saving records on micro sd card in the master chip inside the bone
		    text editor with choice of letters by fingers or another nerv like eye keyboard where you can choose letters by moove your eyes on the letter you whant
		    ftp
		    text or voice chat
		    clock you can hear
		    calculator controled by finger
		    fileManager controled by
   Electronics security verifications before implantation ,
   electronic schematics for the intire system and cirurgical instructions are in progress 

   Created may 2016 by brahimi karim
   For any sugjestions or questions do not hesitate to send me a email to :
   brahimi.karim@hotmail.fr

*/

//########## variables globales ############

//noms cmds
cmd_name[1]="Menu";
cmd_name[2]="Config";
cmd_name[3]="PlayNerv";
cmd_name[4]="RecNerv";
cmd_name[5]="FileManager";
cmd_name[6]="TextEditor";
cmd_name[7]="Irc";
cmd_name[8]="ftp";
traductor
cmd_name[9]="SwitchTask";
cmd_name[10]="ps";
cmd_name[11]="kill";

// sequences cmds
command_sequence[1]={0,0,0,0}
command_sequence[2]={0,0,0,1}
command_sequence[3]={0,0,1,0}
command_sequence[4]={0,0,1,1}
command_sequence[5]={0,1,0,0}
command_sequence[6]={0,1,0,1}
command_sequence[7]={0,1,1,0}
command_sequence[8]={0,1,1,1}
command_sequence[9]={1,0,0,0}
command_sequence[10]={1,0,0,1}
command_sequence[11]={1,0,1,0}

// number of user apps and apps status
nb_apps=11;
nb_app_status[9];

// first and last input pin number
nb_first_input=1;
nb_last_pin_input=6;

// first and last output pin number
nb_first_output=6;
nb_last_pin_output=14;

// parallel 
nb_parallel_tasks=12;
nb_parallel_msgs=12;

// number of sd cards and pins
nb_sd_cards=4;
nb_first_sd_pin=15;
nb_last_sd_pin=18;


baterieFaible.wav
0pingNodes.wav

//############## os initialisation ###########

// input ouput pins initialisation for user apps
void init_pins(){
	// input pins initialisation
	for (pin = nb_first_input; pin < nb_last_pin_input; pin++)  { pinMode(iPins[i], INPUT); }
	// output pins initialisation
	for (pin = nb_first_output; pin < nb_last_pin_output; pin++)  { pinMode(iPins[o], OUTPUT); }
}

// sd cards initialisation
void init_sd(){
	for(i=nb_first_sd_pin;i<=nb_last_sd_pin;i++) { sd.mount(i,i); }
}

// main init function executed 1 time only at boot
void setup(){
	init_pins();
	init_sd();
	load_os_msgs_from_sd();
	load_drugs_from_sd();	
}


// ############ kernel ###########
// main loop function executed indefinitly
void loop(){
	// execute terminal and 
	cmd_exists=term();
	// if a command is asked in the terminal execute her 
	if(cmd_exists==1) { exec(cmd); }
	if(cmd_exists==0) { exec(0);}
	//gestion du temps de commutation du scheduler
	cmd=temporisator();
	//sheduleur de gestion des entre sorti
	io_scheduler(cmd);
}

int term(){
	// valeur doights de commande
		value_apontador_finger=analog_read(i);
		value_middle_finger=analog_read(i);
	//
	if(value_apontador_finger==255) { }
	if() { cmd[nb_champ_seq]=1; nb_champ_seq++;}
	//
	if(value_middle_finger==255) { }

	}
	if(value_middle_finger<=10 && cmd[-1]==1) { cmd[nb_champ_seq]=0; }

	if(value_apontador_finger==255 && cmd[1]==0) { cmd[nb_champ_seq]=1; }
// if cmd array is
if(nb_champ_seq==nb_last_champ_seq) { return 1; }
if(nb_champ_seq!=nb_last_champ_seq) { return 0; }
nb_champ_seq++;
}

// lancer apps de la commande 
void exec(seq[],if_cmd){

	// verifier si il y a une commande valide
	for(i=1;i<=nb_cmds;i++){
		if(cmd_sequence[i]==seq[]){ cmd=i; cmd_found=1;}
	}
	// si pas de commande rien ,si commande mettre a zero cmd_found
	if(cmd_found==1){ cmd_found==0; }
	else{ cmd=0; }
	return cmd;
}
void temporisator(cmd){
	switch(cmd){
	case 0;// rien

	case 1;// Menu
		nb_app_lance[1]==1;
		
		break;
	case 2;// Config
		stream_Nerv_to_network==1

		break;
	case 3;// PlayNerv
		tmp_between_all_ios=-100;

		break;
	case 4;// RecNerv

		break;
	case 5;// FileManager

		break;
	case 6;// TextEditor

		break;
	case 7;// Irc

		break;
	case 8;// ftp

		break;
	case 9;// ps

		break;
	case 10;// kill

		break;
	}
}

/* 

	Enregistrement sur tableau de la valeur de chaque pin dentree et ecriture sur pins de sortie depuis un autre tableau
	Vu que les pins sont seulement lu quand apps lancer , les temps entre chaque lecture change selon le nombre dappli lancer

*/ 
void io_sheduler(tmp_sleep_between_apps_&_apps,value_output[]){
	// temps dattente entre chaque boucle de R/W des ios
	sleep(tmp_between_all_ios);
	// pour ajouter le temps d'une lecture si pas de lecture
	int tmp_inter_lecture=0;
	// recuperation des valeurs des pins demandes 
	for(i=1;i<=nb_last_pin_output;i++){ 
		// si input ouverte par app ,stocker sur tableau la valeur et definir a 0 temps dattente jusqu'a prochaine lecture
		if(read_input[i]==1) { value_input[i]=analog_read(i); tmp_inter_lecture=0; }
		// si input ferme ajouter du temps dattente jusqua prochaine lecture de pin 
		// comme si il y avait une lecture pour eviter des temps differents entre chaque lecture dune pin
		if(read_input[i]==0) { tmp_inter_lecture=+10; }
		// attente depuis derniere lecture
		microsleep(tmp_inter_lecture);		
	}

	// ecriture sur les pins ouverts par les apps
	for(i=nb_first_pin;i<=nb_last_pin_input;i++){
		// si ouput ouverte par app ecrire sur la pin depuis tableau
		if(input_i==1) { value_output[i]=analog_write(i); }
		// temps d'attente jusqu'a prochaine lecture
		sleep(tmp_inter_read_);
	}

}

/*


*/

void app_scheduler() {


}



void write()
void read()


//################### user apps ################
void Menu() { 

for(){

}

}
void Config() { 
date et heure
connect to wifi
connect to gsm

}
void PlayNerv() { 

}
void RecNerv() { 

}
void FileManager() { 
ls
rm
cp

}
void TextEditor() { 

}
// tchatch 
void irc() { 

}

// voir toutes les applis en execution
void ps() { 
	for(i=2;i<=nb_apps;i++){
		if(nb_app_on_off[i]==1) { play_nerv(device,cmd_name[i]"_sequence.wav"); }
	}
}
// tuer processus en execution
void kill(id_app) { 
	switch(id_app){
		case 0;

		case 1;
			nb_app_status[1]=0;
		case 2;
			nb_app_status[2]=0;
		case 3;
			nb_app_status[3]=0;
		case 4;
			nb_app_status[4]=0;
		case 4;
			nb_app_status[5]=0;
		case 6;
			nb_app_status[6]=0;
		case 7;
			nb_app_status[7]=0;
		case 8;
			nb_app_status[8]=0;
		case 9;
			nb_app_status[9]=0;
	}
}

void printWifiStatus()

void print_version(){
	play_nerve("/dev/oreille","version_chip_body_os.wav");
	Serial.printf("************************\n");
	Serial.printf("*  chip body os 0.1    *\n");
	Serial.printf("************************\n");
}
