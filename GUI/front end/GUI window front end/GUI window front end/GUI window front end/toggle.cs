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
    class Toggle
    {
        MouseCursor mouseCursor = new MouseCursor();

        MouseState oldMouseState;

        public Vector2 togglePlace = new Vector2(100,150);

        public Texture2D trans;

        public Rectangle toggleBox;

        public SpriteFont font;

        public string option1 = "diamond", option2 = "plate";

        public int optionSelected = 1, optionNumber = 2;

        public Toggle()
        {

        }

        public void Initialize()
        {
            oldMouseState = Mouse.GetState();
        }

        //Loading all textures and rectangles used in this class
        public void LoadContent(ContentManager Content)
        {
            font = Content.Load<SpriteFont>("SpriteFont1");

            trans = Content.Load<Texture2D>("white");

            toggleBox = new Rectangle((int)togglePlace.X - 5, (int)togglePlace.Y - 5, 0, 0);

            mouseCursor.LoadContent(Content);
        }




        //all controls and logic behind the mechanics
        public void Update(GameTime gameTime)
        {
            KeyboardState keys = Keyboard.GetState();

            toggleBox.Width = 100;
            toggleBox.Height = 35;

            mouseCursor.Update(gameTime);

            MouseState newMouseState = Mouse.GetState();

            if (mouseCursor.mouseBox.Intersects(toggleBox))
            {
                if (ButtonState.Pressed == newMouseState.LeftButton)
                {
                    if (ButtonState.Released == oldMouseState.LeftButton)
                    {

                        if (optionSelected == 1)
                        {
                            optionSelected +=1;
                        }
                        else if (optionSelected == 2)
                        {
                            optionSelected += 1;
                        }
                        else if (optionSelected >= optionNumber)
                        {
                            optionSelected = 1;
                        }
                    }
                }
                else if (ButtonState.Pressed == oldMouseState.LeftButton)
                {

                }

                oldMouseState = newMouseState;
            }
        }

        //drawing the sprites using textures and rectangles
        public void Draw(SpriteBatch spritebatch)
        {

            spritebatch.Begin();

            spritebatch.Draw(trans, toggleBox, Color.White);

            if (optionSelected == 1)
            {
                spritebatch.DrawString(font, option1, togglePlace, Color.Maroon);
            }
            if (optionSelected == 2)
            {
                spritebatch.DrawString(font, option2, togglePlace, Color.Maroon);
            }

            spritebatch.End();
        }
    }
}
