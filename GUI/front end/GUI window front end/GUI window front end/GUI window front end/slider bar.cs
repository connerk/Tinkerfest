using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Audio;
using Microsoft.Xna.Framework.Content;
using Microsoft.Xna.Framework.GamerServices;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input;
using Microsoft.Xna.Framework.Media;

namespace GUI_window_front_end
{
    class SliderBar
    {
        //bring MouseCursor into the class so we can use the mouseCursor
        MouseCursor mouseCursor = new MouseCursor();

        //the pictures you will see
        public Texture2D tab, bar;

        //the boxes that will contain the pictures
        public Rectangle tabBox, barBox;

        //height and width of pictures in integer format
        public Vector2  tabSize = new Vector2(0,0), barSize = new Vector2(200,50);

        //the placement of the pictures in integer format
        public Vector2 barPlace = new Vector2(100, 50);

        //constuctor
        public SliderBar()
        {

        }

        //Loading all textures and rectangles used in this class
        public void LoadContent (ContentManager Content)
        {
            //Loading the tab picture as a texture
            tab = Content.Load<Texture2D>("small slider cursor");

            //Loading the slider bar picture as a texture
            bar = Content.Load<Texture2D>("slider bar");

            //getting size of tab texture for later use
            tabSize.X = tab.Width/2;
            tabSize.Y = tab.Height/2;

            //make tabBox into a rectangle to contain our tab sprite
            tabBox = new Rectangle(0, 0, (int)tabSize.X, (int)tabSize.Y);

            //make barBox into a rectangle to contain our bar sprite
            barBox = new Rectangle((int)barPlace.X, (int)barPlace.Y, (int)barSize.X, (int)barSize.Y);

            //bring mouseCursor content into class
            mouseCursor.LoadContent(Content);
        }

        //all controls and logic behind the mechanics
        public void Update(GameTime gameTime)
        {
            //let game use mouse
            MouseState mouse = Mouse.GetState();

            //bring mouseCursor controls into class
            mouseCursor.Update(gameTime);

            //keeps tabBox at the correct height
            tabBox.Y = barBox.Y + (int)barSize.Y/2;

            //checks to see if mouseBox and tabBox are in the same place, and if the left mouse button is pressed
            if (mouseCursor.mouseBox.Intersects(tabBox) && ButtonState.Pressed == mouse.LeftButton)
            {
                //if above is true put the tab in the same place as the mouse
                tabBox.X = mouseCursor.mouseBox.X;
            }

            // checks to see if the tab goes to far left
            if (tabBox.X < barBox.X)
            {
                //stop it from going any farther left
                tabBox.X = barBox.X;
            }

            //checks to see if the tab goes to far to the right
            if (tabBox.X > barBox.X + (int)barSize.X - (int)tabSize.X)
            {
                //stop it from going any farther right
                tabBox.X = barBox.X + (int)barSize.X - (int)tabSize.X;
            }
            
        }

        //drawing the sprites using textures and rectangles
        public void Draw(SpriteBatch spritebatch)
        {
            //begin drawing sprites
            spritebatch.Begin();

            //draw bar texture within barBox rectangle
            spritebatch.Draw(bar, barBox, Color.White);

            //draw tab texture within tabBox rectangle
            spritebatch.Draw(tab, tabBox, Color.White);

            //finish drawing sprites
            spritebatch.End();
        }
    }
}
