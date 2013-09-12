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
    class MouseCursor
    {
        public Texture2D mouseTexture;

        public Rectangle mouseBox;

        public int cursorSizeX, cursorSizeY;

        public MouseCursor()
        {

        }

        //Loading all textures and rectangles used in this class
        public void LoadContent(ContentManager Content)
        {


            //Loading the tab picture as a texture
            mouseTexture = Content.Load<Texture2D>("small mouse cursor");

            //getting size of tab texture for later use
            cursorSizeX = mouseTexture.Width;
            cursorSizeY = mouseTexture.Height;

            //make box into a rectangle to hold our sprite
            mouseBox = new Rectangle(0, 0, cursorSizeX, cursorSizeY);
        }

        //all controls and logic behind the mechanics
        public void Update(GameTime gameTime)
        {
            //let game use mouse
            MouseState mouse = Mouse.GetState();

            //make box's position match the mouse's position
            mouseBox.X = mouse.X;
            mouseBox.Y = mouse.Y;
        }

        //drawing the sprites using textures and rectangles
        public void Draw(SpriteBatch spritebatch)
        {
            //begin drawing sprites
            spritebatch.Begin();

            //draw uor mouseTexture within our mouse box
            spritebatch.Draw(mouseTexture, mouseBox, Color.White);

            spritebatch.End();
        }
    }
}
