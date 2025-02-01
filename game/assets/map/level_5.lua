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
  nextlayerid = 7,
  nextobjectid = 64,
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
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 1, 1, 1, 1,
        1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14, 1, 1, 1, 1,
        1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 15, 0, 0, 0, 0, 13, 5, 1, 1, 1,
        1, 1, 1, 1, 0, 0, 0, 0, 0, 28, 1, 30, 0, 0, 0, 0, 0, 13, 1, 1,
        1, 1, 1, 6, 0, 0, 0, 0, 0, 28, 1, 30, 0, 0, 0, 0, 0, 0, 1, 1,
        1, 1, 11, 0, 0, 0, 0, 0, 0, 28, 1, 30, 0, 0, 0, 0, 0, 14, 1, 1,
        1, 1, 12, 0, 0, 0, 0, 0, 0, 0, 31, 0, 0, 0, 0, 0, 3, 1, 1, 1,
        1, 1, 1, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 21, 0, 0, 0, 0, 0, 25, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 17, 0, 18, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
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
          x = 21.8407,
          y = 90.6959,
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
          x = 135.789,
          y = 67.4556,
          width = 5.1891,
          height = 18.9603,
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
          x = 40.1639,
          y = 121.655,
          width = 103.383,
          height = 10.1014,
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
          x = 16.706,
          y = 95.4734,
          width = 22.9807,
          height = 26.7662,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 37,
          name = "",
          type = "",
          shape = "rectangle",
          x = 127.981,
          y = 88.0306,
          width = 16.3741,
          height = 33.3345,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 58,
          name = "",
          type = "",
          shape = "rectangle",
          x = 80.1628,
          y = 64.2124,
          width = 7.64683,
          height = 23.5163,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 60,
          name = "",
          type = "",
          shape = "rectangle",
          x = 104.163,
          y = 40.2124,
          width = 26.5559,
          height = 15.3345,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 61,
          name = "",
          type = "",
          shape = "rectangle",
          x = 29.981,
          y = 8.93969,
          width = 99.8286,
          height = 15.3345,
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
          x = 96.264,
          y = 95.9688,
          width = 23.3653,
          height = 4.97151,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 54,
          name = "temp",
          type = "",
          shape = "rectangle",
          x = 56.0428,
          y = 88.0084,
          width = 7.7289,
          height = 4.97151,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = false,
            ["temp"] = true
          }
        },
        {
          id = 55,
          name = "temp",
          type = "",
          shape = "rectangle",
          x = 31.952,
          y = 72.0875,
          width = 7.7289,
          height = 4.97151,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = false,
            ["temp"] = true
          }
        },
        {
          id = 56,
          name = "temp",
          type = "",
          shape = "rectangle",
          x = 64.0033,
          y = 55.7476,
          width = 7.7289,
          height = 4.97151,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = false,
            ["temp"] = true
          }
        },
        {
          id = 36,
          name = "",
          type = "",
          shape = "rectangle",
          x = -5.31216,
          y = 30.6097,
          width = 22.9807,
          height = 65.1216,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 38,
          name = "",
          type = "",
          shape = "rectangle",
          x = 142.495,
          y = 22.7002,
          width = 22.9807,
          height = 65.1216,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 45,
          name = "",
          type = "",
          shape = "rectangle",
          x = 128.459,
          y = -1.18115,
          width = 22.9807,
          height = 65.1216,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 46,
          name = "",
          type = "",
          shape = "rectangle",
          x = 8.84325,
          y = 14.7398,
          width = 22.9807,
          height = 65.1216,
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
          x = 40.1724,
          y = 117.321,
          width = 87.2781,
          height = 3.85525,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = false
          }
        },
        {
          id = 57,
          name = "death",
          type = "",
          shape = "rectangle",
          x = 75.4451,
          y = 64.2301,
          width = 4.36904,
          height = 23.4916,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = false
          }
        },
        {
          id = 62,
          name = "death",
          type = "",
          shape = "rectangle",
          x = 87.0815,
          y = 64.2301,
          width = 5.45995,
          height = 23.4916,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = false
          }
        },
        {
          id = 59,
          name = "death",
          type = "",
          shape = "rectangle",
          x = 80.3542,
          y = 60.7755,
          width = 7.45995,
          height = 3.12798,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = false
          }
        },
        {
          id = 63,
          name = "death",
          type = "",
          shape = "rectangle",
          x = 80.1724,
          y = 87.5028,
          width = 7.45995,
          height = 3.12798,
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
          x = 102.435,
          y = 92.4221,
          width = 11.3097,
          height = 3.24923,
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
