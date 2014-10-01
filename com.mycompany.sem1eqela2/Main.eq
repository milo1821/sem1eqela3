
/*
 * Main.eq
 * Generated by Eqela Studio 2.0b7.4
 */

public class Main: SEScene {
	SESprite bg;
	SESprite fg;
	SESprite gg;
	SESprite text;
	bool move_right = true;
	bool move_left = false;
	bool move_down = true;
	bool move_up = false;
	int speed;
	int bounce;
	String my_text;
	double rotation;
	SESprite my_image;

	public void initialize(SEResourceCache rsc) {
		base.initialize(rsc);
		speed = 100;
		bg = add_sprite_for_color(Color.instance("blue"),get_scene_width(), get_scene_height());
		bg.move(0,0);

	//	fg = add_sprite_for_color(Color.instance("green"),get_scene_width()*0.1, get_scene_height()*0.1);
	//	fg.move(100,100);

	//	gg = add_sprite_for_color(Color.instance("red"),get_scene_width()*0.1, get_scene_height()*0.1);
	//	gg.move(100,150);

		rsc.prepare_font("myfont","arial bold color=white",40);
		text = add_sprite_for_text("BOUNCING RECTANGLE", "myfont");
		text.move(0,get_scene_height()-text.get_height());
		rsc.prepare_image("temp","mclovin",get_scene_width()*0.1,get_scene_height()*0.1);
		fg= add_sprite_for_image(SEImage.for_resource("temp"));
		fg.move(100,100);
		
		
	}


	


	public void update(TimeVal now, double delta) {
		speed+=100; rotation+=MathConstant.M_PI_4/10;
		fg.set_rotation(rotation);
		if(move_right){
			fg.move(fg.get_x()+delta*speed, fg.get_y());
			if(fg.get_x()+fg.get_width() > get_scene_width()){
					
				move_right=false;
				move_left=true;
				speed=500;
						bounce++;
				my_text="BOUNCE: %d".printf().add(Primitive.for_integer(bounce)).to_string();
				text.set_text(my_text,"myfont");
				
				}
			}

		if(move_left) {
			fg.move(fg.get_x()-delta*speed,fg.get_y());
			if(fg.get_x() < 0 )
			{
				move_right = true;
				move_left = false;
				speed=500;
						bounce++;
				my_text="BOUNCE: %d".printf().add(Primitive.for_integer(bounce)).to_string();
				text.set_text(my_text,"myfont");
				
			}
		} 

		if(move_down){
			fg.move(fg.get_x(), fg.get_y()+delta*speed);
			if(fg.get_y()+fg.get_height() > get_scene_height()){
					
				move_down=false;
				move_up=true;
				speed=100;
						bounce++;
				my_text="BOUNCE: %d".printf().add(Primitive.for_integer(bounce)).to_string();
				text.set_text(my_text,"myfont");
				
			
				}
			}

		if(move_up) {
			fg.move(fg.get_x(),fg.get_y()-delta*speed);
			if(fg.get_y() < 0 )
			{
				move_down = true;
				move_up = false;
				speed=100;
						bounce++;
				my_text="BOUNCE: %d".printf().add(Primitive.for_integer(bounce)).to_string();
				text.set_text(my_text,"myfont");
				
			}
		}		

		
	}


	public void set_rotation(double angle) {
		rotation = angle;
	}

	public double get_rotation() {
		return(rotation);
	}
	
}
