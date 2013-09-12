using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Audio;
using Microsoft.Xna.Framework.Content;
using Microsoft.Xna.Framework.GamerServices;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input;
using Microsoft.Xna.Framework.Media;

namespace GUI_window_front_end
{
    /// <summary>
    /// This is the main type for your game
    /// </summary>
    public class Game1 : Microsoft.Xna.Framework.Game
    {
        //lets game render complex graphics like pictures
        GraphicsDeviceManager graphics;

        //tells the game to render pictures where this is mentoined
        SpriteBatch spriteBatch;

        //let the game use sliderBar class and everything in it
        SliderBar sliderBar = new SliderBar();

        //let the game use MouseCursor class and everything in it
        MouseCursor mouseCursor = new MouseCursor();

        //let the game use Toggle class and everything in it
        Toggle toggle = new Toggle();

        //constuctor
        public Game1()
        {
            graphics = new GraphicsDeviceManager(this);

            //setting game to window mode insted of full screen (this will be set to true when finished)
            graphics.IsFullScreen = false;

            //setting window size
            graphics.PreferredBackBufferWidth = 800;
            graphics.PreferredBackBufferHeight = 600;

            Content.RootDirectory = "Content";
        }


        protected override void Initialize()
        {
            sliderBar.barPlace = new Vector2(300, 100);

            toggle.togglePlace = new Vector2(400, 20);

            toggle.option1 = "word";

            base.Initialize();
        }

        //Loading all external files use in game
        protected override void LoadContent()
        {
            // Create a new SpriteBatch, which can be used to draw textures.
            spriteBatch = new SpriteBatch(GraphicsDevice);

            //bring sliderBar content into main game
            sliderBar.LoadContent(Content);

            //bring mouseCursor content into main game
            mouseCursor.LoadContent(Content);

            //bring toggle content int main game
            toggle.LoadContent(Content);
        }

        //unloading files from game
        protected override void UnloadContent()
        {

        }

        //lets game change variable values during gameplay
        protected override void Update(GameTime gameTime)
        {
            //tells game to watch keyboard and allows you to asign buttons to tasks
            KeyboardState keys = Keyboard.GetState();

            // tells game to close if escape button is pressed
            if (keys.IsKeyDown(Keys.Escape)) Exit();

            //bring sliderBar controls into game
            sliderBar.Update(gameTime);

            //bring mouseCursor controls into main game
            mouseCursor.Update(gameTime);

            //bring toggle controls into main game
            toggle.Update(gameTime);

            //finish updating game values
            base.Update(gameTime);
        }

        //where all picture drawing takes place
        protected override void Draw(GameTime gameTime)
        {
            //background color
            GraphicsDevice.Clear(Color.CornflowerBlue);

            //draw the sliderBar sprites
            sliderBar.Draw(spriteBatch);

            //draw toggle sprites
            toggle.Draw(spriteBatch);

            //draw mouseCursor sprites
            mouseCursor.Draw(spriteBatch);

            //begin drawing sprites
            spriteBatch.Begin();

            //finish drawing sprites
            spriteBatch.End();

            base.Draw(gameTime);
        }
    }
}
