require "ruby_rpg"
require_relative "mouse_spinner"

Engine.start do
  Engine::GameObject.create(
    name: "Camera",
    pos: Vector[0, 0, 0],
    components: [
      Engine::Components::PerspectiveCamera.create(fov: 45.0, aspect: 1920.0 / 1080.0, near: 0.1, far: 1000.0)
    ]
  )

  Engine::GameObject.create(
    name: "Light",
    rotation: Vector[-45, 45, 0],
    components: [
      Engine::Components::DirectionLight.create(colour: Vector[1.4, 1.4, 1.2])
    ]
  )

  Engine::StandardObjects::Cube.create(
    pos: Vector[0, 0, -5],
    components: [MouseSpinner.create(sensitivity: 0.5)]
  )
end
