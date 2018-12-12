defmodule DungeonCrawl.Heroes do
    alias DungeonCrawl.Character # esto nos permite crear un acceso a Character de manera directa

    def all, do: [
        %Character{
            name: "Knight",
            description: "Knight has strong defense and consistent damage.",
            hit_points: 18,
            max_hit_points: 18,
            damage_range: 4..5,
            attack_description: "a sword",
            score: 0
        },
        %Character{
            name: "Wizard",
            description: "Wizard has strong attack, but low health.",
            hit_points: 8,
            max_hit_points: 8,
            damage_range: 6..10,
            attack_description: "a fireball",
            score: 0
     
        },
        %Character{
            name: "Rouge",
            description: "Rouge has hight variety of attack damage.",
            hit_points: 12,
            max_hit_points: 12,
            damage_range: 1..12,
            attack_description: "a dagger",
            score: 0
        },
    ]
end