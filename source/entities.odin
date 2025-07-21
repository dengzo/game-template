package game

import "core:fmt"
import hm "handle-map/handle_map_static"

Entity_Handle :: hm.Handle

Entity :: struct {
	handle: Entity_Handle,
	pos: [2]f32,
}

PlayerIdle :: struct {

}

PlayerMoving :: struct {

}

PlayerState :: union {
	PlayerIdle,
	PlayerMoving,
}

Player :: struct {
	using entity: Entity,
	state: PlayerState,
}

Enemy :: struct {
	using entity: Entity,
	target: Entity_Handle,
}

players: hm.Handle_Map(Player, Entity_Handle, 2)
enemies: hm.Handle_Map(Enemy, Entity_Handle, 10)

test_entities :: proc() {
	player1 := hm.add(&players, Player { pos = { 5, 7 } })
	hm.add(&enemies, Enemy { pos = { 10, 12 }, target = player1 })

	for p in players.items {
		fmt.println(p)
	}

	for e in enemies.items {
		fmt.println(e)
	}
}


