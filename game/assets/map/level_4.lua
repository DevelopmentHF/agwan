return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.10.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 20,
  height = 18,
  tilewidth = 8,
  tileheight = 8,
  nextlayerid = 6,
  nextobjectid = 57,
  properties = {},
  tilesets = {
    {
      name = "spritesheet",
      firstgid = 1,
      class = "",
      tilewidth = 8,
      tileheight = 8,
      spacing = 0,
      margin = 0,
      columns = 8,
      image = "../spritesheet.png",
      imagewidth = 64,
      imageheight = 64,
      objectalignment = "unspecified",
      tilerendersize = "tile",
      fillmode = "stretch",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 8,
        height = 8
      },
      properties = {},
      wangsets = {},
      tilecount = 64,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 20,
      height = 18,
      id = 1,
      name = "ground",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 1, 1,
        1, 1, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 0, 0, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 6, 0, 0, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 0, 0, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 6, 0, 0, 1, 1,
        1, 1, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1,
        1, 1, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 20,
      height = 18,
      id = 4,
      name = "hidden",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 25, 25, 0, 0, 25, 25, 0, 25, 25, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 25, 25, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 25, 25, 0, 0, 0, 25, 25, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 5,
      name = "level",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 32,
          name = "spawn",
          type = "",
          shape = "rectangle",
          x = 25.0123,
          y = 26.4714,
          width = 1.63354,
          height = 1.71076,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 33,
          name = "end",
          type = "",
          shape = "rectangle",
          x = 19.2333,
          y = 114.501,
          width = 14.7038,
          height = 11.8242,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 2,
      name = "solid",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      tintcolor = { 255, 0, 0 },
      properties = {},
      objects = {
        {
          id = 34,
          name = "",
          type = "",
          shape = "rectangle",
          x = 18.5542,
          y = 32.4067,
          width = 109.204,
          height = 14.8448,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 56,
          name = "",
          type = "",
          shape = "rectangle",
          x = 15.893,
          y = 1.13727,
          width = 130.273,
          height = 14.8448,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 51,
          name = "",
          type = "",
          shape = "rectangle",
          x = 18.3386,
          y = 96.2273,
          width = 109.204,
          height = 14.8448,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 53,
          name = "",
          type = "",
          shape = "rectangle",
          x = 144.082,
          y = 13.7293,
          width = 10.9609,
          height = 130.83,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 54,
          name = "",
          type = "",
          shape = "rectangle",
          x = 52.491,
          y = 45.664,
          width = 10.9609,
          height = 51.6584,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 55,
          name = "",
          type = "",
          shape = "rectangle",
          x = 6.36307,
          y = 15.7252,
          width = 10.9609,
          height = 16.619,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 52,
          name = "",
          type = "",
          shape = "rectangle",
          x = 11.0078,
          y = 128.138,
          width = 133.568,
          height = 14.8448,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 50,
          name = "",
          type = "",
          shape = "rectangle",
          x = 80.4343,
          y = 64.5326,
          width = 109.204,
          height = 14.8448,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 35,
          name = "",
          type = "",
          shape = "rectangle",
          x = 5.76016,
          y = 154.512,
          width = 22.9807,
          height = 26.7662,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 42,
          name = "",
          type = "",
          shape = "rectangle",
          x = 130.973,
          y = 157.286,
          width = 7.93839,
          height = 4.97151,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 3,
      name = "death",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {
        ["collidable"] = false
      },
      objects = {
        {
          id = 18,
          name = "death",
          type = "",
          shape = "rectangle",
          x = 48.3148,
          y = 28.6651,
          width = 15.6066,
          height = 3.85525,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = false
          }
        },
        {
          id = 44,
          name = "death",
          type = "",
          shape = "rectangle",
          x = 79.8172,
          y = 28.5167,
          width = 15.6066,
          height = 3.85525,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = false
          }
        },
        {
          id = 45,
          name = "death",
          type = "",
          shape = "rectangle",
          x = 104.397,
          y = 28.2524,
          width = 15.6066,
          height = 3.85525,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = false
          }
        },
        {
          id = 46,
          name = "death",
          type = "",
          shape = "rectangle",
          x = 104.397,
          y = 61.0254,
          width = 15.6066,
          height = 3.85525,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = false
          }
        },
        {
          id = 47,
          name = "death",
          type = "",
          shape = "rectangle",
          x = 96.2037,
          y = 124.986,
          width = 15.6066,
          height = 3.85525,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = false
          }
        },
        {
          id = 49,
          name = "death",
          type = "",
          shape = "rectangle",
          x = 63.3907,
          y = 55.7283,
          width = 5.81197,
          height = 32.0519,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = false
          }
        },
        {
          id = 48,
          name = "death",
          type = "",
          shape = "rectangle",
          x = 56.0303,
          y = 124.986,
          width = 15.6066,
          height = 3.85525,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = false
          }
        }
      }
    }
  }
}
