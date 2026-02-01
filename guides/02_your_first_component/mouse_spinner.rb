class MouseSpinner < Engine::Component
  serialize :sensitivity

  def start
    Engine::Cursor.disable
  end

  def update(delta_time)
    delta = Engine::Input.mouse_delta
    game_object.rotation *= Engine::Quaternion.from_euler(
      Vector[delta[1], delta[0], 0] * @sensitivity
    )
  end
end
