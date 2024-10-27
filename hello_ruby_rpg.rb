# frozen_string_literal: true

require 'ruby_rpg'

ASSETS_DIR = File.expand_path(File.join(File.dirname(__FILE__), 'assets'))
ROOT = File.expand_path(File.join(__dir__), "assets")

Engine.start(base_dir: File.dirname(__FILE__)) do
  Engine::GameObject.new(
    "Direction Light",
    rotation: Vector[-60, 180, 30],
    components: [
      Engine::Components::DirectionLight.new(
        colour: Vector[1.4, 1.4, 1.2],
      )
    ])

  Engine::GameObject.new(
    "Camera",
    pos: Vector[0, 0, 0],
    rotation: Vector[0, 0, 0],
    components: [
      Engine::Components::PerspectiveCamera.new(fov: 45.0, aspect: 1920.0 / 1080.0, near: 0.1, far: 1000.0)
    ])

  material = Engine::Material.new(Engine::Shader.new('./shaders/mesh_vertex.glsl', './shaders/mesh_frag.glsl'))
  material.set_texture("image", Engine::Texture.for(ASSETS_DIR + "/chessboard.png").texture)
  material.set_texture("normalMap", Engine::Texture.for(ASSETS_DIR + "/brick_normal.png").texture)
  material.set_float("diffuseStrength", 0.5)
  material.set_float("specularStrength", 0.7)
  material.set_float("specularPower", 32.0)
  material.set_vec3("ambientLight", Vector[0.1, 0.1, 0.1])

  Engine::GameObject.new(
    "Sphere",
    pos: Vector[0, 0, -20],
    rotation: Vector[0, 0, 0],
    scale: Vector[1, 1, 1],
    components: [
      Engine::Components::MeshRenderer.new(
        Engine::Mesh.for("assets/sphere"), material),
    ]
  )
end

